package com.hjx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.UserToTopicDao;
import com.hjx.model.UserToFlate;
import com.hjx.model.UserToTopic;

@Repository
public class UserToTopicDaoImpl extends BaseDaoImpl<UserToTopic> implements UserToTopicDao  {

	@Override
	public boolean checkFous(UserToTopic userToTopic) {
		List<UserToTopic> lists =this.getHibernateTemplate().find("from UserToTopic s where s.uid=? and s.tid=? ", new Object[]{userToTopic.getUid(),userToTopic.getTid()});
		return lists.size()==0?true:false;
	}

	@Override
	public UserToTopic findFous(UserToTopic userToTopic) {
		List<UserToTopic> lists =this.getHibernateTemplate().find("from UserToTopic s where s.uid=? and s.tid=? ", new Object[]{userToTopic.getUid(),userToTopic.getTid()});
		return lists.size()==0?null:lists.get(0);
	}


	

}
