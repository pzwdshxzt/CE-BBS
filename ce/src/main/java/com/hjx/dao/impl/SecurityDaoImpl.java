package com.hjx.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.SecurityDao;
import com.hjx.model.Security;
import com.hjx.util.CommUtil;

@Repository
public class SecurityDaoImpl extends BaseDaoImpl<Security> implements SecurityDao {

	@SuppressWarnings("unchecked")
	@Override
	public Security loginSecurity(Security security) {
		String password=CommUtil.getMD5(security.getPassword());
		List<Security> lists =this.getHibernateTemplate().find("from Security s where s.securityEmail=? and s.password=?"
										, new Object[]{security.getSecurityEmail()
										,password});
		return lists.size()==0?null:lists.get(0);
	}

	@Override
	public boolean checkEmail(Security security) {
		@SuppressWarnings("unchecked")
		List<Security> lists =this.getHibernateTemplate().find("from Security s where s.securityEmail=? "
				, new Object[]{security.getSecurityEmail()});
		return lists.size()==0?true:false;
	
	}

	@Override
	public boolean updatePassword(Security security) {
		 if (security.getId()!=null) {
			 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 session.clear();
			 String  hql= "update Security t  set t.password=? where t.id=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,security.getPassword());
			 query.setParameter(1,security.getId());
			 Transaction tx= session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
		 }else{
			 return false;
		 }
		
	}

	@Override
	public Security findSecurity(Security security) {
		@SuppressWarnings("unchecked")
		List<Security> lists =this.getHibernateTemplate().find("from Security s where s.uid=? "
				, new Object[]{security.getUid()});
		return lists.size()==0?null:lists.get(0);
	}

	@Override
	public boolean updateEmail(Security security) {
		 if (security.getId()!=null) {
			 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 session.clear();
			 String  hql= "update Security t  set t.securityEmail=? where t.id=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,security.getSecurityEmail());
			 query.setParameter(1,security.getId());
			 Transaction tx= session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
		 }else{
			 return false;
		 }
	}

	@Override
	public boolean updateTel(Security security) {
		 if (security.getId()!=null) {
			 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 session.clear();
			 String  hql= "update Security t  set t.securityTEL=? where t.id=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,security.getSecurityTEL());
			 query.setParameter(1,security.getId());
			 Transaction tx= session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
		 }else{
			 return false;
		 }
	}

	@Override
	public Security findSecurityByEmail(Security security) {
		List<Security> lists =this.getHibernateTemplate().find("from Security s where s.securityEmail=? "
				, new Object[]{security.getSecurityEmail()});
		return lists.size()==0?null:lists.get(0);
	}
	

}
