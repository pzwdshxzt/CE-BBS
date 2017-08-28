package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.UserToUserDao;
import com.hjx.model.UserToUser;
import com.hjx.service.UserToUserService;



@Service("userToUserService")
@Transactional
public class UserToUserServiceImpl extends BaseServiceImpl<UserToUser> implements UserToUserService {

	@Autowired
	private UserToUserDao userToUserDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.userToUserDao;
	}
	@Override
	public boolean checkFous(UserToUser userToUser) {
		// TODO Auto-generated method stub
		return userToUserDao.checkFous(userToUser);
	}
	@Override
	public UserToUser findFous(UserToUser userToUser) {
		// TODO Auto-generated method stub
		return userToUserDao.findFous(userToUser);
	}
	

}
