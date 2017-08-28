package com.hjx.dao.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.ExChangeDao;
import com.hjx.model.ExChange;
import com.hjx.model.LifeWork;

@Repository
public class ExChangeDaoImpl extends BaseDaoImpl<ExChange> implements ExChangeDao  {

	@Override
	public ExChange findExChange(ExChange exChange) {
		@SuppressWarnings("unchecked")
		List<ExChange> lists =this.getHibernateTemplate().find("from ExChange s where s.uid=? "
				, new Object[]{exChange.getUid()});
		return lists.size()==0?null:lists.get(0);
	}

	

}
