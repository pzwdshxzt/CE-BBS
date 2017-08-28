package com.hjx.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hjx.model.Flate;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.model.UserToFlate;
import com.hjx.model.UserToTopic;
import com.hjx.model.UserToUser;
import com.hjx.service.FlateService;
import com.hjx.service.TopicService;
import com.hjx.service.UserService;
import com.hjx.service.UserToFlateService;
import com.hjx.service.UserToTopicService;
import com.hjx.service.UserToUserService;
import com.hjx.util.AliyunOSSUtil;
import com.hjx.util.CommUtil;
import com.hjx.util.PageResult;
import com.hjx.vo.TopicVo;

@Controller
@Scope(value="prototype")
@Namespace("/")
@ParentPackage("json-default")
public class FousAction implements SessionAware {

	private String param;
	private int returnFlag;
	private User user;
	private Flate flate;
	private Topic topic;
	private UserToUser userToUser;
	private UserToFlate userToFlate;
	private UserToTopic userToTopic;
	private Map<String, Object> sessionMap;
	private PageResult userpr;
	private PageResult topicpr;
	private PageResult flatepr;
	private List<UserToUser> userFousLists;
	private List<UserToTopic> topicFousLists;
	private List<UserToFlate> flateFousLists;
	private List<TopicVo> topicViews;
	private List<User> users;
	private List<Flate> flates;

	
	@Autowired
	private FlateService flateService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserToUserService userToUserService;
	@Autowired
	private UserToTopicService userToTopicService;
	@Autowired
	private UserToFlateService userToFlateService;
	
	@Action(value="fousController",results={
			@Result(name="addUF",type="json",params={"root","returnFlag"}),
			@Result(name="addUT",type="json",params={"root","returnFlag"}),
			@Result(name="addUU",type="json",params={"root","returnFlag"}),
			@Result(name="cancelUF",type="json",params={"root","returnFlag"}),
			@Result(name="cancelUT",type="json",params={"root","returnFlag"}),
			@Result(name="cancelUU",type="json",params={"root","returnFlag"})
			})
	public String Controller(){
		
		if (param.equals("addUF")) { //关注板块
			
			user=(User) sessionMap.get("personMessage");
			if (user!=null) {
				userToFlate.setUid(user.getUserId());
				if (userToFlateService.checkFous(userToFlate)) {
					userToFlateService.insertObject(userToFlate);
					flate=flateService.getObject(userToFlate.getFid());
					flate.setFousNumber(flate.getFousNumber()+1);
					flateService.updateObject(flate);
					user=userService.getObject(userToFlate.getUid());
					user.setFousFlateNumber(user.getFousFlateNumber()+1);
					userService.updateObject(user);
					returnFlag = 1;//关注成功
				}else{
					returnFlag = 0;//已经关注过
				}
			}else{
				returnFlag = 2;
			}
		
			
		}
		if (param.equals("addUT")) { //关注话题
			
			user=(User) sessionMap.get("personMessage");
			if (user!=null) {
				userToTopic.setUid(user.getUserId());
				if (userToTopicService.checkFous(userToTopic)) {
					userToTopicService.insertObject(userToTopic);
					topic=topicService.getObject(userToTopic.getTid());
					topic.setFousNumber(topic.getFousNumber()+1);
					topicService.updateObject(topic);
					user=userService.getObject(userToTopic.getUid());
					userService.updateObject(user);
					returnFlag = 1;//关注成功
				}else{
					returnFlag = 0;//已经关注过
				}
			}else{
				returnFlag = 2;
			}
			
		}
		
		if (param.equals("addUU")) { //关注用户
			user=(User) sessionMap.get("personMessage");
			if (user!=null) {
				userToUser.setUid(user.getUserId());
					if (userToUserService.checkFous(userToUser)) {
						userToUserService.insertObject(userToUser);
						User user1=userService.getObject(user.getUserId());
						user1.setFousUserNumber(user1.getFousUserNumber()+1);
						userService.updateObject(user1);
						User user2=userService.getObject(userToUser.getUed());
					    user2.setFousedNumber(user2.getFousedNumber()+1);
					    userService.updateObject(user2);
						returnFlag = 1;//关注成功
					}else{
						returnFlag = 0;//已经关注过
					}
			}else{
				returnFlag = 2;
			}
		}
		
		if (param.equals("cancelUF")) { //取消关注板块
			user=(User) sessionMap.get("personMessage");
			if (user==null) {
				returnFlag = 2;
			}else{
				userToFlate.setUid(user.getUserId());
				userToFlate=userToFlateService.findFous(userToFlate);
				if (userToFlate!=null) {
					userToFlateService.deleteObject(userToFlate);
					Flate flate=flateService.getObject(userToFlate.getFid());
					flate.setFousNumber(flate.getFousNumber()-1);
					flateService.updateObject(flate);
					returnFlag = 1;  //取消关注成功
				}else{
					returnFlag = 0; // 还没有关注
				}
			}
		}

		if (param.equals("cancelUT")) { //取消关注话题
			user=(User) sessionMap.get("personMessage");
			if (user==null) {
				returnFlag = 2; //请先登陆
			}else{
				userToTopic.setUid(user.getUserId());
				userToTopic=userToTopicService.findFous(userToTopic);
				if (userToTopic!=null) {
					userToTopicService.deleteObject(userToTopic);
					Topic topic2=topicService.getObject(userToTopic.getTid());
					topic2.setFousNumber(topic2.getFousNumber()-1);
					topicService.updateObject(topic2);
					returnFlag = 1;  //取消关注成功
				}else{
					returnFlag = 0; // 还没有关注
				}
			}
		}
		
		if (param.equals("cancelUU")) { //取消关注用户
			user=(User) sessionMap.get("personMessage");
			if (user==null) {
				returnFlag = 2;
			}else{
				userToUser.setUid(user.getUserId());
				userToUser=userToUserService.findFous(userToUser);
				if (userToUser!=null) {
					userToUserService.deleteObject(userToUser);
					User user2=userService.getObject(userToUser.getUed());
					user2.setFousedNumber(user2.getFousedNumber()-1);
					userService.updateObject(user2);
					returnFlag = 1;  //取消关注成功
				}else{
					returnFlag = 0; // 还没有关注
				}
			}
		}
		return param;
	}
	
	
	@Action(value="fous",results={
			@Result(name="success",type="dispatcher",location="../../jsp/fous.jsp"),
			@Result(name="login",type="dispatcher",location="../../login.jsp")
			})
	public String fous(){
		Map map = new HashMap();
		user=(User) sessionMap.get("personMessage");
		if (user==null) {
			return "login";
		}else{
			map.put("userId", user.getUserId());
			userpr=userService.queryHql( CommUtil.getHql("fousUserCql"),  CommUtil.getHql("fousUserCx"), map, 0, 100);
			userFousLists=userpr.getContents();
			if (userFousLists.size()>0) {
				users=new ArrayList<User>();
				for(UserToUser u:userFousLists){
					User user2=new User();
					user2=userService.getObject(u.getUed());
					user2.setImageUrl(AliyunOSSUtil.getUrl(user2.getImageUrl()));
					users.add(user2);
					}
			}
			
			topicpr=topicService.queryHql( CommUtil.getHql("fousTopicCql"),  CommUtil.getHql("fousTopicCx"), map, 0, 100);
			topicFousLists=topicpr.getContents();
			if (topicFousLists.size()>0) {
				topicViews=new ArrayList<TopicVo>();
				for(UserToTopic t:topicFousLists){
					TopicVo topicVo = new TopicVo();
					topic=new Topic();
					topic.setTopicId(t.getTid());
					topicVo=topicService.findTopic(topic);
					topicViews.add(topicVo);
				}
			
			}
			flatepr=userService.queryHql( CommUtil.getHql("fousFlateCql"),  CommUtil.getHql("fousFlateCx"), map, 0, 100);
			flateFousLists=flatepr.getContents();
			if (flateFousLists.size()>0) {
				flates=new ArrayList<Flate>();
				for(UserToFlate f:flateFousLists){
					flate=flateService.getObject(f.getFid());
					flate.setImageUrl(AliyunOSSUtil.getUrl(flate.getImageUrl()));
					flates.add(flate);
					}
			}
			
			return "success";
		}
	}
	
