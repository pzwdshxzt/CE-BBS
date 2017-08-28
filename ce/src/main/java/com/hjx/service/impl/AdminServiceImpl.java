package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.AdminDao;
import com.hjx.model.Admin;
import com.hjx.service.AdminService;

@Service("adminService")
@Transactional
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService {

	@Autowired
	private AdminDao adminDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.adminDao;
	}
	@Override
	public Admin checkIn(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.checkIn(admin);
	}
	@Override
	public boolean deleteFlag(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.deleteFlag(admin);
	}


}
