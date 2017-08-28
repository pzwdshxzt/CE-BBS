package com.hjx.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hjx.core.model.MailInfo;
import com.hjx.model.User;
import com.hjx.vo.ReplyVo;
import com.hjx.vo.TopicVo;

public class CommUtil {

	private static String sepa = java.io.File.separator;
	/**
	 * 　Topic键值转化TopicVo
	 * @param list
	 * @return
	 */
	public static List<TopicVo> transform(List list){
			if (list.size()>0) {
				List<TopicVo> topicVos=new ArrayList<TopicVo>();
					for(Object objects:list){
						  TopicVo topicVo=new TopicVo();
						  Map obs=(Map)objects;
						  topicVo.setUserName((String) obs.get("file0"));
						  topicVo.setUserImage(AliyunOSSUtil.getUrl((String) obs.get("file1")));
						  topicVo.setFlateName((String) obs.get("file2"));
						  topicVo.setTid((Integer) obs.get("file3"));
						  topicVo.setContent((String) obs.get("file4"));
						  topicVo.setCreateTime((Date) obs.get("file5"));
						  topicVo.setFid((Integer) obs.get("file7"));
						  topicVo.setFindFlag((byte) obs.get("file8"));
						  topicVo.setState((byte) obs.get("file9"));
						  topicVo.setTitle((String) obs.get("file10"));
						  topicVo.setUid((Integer) obs.get("file11"));
						  topicVo.setReplyNumber((Integer) obs.get("file12"));
						  topicVo.setLastReplyName((String) obs.get("file14"));
						  topicVo.setLastReplyTime((Date) obs.get("file13"));
						  topicVo.setFousNumber((Integer) obs.get("file15"));
						  topicVos.add(topicVo);
					}
					return topicVos;
			}
			return null;
		}
	
	
	/**
	 * 　user键值转化users
	 * @param list
	 * @return
	 */
	public static List<User> transformUser(List list){
			if (list.size()>0) {
				List<User> users=new ArrayList<User>();
					for(Object objects:list){
						  User user=new User();
						  Map obs=(Map)objects;
						  user.setUserId((Integer) obs.get("file0"));
						  user.setAddress((String) obs.get("file1"));
						  user.setBirthDay( (Date) obs.get("file2"));//
						  user.setDeleteFlag((byte) obs.get("file3"));
						  user.setHide((byte) obs.get("file4"));
						  user.setImageUrl(AliyunOSSUtil.getUrl((String) obs.get("file5")));
						  user.setSex( (byte) obs.get("file6"));
						  user.setUserName((String) obs.get("file7"));
						  user.setIntegration( (int) obs.get("file8"));
						  user.setPrestige( (int) obs.get("file9"));
						  user.setLook((Integer) obs.get("file10"));
						  user.setFousFlateNumber( (Integer) obs.get("file11"));
						  user.setFousTopicNumber((Integer) obs.get("file12"));
						  user.setFousUserNumber((Integer) obs.get("file13"));
						  user.setFousedNumber( (Integer) obs.get("file14"));
						  users.add(user);
					}
					return users;
			}
			return null;
		}
	
	
	/**
	 * 　Topic数组转化TopicVo
	 * @param list
	 * @return
	 */
	public static List<TopicVo> transforma(List list){
			
			if (list.size()!=0) {
				List<TopicVo> topicVos=new ArrayList<>();
				for(Object lists:list)
			    {		
					  TopicVo topicVo =new TopicVo();
			    	  Object[] obs= (Object[]) lists;
			    	  topicVo.setUserName((String) obs[0]);
					  topicVo.setUserImage(AliyunOSSUtil.getUrl((String) obs[1]));
					  topicVo.setFlateName((String) obs[2]);
					  topicVo.setTid((Integer) obs[3]);
					  topicVo.setContent((String) obs[4]);
					  topicVo.setCreateTime((Date) obs[5]);
					  topicVo.setFid((Integer) obs[7]);
					  topicVo.setFindFlag((byte) obs[8]);
					  topicVo.setState((byte) obs[9]);
					  topicVo.setTitle((String) obs[10]);
					  topicVo.setUid((Integer) obs[11]);
					  topicVo.setReplyNumber((Integer) obs[12]);
					  topicVo.setLastReplyName((String) obs[14]);
					  topicVo.setLastReplyTime((Date) obs[13]);
					  topicVo.setFousNumber((Integer) obs[15]);
			    	  topicVos.add(topicVo);	
			    }
				return topicVos;
			}
			return null;
			
		}
	