	public UserToUser getUserToUser() {
		return userToUser;
	}

	public void setUserToUser(UserToUser userToUser) {
		this.userToUser = userToUser;
	}

	public UserToFlate getUserToFlate() {
		return userToFlate;
	}

	public void setUserToFlate(UserToFlate userToFlate) {
		this.userToFlate = userToFlate;
	}

	public UserToTopic getUserToTopic() {
		return userToTopic;
	}

	public void setUserToTopic(UserToTopic userToTopic) {
		this.userToTopic = userToTopic;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Flate getFlate() {
		return flate;
	}

	public void setFlate(Flate flate) {
		this.flate = flate;
	}



	public Topic getTopic() {
		return topic;
	}



	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public int getReturnFlag() {
		return returnFlag;
	}

	public void setReturnFlag(int returnFlag) {
		this.returnFlag = returnFlag;
	}

	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.sessionMap = session;
	}


	public PageResult getUserpr() {
		return userpr;
	}


	public void setUserpr(PageResult userpr) {
		this.userpr = userpr;
	}


	public PageResult getTopicpr() {
		return topicpr;
	}


	public void setTopicpr(PageResult topicpr) {
		this.topicpr = topicpr;
	}


	public PageResult getFlatepr() {
		return flatepr;
	}


	public void setFlatepr(PageResult flatepr) {
		this.flatepr = flatepr;
	}


	public List<TopicVo> getTopicViews() {
		return topicViews;
	}


	public void setTopicViews(List<TopicVo> topicViews) {
		this.topicViews = topicViews;
	}


	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


	public List<Flate> getFlates() {
		return flates;
	}


	public void setFlates(List<Flate> flates) {
		this.flates = flates;
	}

	
}
