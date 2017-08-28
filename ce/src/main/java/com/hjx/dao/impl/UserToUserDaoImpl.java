package com.hjx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.UserToUserDao;
import com.hjx.model.UserToTopic;
import com.hjx.model.UserToUser;

@Repository
public class UserToUserDaoImpl extends BaseDaoImpl<UserToUser> implements UserToUserDao  {

	@Override
	public boolean checkFous(UserToUser userToUser) {
		List<UserToUser> lists =this.getHibernateTemplate().find("from UserToUser s where s.uid=? and s.ued=? ", new Object[]{userToUser.getUid(),userToUser.getUed()});
		return lists.size()==0?true:false;
	}

	@Override
	public UserToUser findFous(UserToUser userToUser) {
		List<UserToUser> lists =this.getHibernateTemplate().find("from UserToUser s where s.uid=? and s.ued=? ", new Object[]{userToUser.getUid(),userToUser.getUed()});
		return lists.size()==0?null:lists.get(0);
	}
	

}
