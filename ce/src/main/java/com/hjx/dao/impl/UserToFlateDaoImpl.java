package com.hjx.dao.impl;




import java.util.List;

import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.UserToFlateDao;
import com.hjx.model.Admin;
import com.hjx.model.UserToFlate;

@Repository
public class UserToFlateDaoImpl extends BaseDaoImpl<UserToFlate> implements UserToFlateDao  {

	@Override
	public boolean checkFous(UserToFlate userToFlate) {
		List<UserToFlate> lists =this.getHibernateTemplate().find("from UserToFlate s where s.uid=? and s.fid=? ", new Object[]{userToFlate.getUid(),userToFlate.getFid()});
		return lists.size()==0?true:false;
	}

	@Override
	public UserToFlate findFous(UserToFlate userToFlate) {
		List<UserToFlate> lists =this.getHibernateTemplate().find("from UserToFlate s where s.uid=? and s.fid=? ", new Object[]{userToFlate.getUid(),userToFlate.getFid()});
		return lists.size()==0?null:lists.get(0);
	}


	

}
