package com.hjx.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.AdminLogDao;
import com.hjx.model.AdminLog;
import com.hjx.service.AdminLogService;

@Service("adminLogService")
@Transactional
public class AdminLogServiceImpl extends BaseServiceImpl<AdminLog> implements AdminLogService {

	@Autowired
	private AdminLogDao adminLogDao;
	
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.adminLogDao;
	}

	

}
