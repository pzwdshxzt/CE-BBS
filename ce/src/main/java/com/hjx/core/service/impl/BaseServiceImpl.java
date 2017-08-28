package com.hjx.core.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.IBaseService;
import com.hjx.util.PageResult;


/**
 * 
 * @author pkd
 * 
 * @param <T>
 */
@Service
public abstract class BaseServiceImpl<T extends Serializable> implements
		IBaseService<T> {

	@SuppressWarnings("rawtypes")
	protected abstract IBaseDao getDao();

	@SuppressWarnings("unchecked")
	public T getObject(Serializable id) {
		return (T) getDao().get(id);
	}

	@SuppressWarnings("unchecked")
	public void insertObject(T entity) {
		getDao().save(entity);
	}

	@SuppressWarnings("unchecked")
	public void updateObject(T entity) {
		getDao().update(entity);
	}

	@SuppressWarnings("unchecked")
	public void deleteObject(T entity) {
		getDao().delete(entity);
	}

	@SuppressWarnings("unchecked")
	public int queryCountHql(String countHql, Map<String, ?> params) {
		return getDao().queryCountHql(countHql, params);
	}

	@SuppressWarnings("unchecked")
	public PageResult queryHql(String hql, String countHql,
			Map<String, ?> params, int offsetIndex, int pageSize) {
		return getDao().queryHql(hql, countHql, params, offsetIndex, pageSize);
	}
	
	
	public List<T> getAllCreateQuery(String hql, Object... values)
	{
		return getDao().createQuery(hql,values);
	}
	
	public List getAllCreateSQLQuery(String sql, Object... values)
	{
		return getDao().createSQLQuery(sql, values);
	}
    /**
     * 批量删除修改语句
     */
	public void updateDeleteSql(String sql){
		getDao().updateDeleteSql(sql);
	}
	/***
	  * Hql分页查询
	  * @param hql 
	  * @param pageSize    每页记录条数
	  * @param currentPage 当前页
	  * @param value       输入条件值
	  * @param strings   
	  * @return
	  */
	public PageResult searchPageHql(final Class<T> clazz,final String hql, final int pageSize,
			final int currentPage, final Object[] value,
			final String... strings){
		return getDao().queryPageHql(clazz,hql, pageSize, currentPage, value, strings);
	}
	/**sql分页查询
	 * 
	 * @param sql
	 * @param pageSize    每页记录条数
	 * @param currentPage 当前页
	 * @param value       输入条件值
	 * @param strings
	 * @return
	 */
	public PageResult searchPageSql(final String sql, final int pageSize,
			final int currentPage, final Object[] value,
			final String... strings){
	   return getDao().queryPageSql(sql, pageSize, currentPage, value, strings);
	}
	
	
	
	
	public PageResult findByManyUser(final int pageSize,
			final int currentPage, final String[] fields,final Object[] value)
	{
		return getDao().findByManyUser(pageSize, currentPage, fields, value);
	}

}
