package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.UserToFlate;

public interface UserToFlateService extends IBaseService<UserToFlate> {

	/**
	 * 检验是否关注这个板块
	 * @param userToFlate
	 * @return boolean
	 */
	public boolean checkFous(UserToFlate userToFlate);
	
	/**
	 * 查找是否关注这个板块
	 * @param userToFlate
	 * @return UserToFlate
	 */
	public UserToFlate findFous(UserToFlate userToFlate);
}
