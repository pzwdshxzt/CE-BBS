package com.hjx.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.UserDao;
import com.hjx.model.Security;
import com.hjx.model.User;
import com.hjx.util.CommUtil;
import com.hjx.vo.UserVo;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	/*@Override
	public UserVo findUser(User user) {
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		SQLQuery query=	session.createSQLQuery("select u.*,e.*,le.*,lw.*,s.* "
										+"from t_user u,t_exchange e,t_lifeedu le,t_lifework lw,t_security s "
										+"where u.deleteFlag=0 and e.uid=u.userId and le.uid=u.userId and  s.uid=u.userId and lw.uid=u.userId  and u.userId="
										+user.getUserId());
		List list=query.list();
		return list.size()==0?null:CommUtil.transformu(list).get(0);
	}*/

	@Override
	public Integer addUser(User user) {
		// TODO Auto-generated method stub
		return (Integer) this.getHibernateTemplate().save(user);
	}

	@Override
	public boolean updateUser(User user) {
		if (user.getUserId()==null) {
			return false;
		}else{
			 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 session.clear();
			 String  hql= "update User t  set t.hide=? ,t.userName=? ,t.birthDay=?,t.sex=?,t.address=? where t.userId=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,user.getHide());
			 query.setParameter(1,user.getUserName());
			 query.setParameter(2,user.getBirthDay());
			 query.setParameter(3,user.getSex());
			 query.setParameter(4,user.getAddress());
			 query.setParameter(5,user.getUserId());
			 Transaction tx= session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
		}
	}

	@Override
	public boolean deleteUser(User user) {
		 if (user.getUserId()!=null) {
			 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			 String  hql= "update User t  set t.deleteFlag=? where t.userId=? ";
			 Query query=session.createQuery(hql);
			 query.setParameter(0,(byte) 1);
			 query.setParameter(1,user.getUserId());
			 Transaction tx=session.beginTransaction();
			 query.executeUpdate();
			 tx.commit(); 
			 return true;
			 }else {
				 return false;
			 }
	}

	@Override
	public boolean checkUsername(User user) {
		@SuppressWarnings("unchecked")
		List<Security> lists =this.getHibernateTemplate().find("from User s where s.deleteFlag=0 and s.userName=? "
				, new Object[]{user.getUserName()});
		return lists.size()==0?true:false;
	}
}
