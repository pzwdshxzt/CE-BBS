package com.hjx.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.ReplyDao;
import com.hjx.model.Reply;
import com.hjx.model.User;
import com.hjx.util.CommUtil;
import com.hjx.vo.ReplyVo;

@Repository
public class ReplyDaoImpl extends BaseDaoImpl<Reply> implements ReplyDao {

	@Override
	public Boolean deleteReply(Reply reply) {
		 
		if (reply.getReplyId()!=null) {
		 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		 String  hql= "update Reply t  set t.deleteFlag=? where t.replyId=? ";
		 Query query=session.createQuery(hql);
		 query.setParameter(0,(byte) 1);
		 query.setParameter(1, reply.getReplyId());
		 Transaction tx= session.beginTransaction();
		 query.executeUpdate();
		 tx.commit(); 
		 return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Reply> seachReply(String seach) {
		  Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		    Transaction tx = session.beginTransaction(); 
		    String sql = "SELECT * FROM t_reply t WHERE t.deleteFlag=0 AND (t.replyContent LIKE '%"+seach+"%')"; 
		    List list = session.createSQLQuery(sql). 
		                addEntity(Reply.class).    //指定将查询的记录行转换成Reply实体 
		                list();      
		    tx.commit(); 
		    session.close(); 
		return list;
	}

	@Override
	public List<ReplyVo> findReply(User user) {
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		SQLQuery query=	session.createSQLQuery("select t.title,u.userName,u.imageUrl,r.* "
				+"  from t_topic t,t_reply r,t_user u "
				+"	where t.deleteFlag=u.deleteFlag=r.deleteFlag=0 "
				+"	and u.userId=r.uid  and r.tid=t.topicId and u.userId="+user.getUserId()
				+"	GROUP BY r.replyId");
		List list=query.list();
	    return list.size()==0?null:CommUtil.transformr(list);
	}

	
}
