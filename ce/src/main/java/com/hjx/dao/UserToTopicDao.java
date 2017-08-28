package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.ExChange;
import com.hjx.model.Security;
import com.hjx.model.UserToFlate;
import com.hjx.model.UserToTopic;

public interface UserToTopicDao extends IBaseDao<UserToTopic>{

	/**
	 * 检验是否关注这个话题
	 * @param userToTopic
	 * @return boolean
	 */
	public boolean checkFous(UserToTopic userToTopic);
	

	/**
	 * 查找是否关注这个话题
	 * @param userToTopic
	 * @return UserToTopic
	 */
	public UserToTopic findFous(UserToTopic userToTopic);

}
