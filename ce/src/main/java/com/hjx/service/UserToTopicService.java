package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.UserToFlate;
import com.hjx.model.UserToTopic;

public interface UserToTopicService extends IBaseService<UserToTopic> {

	
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
