package com.hjx.core.dao.impl;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.engine.SessionFactoryImplementor;
import org.hibernate.hql.ast.QueryTranslatorImpl;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.IBaseDao;
import com.hjx.util.PageResult;
import com.hjx.util.ReflectUtils;
import com.hjx.util.StringUtil;


/**
 * 
 * @author pkd
 * 
 */

@Repository
public abstract class BaseDaoImpl<T extends Serializable> extends
		HibernateDaoSupport implements IBaseDao<T> {

	protected Class<T> entityClass;
	/**
	 * ThreadLocal并不是一个Thread，而是Thread的局部变量。
	 */
	private static ThreadLocal<Boolean> tlCacheable = new ThreadLocal<Boolean>();
	private static ThreadLocal<String> tlRegion = new ThreadLocal<String>();

	protected final Log log = LogFactory.getLog(getClass());

	public BaseDaoImpl() {
		entityClass = ReflectUtils.getClassGenricType(getClass());
	}

	public boolean getCacheable() {
		Boolean c = (Boolean) tlCacheable.get();
		return c == null ? false : c.booleanValue();
	}

	public String getRegion() {
		String c = (String) tlRegion.get();
		return c;
	}

	public void setCacheable(boolean cacheable) {
		Boolean c = Boolean.valueOf(cacheable);
		tlCacheable.set(c);
	}

	public void setRegion(String region) {
		tlRegion.set(region);
	}

	public List findByHql(String hql) {
		return getHibernateTemplate().find(hql);
	}

	public List findByHql(String hql, Object... values) {
		return getHibernateTemplate().find(hql, values);
	}

	public <X> X get(final Class<X> clazz, final Serializable id) {
		return (X) getHibernateTemplate().get(clazz, id);
	}

	public T get(Serializable id) {
		return get(entityClass, id);
	}

	public void delete(T entity) {
		getHibernateTemplate().delete(entity);
		log.info("用户对象删除了！");
	}

	public void deleteByPK(Serializable id) {
		T instance = get(id);
		if (instance != null) {
			getHibernateTemplate().delete(instance);
		}
	}

	public void save(T entity) {
	 	getHibernateTemplate().save(entity);
		log.info("用户对象保存了！");
	}

	public void saveOrUpdate(T entity) {
		getHibernateTemplate().saveOrUpdate(entity);
	}

	public void update(T entity) {
		getHibernateTemplate().update(entity);
		log.info("用户对象更新了！");
	}

	public List<T> createQuery(String hql, Object... values) {
		Query query = getSession().createQuery(hql);
		int j = values.length;
		for (int i = 0; i < j; i++)
			query.setParameter(i, values[i]);
		return query.list();
	}

	public List<T> createSQLQuery(String sql, Object... values) {
		SQLQuery query = getSession().createSQLQuery(sql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.list();
	}

	public int queryCountHql(String countHql, Map<String, ?> params) {
		Query query = getSession().createQuery(countHql);
		query.setProperties(params);
		Object count = query.uniqueResult();
		if ((count instanceof Number)) {
			return ((Number) count).intValue();
		}
		return 0;
	}

	public PageResult queryHql(String hql, String countHql,
			Map<String, ?> params, int offsetIndex, int pageSize) {
		PageResult pr = new PageResult(0,pageSize);
		if (!StringUtil.isNullOrBlank(countHql)) {
			pr.setTotalCount(queryCountHql(countHql, params));
		}

		if (pageSize > 0) {
			int totalCount = pr.getTotalCount();
			int totalPage = (totalCount + pageSize - 1) / pageSize;
			pr.setPageSize(pageSize);
			pr.setTotalPage(totalPage);

			int startIndex = offsetIndex;
			if (startIndex >= totalCount) {
				startIndex -= pageSize;
			}
			if (startIndex < 0) {
				startIndex = 0;
			}
			int currentPage = (startIndex + pageSize) / pageSize;
			pr.setStartIndex(startIndex);
			pr.setCurrentPage(currentPage);
		} else if (pageSize == 0) {
			return pr;
		}

		Query query = getSession().createQuery(hql);

		// 查询缓存
		query.setCacheable(getCacheable());
		// 可以设置缓存区域
		query.setCacheRegion(getRegion());

		query.setProperties(params);

		if (pr.getPageSize() > 0) {
			query.setFirstResult(pr.getStartIndex());
			query.setMaxResults(pr.getPageSize());
		}
		List content = query.list();
		pr.setContents(content);
		return pr;
	}

	public PageResult queryPageHql(final Class<T> clazz, final String hql,
			final int pageSize, final int currentPage, final Object[] value,
			final String... strings) {
		List list = (List) getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						if (value != null) {
							for (int i = 0; i < value.length; i++) {
								query.setParameter(i, value[i]);
							}
						}
						query.setFirstResult((currentPage - 1) * pageSize)
								.setMaxResults(pageSize);
						if (query.list().size() == 0 && (currentPage - 1) > 0) {
							query.setFirstResult((currentPage - 2) * pageSize)
									.setMaxResults(pageSize);
						}
						return query.list();
					}
				});

		if (list == null) {
			return null;
		}
		String unit = "";
		PageResult pageResult = new PageResult(currentPage, pageSize);
		int total = getCountByHql(hql, value, strings);
		pageResult.setTotalCount(total);
		if (pageResult.getTotalPage() < currentPage) {
			pageResult.setCurrentPage(pageResult.getTotalPage());
		}
		if (clazz != null) {
			pageResult.setContents(list);
		} else {
			List maplist = new ArrayList();
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				HashMap map = new HashMap();
				Object[] obj = (Object[]) iter.next();
				for (int i = 0; i < obj.length; i++) {
					unit = "file" + i;
					map.put(unit, obj[i]);
				}
				maplist.add(map);
			}
			pageResult.setContents(maplist);
		}

		return pageResult;
	}

	public PageResult queryPageSql(final String sql, final int pageSize,
			final int currentPage, final Object[] value,
			final String... strings) {
		List list = (List) getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createSQLQuery(sql);
						if (value != null) {
							for (int i = 0; i < value.length; i++) {
								query.setParameter(i, value[i]);
							}
						}
						query.setFirstResult((currentPage - 1) * pageSize)
								.setMaxResults(pageSize);
						if (query.list().size() == 0 && (currentPage - 1) > 0) {
							query.setFirstResult((currentPage - 2) * pageSize)
									.setMaxResults(pageSize);
						}
						return query.list();
					}
				});

		if (list == null) {
			return null;
		}

		String unit = "";
		PageResult pageResult = new PageResult(currentPage, pageSize);

		int total = getCountBySql(sql, value, strings);
		pageResult.setTotalCount(total);
		if (pageResult.getTotalPage() < currentPage) {
			pageResult.setCurrentPage(pageResult.getTotalPage());
		}

		List maplist = new ArrayList();
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			HashMap map = new HashMap();
			Object[] obj = (Object[]) iter.next();
			for (int i = 0; i < obj.length; i++) {
				unit = "file" + i;
				map.put(unit, obj[i]);
			}
			maplist.add(map);
		}
		pageResult.setContents(maplist);
		return pageResult;
	}

	public void updateDeleteSql(final String sql) {
		getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						SQLQuery query = session.createSQLQuery(sql);
						return query.executeUpdate();
					}
				});
	}

	@SuppressAjWarnings("rawtype")
	public int getCountByHql(final String _hql, final Object[] _values,
			final String... inputstr) {
		int hqlFromIndex = _hql.indexOf("from");
		int hqlOrderbyIndex = _hql.indexOf("order by");
		int hqldistinct = _hql.indexOf("distinct");
		int hqlsum = _hql.indexOf("sum");
		int hqlcount = _hql.indexOf("count");
		String hqlCount = "";
		String sqlCount = "";
		if (hqldistinct < 0 && hqlsum < 0 && inputstr.length <= 0
				&& hqlcount < 0) {
			// 因为此方法只取得的结果总数，所以将查询语句中可能存在的排序语句去掉来提高查询效率
			if (hqlOrderbyIndex > 0) {
				hqlCount = "select count(*)"
						+ _hql.substring(hqlFromIndex, hqlOrderbyIndex);
			} else {
				hqlCount = "select count(*) " + _hql.substring(hqlFromIndex);
			}
		} else {
			QueryTranslatorImpl queryTranslator = new QueryTranslatorImpl(_hql,
					_hql, Collections.emptyMap(),
					(SessionFactoryImplementor) this.getSessionFactory());
			queryTranslator.compile(Collections.emptyMap(), false);
			String temSQL = queryTranslator.getSQLString();
			Session session = super.getSession(true);
			sqlCount = "select count(*) from (" + temSQL + ")tmp_count_t";
			Query query = session.createSQLQuery(sqlCount);
			if (_values != null) {
				for (int i = 0; i < _values.length; i++) {
					query.setParameter(i, _values[i]);
				}
			}
			List countList = query.list();
			session.close();
			BigInteger countBigDecimal = countList == null
					|| countList.size() <= 0 ? new BigInteger("1")
					: (BigInteger) ((countList.get(0)));
			String str = String.valueOf(countBigDecimal.longValue());
			return Integer.valueOf(str);
		}
		List countList = getHibernateTemplate().find(hqlCount, _values);
		if (countList.size() > 1) {
			return countList.size() > 0 ? countList.size() : 0;
		} else {
			return countList.size() > 0 ? Integer.valueOf(String
					.valueOf(countList.get(0))) : 0;
		}
	}

	@SuppressAjWarnings("rawtype")
	public int getCountBySql(final String _sql, final Object[] _values,
			final String... inputstr) {
		int sqlFromIndex = _sql.indexOf("from");
		int sqlOrderbyIndex = _sql.indexOf("order by");
		int sqldistinct = _sql.indexOf("distinct");
		int sqlsum = _sql.indexOf("sum");
		int sqlcount = _sql.indexOf("count");
		String sqlCount = "";
		Session session = super.getSession(true);
		if (sqldistinct < 0 && sqlsum < 0 && inputstr.length <= 0
				&& sqlcount < 0) {
			// 因为此方法只取得的结果总数，所以将查询语句中可能存在的排序语句去掉来提高查询效率
			if (sqlOrderbyIndex > 0) {
				sqlCount = "select count(*)"
						+ _sql.substring(sqlFromIndex, sqlOrderbyIndex);
			} else {
				sqlCount = "select count(*) " + _sql.substring(sqlFromIndex);
			}
		} else {
			sqlCount = "select count(*) from (" + _sql + ")tmp_count_t";
			Query query = session.createSQLQuery(sqlCount);
			if (_values != null) {
				for (int i = 0; i < _values.length; i++) {
					query.setParameter(i, _values[i]);
				}
			}
			List countList = query.list();
			BigInteger countBigDecimal = countList == null
					|| countList.size() <= 0 ? new BigInteger("1")
					: (BigInteger) ((countList.get(0)));
			String str = String.valueOf(countBigDecimal.longValue());
			session.close();
			return Integer.valueOf(str);
		}
		Query query = session.createSQLQuery(sqlCount);
		if (_values != null) {
			for (int i = 0; i < _values.length; i++) {
				query.setParameter(i, _values[i]);
			}
		}
		List countList = query.list();
		releaseSession(session);
		if (countList.size() > 1) {
			return countList.size() > 0 ? countList.size() : 0;
		} else {
			return countList.size() > 0 ? Integer.valueOf(String
					.valueOf(countList.get(0))) : 0;
		}
	}

	public PageResult findByManyUser(final int pageSize, final int currentPage,
			final String[] fields, final Object[] value) {
		StringBuffer sb = new StringBuffer();
		String sbtostr = null;
		sb.append("from " + entityClass.getName() + " o");
		if (fields.length != 0) {
			if (fields.length != value.length) {
				throw new RuntimeException("字段名名与值不相等！");
			} else {
				sb.append(" where ");
				for (int i = 0; i < fields.length; i++) {
					sb.append(fields[i] + "=? and  ");
				}
				sbtostr = sb.toString();
				sbtostr = sbtostr.substring(0, sbtostr.lastIndexOf("and"));
				System.out.println(sbtostr);
			}
		} else {
			sbtostr = sb.toString();
		}

		PageResult pageResult = queryPageHql(entityClass, sbtostr, pageSize,
				currentPage, value);
		return pageResult;
	}

}