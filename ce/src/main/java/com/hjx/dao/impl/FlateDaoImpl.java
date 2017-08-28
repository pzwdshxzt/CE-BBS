package com.hjx.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.FlateDao;
import com.hjx.model.Flate;

@Repository
public class FlateDaoImpl extends BaseDaoImpl<Flate> implements FlateDao {

	@Override
	public boolean deleteFlag(Flate flate) {
		 if (flate.getFlateId()!=null) {
		 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		 String  hql= "update Flate t  set t.deleteFlag=? where t.flateId=? ";
		 Query query=session.createQuery(hql);
		 query.setParameter(0,(byte) 1);
		 query.setParameter(1,flate.getFlateId());
		 Transaction tx= session.beginTransaction();
		 query.executeUpdate();
		 tx.commit(); 
		 return true;
			
		 }else {
				
			 return false;
		 }
	}

}
