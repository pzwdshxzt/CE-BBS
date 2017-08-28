package com.hjx.core.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.hjx.util.PageResult;

/**
 * 
 * @author pkd
 *
 * @param <T>
 */
public interface IBaseService<T extends Serializable> {

	
	/**
	 * 根据id获取对象
	 * @param id 主键
	 * @return
	 */
	public T getObject(Serializable id);

	
	/**
	 * 添加对象
	 * @param entity 对象
	 */
	public void insertObject(T entity);

	
	/**
	 * 更新对象
	 * @param entity 对象
	 */
	public void updateObject(T  entity);

	
	/**
	 * 删除对象
	 * @param entity 对象
	 */
	public void deleteObject(T entity);

	
	/**
	 * 根据条件获取总记录数
	 * @param countHql  统计hql语句
	 * @param params  参数列表
	 * @return
	 */
	public int queryCountHql(String countHql, Map<String, ?> params);
	 

	/**
	 * 根据条件分页查询
	 * @param hql          hql语句
	 * @param countHql     统计hql语句
	 * @param params       参数列表
	 * @param offsetIndex  开始位置
	 * @param pageSize     每页显示记录数
	 * @return
	 */
	public PageResult queryHql(String hql, String countHql,
				Map<String, ?> params, int offsetIndex, int pageSize);
	
	/***
	  * Hql分页查询
	  * @param hql         hql语句
	  * @param pageSize    每页记录条数
	  * @param currentPage 当前页
	  * @param value       输入条件值
	  * @param strings   
	  * @return
	  */
	public PageResult searchPageHql(final Class<T> clazz,final String hql, final int pageSize,
			final int currentPage, final Object[] value,
			final String... strings);
	/**sql分页查询
	 * 
	 * @param sql         sql语句
	 * @param pageSize    每页记录条数
	 * @param currentPage 当前页
	 * @param value       输入条件值
	 * @param strings
	 * @return
	 */
	public PageResult searchPageSql(final String sql, final int pageSize,
			final int currentPage, final Object[] value,
			final String... strings);
	

	
	
	/**
	 * 使用hql语句查询对象
	 * @param hql     hql语句
	 * @param values  输入条件值
	 * @return
	 */
	public List<T> getAllCreateQuery(String hql, Object... values);
	
	
	
	/**
	 * 使用本地sql语句查询数据
	 * @param sql      sql语句
	 * @param values   输入条件值
	 * @return
	 */
	public List getAllCreateSQLQuery(String sql, Object... values);

	
	/**
	 * 批量修改sql语句
	 * @param sql   sql语句
	 */
    public void updateDeleteSql(String sql);
    
    
    
	//任意条件查询
	public PageResult findByManyUser(final int pageSize,
			final int currentPage, final String[] fields,final Object[] value);
	
	
    
 
}
