package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.ExChangeDao;
import com.hjx.dao.UserToFlateDao;
import com.hjx.dao.UserToTopicDao;
import com.hjx.model.ExChange;
import com.hjx.model.UserToFlate;
import com.hjx.model.UserToTopic;
import com.hjx.service.ExChangeService;
import com.hjx.service.UserToFlateService;
import com.hjx.service.UserToTopicService;



@Service("userToTopicService")
@Transactional
public class UserToTopicServiceImpl extends BaseServiceImpl<UserToTopic> implements UserToTopicService {

	@Autowired
	private UserToTopicDao userToTopicDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.userToTopicDao;
	}
	@Override
	public boolean checkFous(UserToTopic userToTopic) {
		// TODO Auto-generated method stub
		return userToTopicDao.checkFous(userToTopic);
	}
	@Override
	public UserToTopic findFous(UserToTopic userToTopic) {
		// TODO Auto-generated method stub
		return userToTopicDao.findFous(userToTopic);
	}
	

}
