package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.UserToUser;

public interface UserToUserDao extends IBaseDao<UserToUser>{
	

	/**
	 * 检验是否关注这个用户
	 * @param userToUser
	 * @return boolean
	 */
	public boolean checkFous(UserToUser userToUser);

	/**
	 * 查找是否关注这个用户
	 * @param userToUser
	 * @return UserToUser
	 */
	public UserToUser findFous(UserToUser userToUser);
}
