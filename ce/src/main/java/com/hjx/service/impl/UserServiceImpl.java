package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.UserDao;
import com.hjx.model.User;
import com.hjx.service.UserService;
import com.hjx.util.PageResult;
import com.hjx.vo.UserVo;

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Autowired
	private UserDao userDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.userDao;
	}
	
	/*@Override
	public UserVo findUser(User user) {
		// TODO Auto-generated method stub
		return userDao.findUser(user);
	}*/

	@Override
	public Integer addUser(User user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(user);
	}

	@Override
	public boolean checkUsername(User user) {
		// TODO Auto-generated method stub
		return userDao.checkUsername(user);
	}
	

}
