package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.ExChangeDao;
import com.hjx.dao.UserToFlateDao;
import com.hjx.model.ExChange;
import com.hjx.model.UserToFlate;
import com.hjx.service.ExChangeService;
import com.hjx.service.UserToFlateService;



@Service("userToFlateService")
@Transactional
public class UserToFlateServiceImpl extends BaseServiceImpl<UserToFlate> implements UserToFlateService {

	@Autowired
	private UserToFlateDao userToFlateDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.userToFlateDao;
	}
	@Override
	public boolean checkFous(UserToFlate userToFlate) {
		// TODO Auto-generated method stub
		return userToFlateDao.checkFous(userToFlate);
	}
	@Override
	public UserToFlate findFous(UserToFlate userToFlate) {
		// TODO Auto-generated method stub
		return userToFlateDao.findFous(userToFlate);
	}
	

}