	/**
	 * 　User数组转化UserVo
	 * @param list
	 * @return
	 *//*
	public static List<UserVo> transformu(List list){
			
			if (list.size()!=0) {
				List<UserVo> userVos=new ArrayList<>();
				UserVo userVo =new UserVo();
				for(Object lists:list)
			    {		
			    	  Object[] obs= (Object[]) lists;
			    	  userVo.setUserId( (Integer) obs[0]);
			    	  userVo.setAddress((String) obs[1]);//AliyunOSSUtil.getUrl((String) obs[1])
			    	  userVo.setBirthDay( (Date) obs[2]);
			    	  userVo.setDeleteFlag( (byte) obs[3]);
			    	  userVo.setUserHide( (byte) obs[4]);
			    	  userVo.setImageUrl(AliyunOSSUtil.getUrl((String) obs[5]));
			    	  userVo.setLookNumber((int) obs[6]);
			    	  userVo.setSex((byte) obs[7]);
			    	  userVo.setUserName( (String) obs[8]);
			    	  userVo.setAgree( (int) obs[9]);
			    	  userVo.setIntegration( (int) obs[10]);
			    	  userVo.setPrestige( (int) obs[11]);
			    	  userVo.setExChangeId((Integer) obs[12]);
			    	  userVo.setEmail((String) obs[13]);
			    	  userVo.setExChangeHide( (byte) obs[14]);
			    	  userVo.setQq((String) obs[15]);
			    	  userVo.setTel((String) obs[16]);
			    	  userVo.setWeChat((String) obs[18]);
			    	  userVo.setLeId((Integer) obs[19]);
			    	  userVo.setEducation((String) obs[20]);
			    	  userVo.setLifeEduHide( (byte) obs[21]);
			    	  userVo.setSchool((String) obs[22]);
			    	  userVo.setLwId((Integer) obs[24]);
			    	  userVo.setCompany( (String) obs[25]);
			    	  userVo.setDepartment( (String) obs[26]);
			    	  userVo.setLifeWorkHide( (byte) obs[27]);
			    	  userVo.setPosition( (String) obs[28]);
			    	  userVo.setIsWork( (byte) obs[30]);
			    	  userVo.setSecurityId( (Integer) obs[31]);
			    	  userVo.setPassword( (String) obs[32]);
			    	  userVo.setSecurityEmail((String) obs[33]);
			    	  userVo.setSecurityTEL((String) obs[34]);

			    	  userVos.add(userVo);	
			    }
				return userVos;
			}
			return null;
			
		}*/

	/**
	 *  ReplyVo 数组转化
	 * @param list
	 * @return
	 */
	public static List<ReplyVo> transformr(List list){
		
		List<ReplyVo> replyVos=new ArrayList<ReplyVo>();
		if (list.size()>0) {
			for(Object objects:list){
				  ReplyVo replyVo=new ReplyVo();
				  Object[] obs= (Object[]) objects;
				  replyVo.setTopicName((String) obs[0]);
				  replyVo.setUserName((String) obs[1]);
				  replyVo.setUserImage(AliyunOSSUtil.getUrl((String) obs[2]));
				  replyVo.setRid( (Integer) obs[3]);
				  replyVo.setDeleteFlag( (byte) obs[4]);
				  replyVo.setReplyContent( (String) obs[5]);
				  replyVo.setReplyTime( (Date) obs[6]);
				  replyVo.setTid( (Integer) obs[7]);
				  replyVo.setUid( (Integer) obs[8]);
				  replyVos.add(replyVo);
			}
		}
		return replyVos;
	}
	
