package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.ExChange;
import com.hjx.model.Security;
import com.hjx.model.UserToFlate;

public interface UserToFlateDao extends IBaseDao<UserToFlate>{
	
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
