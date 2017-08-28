package com.hjx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.LifeEduDao;
import com.hjx.model.LifeEdu;

@Repository
public class LifeEduDaoImpl extends BaseDaoImpl<LifeEdu>  implements LifeEduDao {

	
	//查找Uid
	@Override
	public LifeEdu findLifeEdu(LifeEdu lifeEdu) {
		@SuppressWarnings("unchecked")
		List<LifeEdu> lists =this.getHibernateTemplate().find("from LifeEdu s where s.uid=? "
				, new Object[]{lifeEdu.getUid()});
		return lists.size()==0?null:lists.get(0);
	}

}
