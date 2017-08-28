package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.UserToFlate;
import com.hjx.model.UserToTopic;
import com.hjx.model.UserToUser;

public interface UserToUserService extends IBaseService<UserToUser> {

	
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
