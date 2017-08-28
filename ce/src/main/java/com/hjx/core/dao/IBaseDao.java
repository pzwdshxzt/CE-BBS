package com.hjx.core.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.hjx.util.PageResult;




/**
 * 
 * @author pkd
 *
 */

public interface IBaseDao<T extends Serializable> {

	/**
	 * 根据id查询对象
	 * @param clazz 类名
	 * @param id 主键
	 * @return
	 */
	   public <X> X get(final Class<X> clazz, final Serializable id);
	   
	  /**
	   * 根据id查询对象
	   * @param id 主键
	   * @return
	   */
	   public T get(Serializable id);
	   
	   /**
	    * 删除对象
	    * @param entity 对象名
	    */
	   
	   public void delete(T entity);
	   
	   
	   /**
	    * 保存对象
	    * @param entity  对象名
	    */
	   
	   public void save(T entity);
	   
	   /**
	    * 更新对象
	    * @param entity  对象名
	    */
	   
	   public void update(T entity);
	      

	   /**
	    * hql查询不分页
	    * @param hql hql语句
	    * @param values 参数数组
	    * @return
	    */
	   public List<T> createQuery(String hql, Object... values);
	   /**
	    * 本地查询不分页
	    * @param sql   sql语句
	    * @param values 参数数组
	    * @return
	    */
	   
	   public List<T> createSQLQuery(String sql,Object... values);
	   
	   /**
	    * hql条件查询记录数
	    * @param countHql 统计hql语句
	    * @param params  参数列表
	    * @return
	    */
	   public int queryCountHql(String countHql, Map<String, ?> params);
	   
	   /**
	    * hql条件查询分页
	    * @param hql hql语句
	    * @param countHql 统计hql语句
	    * @param params 参数列表
	    * @param offsetIndex 从第几个记录开始
	    * @param pageSize  每页多少个记录
	    * @return
	    */
	   public PageResult queryHql(String hql, String countHql,
				Map<String, ?> params, int offsetIndex, int pageSize);
	   
	   
	   
	   /**
	    * 批量删除修改
	    * @param sql
	    */
	   public void updateDeleteSql(final String sql);
	   /***
		  * Hql分页查询
		  * @param hql 
		  * @param pageSize    每页记录条数
		  * @param currentPage 当前页
		  * @param value       输入条件值
		  * @param strings   
		  * @return
		  */
	   
		public PageResult queryPageHql(final Class<T> clazz,final String hql, final int pageSize,
				final int currentPage, final Object[] value,final String... strings);
		/**sql分页查询
		 * 
		 * @param sql
		 * @param pageSize    每页记录条数
		 * @param currentPage 当前页
		 * @param value       输入条件值
		 * @param strings
		 * @return
		 */
		
		public PageResult queryPageSql(final String sql, final int pageSize,
				final int currentPage, final Object[] value,
				final String... strings);
		/**
		 * 根据HQL查询全部
		 */
		public List findByHql(String hql);
		/***
		 * 根据HQL查询带条件
		 * @param hql hql语句
		 * @param values 参数数组
		 * @return
		 */
		public List findByHql(String hql,Object... values);
		
		/***
		 * 删除主键所对应的持久化对象
		 * @param id 主键
		 */
		public void deleteByPK(Serializable id);
		
		
		/**
		 * 更新和删除对象
		 * @param entity 对象
		 */
		 public void saveOrUpdate(T entity);
		 
		
		 
		 /**
		  * 任意条件等值查询
		  * @param pageSize  每页记录条数
		  * @param currentPage  当前页
		  * @param fields   对象的属性数组
		  * @param value    对象的属性值数组
		  * @return
		  */
				 
			public PageResult findByManyUser(final int pageSize,
					final int currentPage, final String[] fields,final Object[] value);

}