	/**
	 *  ReplyVo 键值转化
	 * @param list
	 * @return
	 */
	public static List<ReplyVo> transformReply(List list){
		
		List<ReplyVo> replyVos=new ArrayList<ReplyVo>();
		if (list.size()>0) {
			for(Object objects:list){
				  ReplyVo replyVo=new ReplyVo();
				  Map obs=(Map)objects;
				  replyVo.setTopicName((String) obs.get("file0"));
				  replyVo.setUserName((String) obs.get("file1"));
				  replyVo.setUserImage(AliyunOSSUtil.getUrl((String) obs.get("file2")));
				  replyVo.setRid((Integer) obs.get("file3"));
				  replyVo.setDeleteFlag( (byte) obs.get("file4"));
				  replyVo.setReplyContent( (String) obs.get("file5"));
				  replyVo.setReplyTime( (Date) obs.get("file6"));
				  replyVo.setTid( (Integer) obs.get("file7"));
				  replyVo.setUid( (Integer) obs.get("file8"));
				  replyVos.add(replyVo);
			}
		}
		return replyVos;
	}
	/**
	 * 获取hql
	 * @param param
	 * @return
	 */
	public static String getHql(String param){
		String hql=null;
		//日志
		if (param.equals("log")) {
			hql="from AdminLog s order by s.logId desc";
		}
		//日志统计
		if (param.equals("logcx")) {
			hql="select count(*) from AdminLog ";
		}
		//话题查询
		if (param.equals("htcx")) {
			hql="from Topic s where s.deleteFlag =:delete";
		}
		//话题统计
		if (param.equals("htcql")) {
			hql="select count(*) from Topic s where s.deleteFlag =:delete ";
		}
		//发现查询
		if (param.equals("fxcx")) {
			hql="from Topic s where s.deleteFlag =:delete and s.findFlag=:findFlag";
		}
		//发现统计
		if (param.equals("fxcql")) {
			hql="select count(*) from Topic s where s.deleteFlag =:delete and s.findFlag=:findFlag ";
		}
		if (param.equals("bkcql")) {
			hql="from Flate s where s.deleteFlag =:delete";
		}
		if (param.equals("bkcx")) {
			hql="select count(*) from Flate s where s.deleteFlag =:delete ";
		}
		if (param.equals("hycx")) {
			hql="from User s where s.deleteFlag =:delete ";
		}
		if (param.equals("hycql")) {
			hql="select count(*) from User s where s.deleteFlag =:delete ";
		}
		if (param.equals("admincx")) {
			hql="from Admin s where s.deleteFlag =:delete ";
		}
		if (param.equals("admincql")) {
			hql="select count(*) from Admin s where s.deleteFlag =:delete ";
		}
		if (param.equals("fousUserCql")) {
			hql="from UserToUser s where s.uid =:userId ";
		}
		if (param.equals("fousUserCx")) {
			hql="select count(*) from UserToUser s where s.uid =:userId  ";
		}
		if (param.equals("fousTopicCql")) {
			hql="from UserToTopic s where s.uid =:userId ";
		}
		if (param.equals("fousTopicCx")) {
			hql="select count(*) from UserToTopic s where s.uid =:userId  ";
		}
		if (param.equals("fousFlateCql")) {
			hql="from UserToFlate s where s.uid =:userId ";
		}
		if (param.equals("fousFlateCx")) {
			hql="select count(*) from UserToFlate s where s.uid =:userId  ";
		}
		if (param.equals("newFlateCql")) {
			hql="from  Flate f  order by f.fousNumber desc ";
		}
		if (param.equals("newFlateCx")) {
			hql="select count(*) from  Flate f order by f.fousNumber desc  ";
		}
		return hql;
	}
	
public static String getSql(String param){
		
		String sql=null;
		
		//获取首页的topic sql 语句
		if (param.equals("indexTopic")) {
			sql="select u.userName,u.imageUrl, f.flateName,t.*"
										+ "from t_user u,t_flate f,t_topic t "
										+ "where f.deleteFlag=t.deleteFlag=u.deleteFlag=0  and t.fid=f.flateId and t.uid=u.userId and t.findFlag=?";
		}
		//获取某个flate所有的topic
		if (param.equals("flateTopic")) {
			sql="select u.userName,u.imageUrl, f.flateName,t.*"
										+ "from t_user u,t_flate f,t_topic t "
										+ "where f.deleteFlag=t.deleteFlag=u.deleteFlag=0 and t.fid=f.flateId and t.uid=u.userId and f.flateId=?";
		}
		
		//获取某个flate所有的置顶帖子
		if (param.equals("flateStateTopic")) {
			sql="select u.userName,u.imageUrl, f.flateName,t.*"
					+ "from t_user u,t_flate f,t_topic t "
					+ "where f.deleteFlag=t.deleteFlag=u.deleteFlag=0 and t.fid=f.flateId and t.uid=u.userId and t.state = 1 and f.flateId=?";
		}
		
		//获取所有的topic
		if (param.equals("allTopic")) {
			sql="select u.userName,u.imageUrl, f.flateName,t.*"
										+ "from t_user u,t_flate f,t_topic t "
										+ "where f.deleteFlag=t.deleteFlag=u.deleteFlag=0 and t.fid=f.flateId and t.uid=u.userId";
		}
		
		//获取某一ID的回复
		if (param.equals("topicReply")) {
			sql="select t.title,u.userName,u.imageUrl,r.* "
				+	" from t_topic t,t_reply r,t_user u "
				+	" where t.deleteFlag=u.deleteFlag=r.deleteFlag=0 " 
				+	" and u.userId=r.uid  and r.tid=t.topicId and r.tid=? "
				+	" GROUP BY r.replyId";
		}
		
		//获取index 的最近15天的帖子
				if (param.equals("indexTopicLast")) {
					sql="select u.userName,u.imageUrl, f.flateName,t.*"
						+"	from t_user u,t_flate f,t_topic t "
						+"	where f.deleteFlag=t.deleteFlag=u.deleteFlag=0 and t.fid=f.flateId and t.uid=u.userId "
						+"	order by t.topicId desc"; 
				}
				

		//获取index 热门用户
				if (param.equals("indexFousUser")) {
					sql="select * "
							+" from t_user u where u.deleteFlag=0 "
						    +" order by u.fousedNumber desc"; 
				}
		return sql;
		
	}

