package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.Admin;

public interface AdminDao extends IBaseDao<Admin> {

	/**
	 * 管理员检验登录
	 * @param admin
	 * @return
	 */
	public Admin checkIn(Admin admin);
	
	/**
	 * 修改删除Flag
	 * @param标记 admin
	 * @return
	 */
	public boolean deleteFlag(Admin admin);
}
