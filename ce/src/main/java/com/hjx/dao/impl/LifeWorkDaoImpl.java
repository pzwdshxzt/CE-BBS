package com.hjx.dao.impl;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.LifeWorkDao;
import com.hjx.model.LifeWork;

@Repository
public class LifeWorkDaoImpl extends BaseDaoImpl<LifeWork> implements LifeWorkDao {

	@Override
	public LifeWork findLifeWork(LifeWork lifeWork) {
		@SuppressWarnings("unchecked")
		List<LifeWork> lists =this.getHibernateTemplate().find("from LifeWork s where s.uid=? "
				, new Object[]{lifeWork.getUid()});
		return lists.size()==0?null:lists.get(0);
	}

	@Override
	public boolean updateIsWorkFlag(LifeWork lifeWork) {
		if (lifeWork.getUid()!=null) {
			Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 session.clear();
			 String  hql= "update LifeWork t set t.isWork=? where t.uid=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,lifeWork.getIsWork());
			 query.setParameter(1,lifeWork.getUid());
			 Transaction tx= session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
		} else {
			return false;
		}
		
	}

	

}
