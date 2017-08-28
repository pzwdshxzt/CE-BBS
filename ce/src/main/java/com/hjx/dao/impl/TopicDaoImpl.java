package com.hjx.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import com.hjx.core.dao.impl.BaseDaoImpl;
import com.hjx.dao.TopicDao;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.util.AliyunOSSUtil;
import com.hjx.util.CommUtil;
import com.hjx.vo.TopicVo;

@Repository //注释用于标注数据访问组件，即DAO组件
public class TopicDaoImpl extends BaseDaoImpl<Topic> implements TopicDao {

	@Override
	public Boolean deleteTopic(Topic topic) {
		// TODO Auto-generated method stub 
		if (topic.getTopicId()!=null) {
		 Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		 String  hql= "update Topic t  set t.deleteFlag=? where t.topicId=? ";
		 Query query=session.createQuery(hql);
		 query.setParameter(0,(byte) 1);
		 query.setParameter(1,topic.getTopicId());
		 Transaction tx= session.beginTransaction();
		 query.executeUpdate();
		 tx.commit(); 
		 return true;
		 }else {
			 return false;
		 }
		
	}

	@Override
	public Boolean changeStick(Topic topic) {
		
		if (topic.getTopicId()!=null||topic.getState()>1||topic.getState()<0) {
			byte s=0;
			if (topic.getState()==0) {
				s=1;
			}
			Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			String  hql= "update Topic t  set t.state=? where t.topicId=? ";
			Query query=session.createQuery(hql);
			query.setParameter(0,s);
			query.setParameter(1,topic.getTopicId());
			Transaction tx= session.beginTransaction();
			query.executeUpdate();
			tx.commit(); 
			return true;
		}else {
			return false;
		}
		
		
	}

	@Override
	public List<Topic> seachTopic(String seach) {
		  Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		    Transaction tx = session.beginTransaction(); 
		    String sql = "SELECT * FROM t_topic t WHERE t.deleteFlag=0 AND (t.title LIKE '%"
		    		+seach+"%' OR t.content LIKE '%"+seach+"%')"; 
		    List list = session.createSQLQuery(sql). 
		                addEntity(Topic.class).    //指定将查询的记录行转换成Person实体 
		                list();      
		    tx.commit(); 
		    session.close(); 
		return list;
	}

	@Override
	public Boolean changeFindFlag(Topic topic) {
		if (topic.getTopicId()!=null||topic.getFindFlag()>1||topic.getFindFlag()<0) {
			byte s=0;
			if (topic.getFindFlag()==0) {
				s=1;
			}
			Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			String  hql= "update Topic t  set t.findFlag=? where t.topicId=? ";
			Query query=session.createQuery(hql);
			query.setParameter(0,s);
			query.setParameter(1,topic.getTopicId());
			Transaction tx= session.beginTransaction();
			query.executeUpdate();
			tx.commit(); 
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public List<Topic> seachFxTopic(String seach) {
		
		  Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		    Transaction tx = session.beginTransaction(); 
		    String sql = "SELECT * FROM t_topic t WHERE t.deleteFlag=0 AND (t.title LIKE '%"
		    		+seach+"%' OR t.content LIKE '%"+seach+"%') AND t.findFlag=1"; 
		    List list = session.createSQLQuery(sql). 
		                addEntity(Topic.class).    //指定将查询的记录行转换成Person实体 
		                list();      
		    tx.commit(); 
		    session.close(); 
		return list;
		
	}

	@Override
	public TopicVo findTopic(Topic topic) {
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		SQLQuery query=	session.createSQLQuery("select u.userName,u.imageUrl, f.flateName,t.*"
										+ "from t_user u,t_flate f,t_topic t "
										+ "where t.fid=f.flateId and t.uid=u.userId and t.topicId="
										+topic.getTopicId());
		List list=query.list();
		return list.size()==0?null:CommUtil.transforma(list).get(0);
	}

	@Override
	public List<TopicVo> findTopic(User user){
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		SQLQuery query=	session.createSQLQuery("select u.userName,u.imageUrl, f.flateName,t.*"
				+ "from t_user u,t_flate f,t_topic t "
				+ "where t.fid=f.flateId and t.uid=u.userId and f.deleteFlag = u.deleteFlag= t.deleteFlag = 0 and u.userId="
				+user.getUserId());
		List list=query.list();
	    return list.size()==0?null:CommUtil.transforma(list);
	}
	
	

}