		/**
		 * md5加密类
		 * @param s
		 * @return
		 */
	public static String getMD5(String s){
		
		 try {
			MessageDigest digest = MessageDigest.getInstance("md5");
			 // 调用加密对象的方法，加密的动作已经完成
			byte[] bs = digest.digest(s.getBytes());
			// 接下来，我们要对加密后的结果，进行优化，按照mysql的优化思路走
			// mysql的优化思路：
			// 第一步，将数据全部转换成正数：
			 String hexString = "";
			  for (byte b : bs) {
			  
				  int temp = b & 255;  
			  // 第一步，将数据全部转换成正数
			  // 解释：为什么采用b&255
			  /*
	           * b:它本来是一个byte类型的数据(1个字节) 255：是一个int类型的数据(4个字节)
	           * byte类型的数据与int类型的数据进行运算，会自动类型提升为int类型 eg: b: 1001 1100(原始数据)
	           * 运算时： b: 0000 0000 0000 0000 0000 0000 1001 1100 255: 0000
	           * 0000 0000 0000 0000 0000 1111 1111 结果：0000 0000 0000 0000
	           */
				  
			  // 第二步，将所有的数据转换成16进制的形式
              // 注意：转换的时候注意if正数>=0&&<16，那么如果使用Integer.toHexString()，可能会造成缺少位数
              // 因此，需要对temp进行判断
		           if (temp < 16 && temp >= 0) {
		               // 手动补上一个“0”
		                hexString = hexString + "0" + Integer.toHexString(temp);
		            } else {
		               hexString = hexString + Integer.toHexString(temp);
		             }
		          
			  }
			  return hexString.substring(0,hexString.length()-12);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		return null;
	}

	//邮箱验证码
	public static String getCode(){
		//生成六位验证码
		String charValue = "";
		for (int i = 0; i < 6; i++) {
		char c = (char) ((int)(Math.random()*10)+ '0');
		charValue += String.valueOf(c);
		}
		
		return charValue;
	}
	
	public static MailInfo getMailInfo(){
		MailInfo mailInfo = new MailInfo();
		mailInfo.setHost("smtp.qq.com");
		mailInfo.setPost(25);
		mailInfo.setPassword("nhbgejczdlwjbjdh");
		mailInfo.setFromEmail("ce-bbs@qq.com");
		mailInfo.setUsername("83265414");
		mailInfo.setSubject("CE-Mailbox authentication");
		return mailInfo;
		
	}

}
	
