package com.hjx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.TopicDao;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.service.TopicService;
import com.hjx.util.PageResult;
import com.hjx.vo.TopicVo;

@Service("topicService")
@Transactional
public class TopicServiceImpl extends BaseServiceImpl<Topic> implements TopicService {

	
	@Autowired
	private TopicDao topicDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.topicDao;
	}
	@Override
	public Boolean deleteTopic(Topic topic) {
		return topicDao.deleteTopic(topic);
		
	}
	@Override
	public Boolean changeStick(Topic topic) {
		// TODO Auto-generated method stub
		return topicDao.changeStick(topic);
	}
	@Override
	public List<Topic> seachTopic(String seach) {
		// TODO Auto-generated method stub
		return topicDao.seachTopic(seach);
	}
	@Override
	public Boolean changeFindFlag(Topic topic) {
		// TODO Auto-generated method stub
		return topicDao.changeFindFlag(topic);
	}
	@Override
	public List<Topic> seachFxTopic(String seach) {
		// TODO Auto-generated method stub
		return topicDao.seachFxTopic(seach);
	}
	
	@Override
	public TopicVo findTopic(Topic topic) {
		// TODO Auto-generated method stub
		return topicDao.findTopic(topic);
	}
	@Override
	public List<TopicVo> findTopic(User user) {
		// TODO Auto-generated method stub
		return topicDao.findTopic(user);
	}


}
