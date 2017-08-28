package com.hjx.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.AdminDao;
import com.hjx.model.Admin;

@Repository
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao {

	@Override
	public Admin checkIn(Admin admin) {
		List<Admin> lists =this.getHibernateTemplate().find("from Admin s where s.username=? and s.password=? and s.deleteFlag=?", new Object[]{admin.getUsername(),admin.getPassword(),(byte)0});
		return lists.size()==0?null:lists.get(0);
	}

	@Override
	public boolean deleteFlag(Admin admin) {
		 if (admin.getAdminId()!=null) {
			 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 String  hql= "update Admin t  set t.deleteFlag=? where t.adminId=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,(byte) 1);
			 query.setParameter(1,admin.getAdminId());
			 Transaction tx=session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
			 }else {
				 return false;
			 }
	}

}
