package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.Admin;
import com.hjx.model.Flate;

public interface AdminService extends IBaseService<Admin> {

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
