package com.hjx.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hjx.model.Admin;
import com.hjx.model.AdminLog;
import com.hjx.model.Flate;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.model.UserToTopic;
import com.hjx.service.AdminLogService;
import com.hjx.service.FlateService;
import com.hjx.service.ReplyService;
import com.hjx.service.TopicService;
import com.hjx.service.UserService;
import com.hjx.service.UserToTopicService;
import com.hjx.util.CommUtil;
import com.hjx.util.PageResult;
import com.hjx.vo.ReplyVo;
import com.hjx.vo.TopicVo;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.core.ReturnInstruction.Return;

@Controller
@Scope(value="prototype")
@Namespace("/")
@ParentPackage("json-default") 
public class TopicAction extends ActionSupport  implements SessionAware {
	
	private static final long serialVersionUID = 6478271964186374599L;
	private Boolean fousTopic;
	private Flate flate;
	private Topic topic;
	private List<Topic> topics;
	private PageResult pr;
	private String param;
	private User user;
	private String seach;
	private int num;
	private Map<Integer, String> img=new HashMap<>();
	private List<TopicVo> topicViews;
	private TopicVo topicVo;
	private List<ReplyVo> replyViews;
	private int ReturnFlag;
	private Map<String, Object> sessionMap;
	
	@Autowired
	private UserToTopicService userToUserService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private FlateService flateService;
	@Autowired
	private UserService userService;
	@Autowired
	private AdminLogService adminLogService;
	@Autowired
	private ReplyService replyService;
	
	@Action(value="htglController",results={
			@Result(name="onload",type="dispatcher",location="../../backJsp/pag/htgl.jsp"),
			@Result(name="seach",type="dispatcher",location="../../backJsp/seach/htseach.jsp"),
			@Result(name="delete",type="json",params={"root","param"}),
			@Result(name="stick",type="json",params={"root","topic"}),
			@Result(name="show",type="json",params={"root","topic"}),
			@Result(name="watch",type="json",params={"root","topic"}),
			@Result(name="changeFindFlag",type="json",params={"root","topic"}),
			@Result(name="trunPag",type="dispatcher",location="../../backJsp/pag/htgl.jsp"),
			@Result(name="update",type="dispatcher",location="../../backJsp/success/updateSuccess.jsp")
			})
	public String Controller(){
		
		Map map = new HashMap();
		if (param.equals("onload")) {
			map.put("delete", (byte)0);
			pr=topicService.queryHql(CommUtil.getHql("htcx")
					, CommUtil.getHql("htcql"), map, 0, 10);
			topics=pr.getContents();
		}
	
		if (param.equals("delete")) {
			if (topicService.deleteTopic(topic)) {
				topic=topicService.getObject(topic.getTopicId());
				Flate flate1=flateService.getObject(topic.getFid());
				flate1.setTopicNumber(flate1.getTopicNumber()-1);
				flateService.updateObject(flate1);
				//添加日志
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				adminLog.setContent("删除了Id为："+topic.getTopicId()+"的话题。");
				adminLogService.insertObject(adminLog);
			}
		}
		
		if (param.equals("show")) {
			topic=topicService.getObject(topic.getTopicId());
		}
		
		if (param.equals("watch")) {
			topic=topicService.getObject(topic.getTopicId());
		}
		if (param.equals("trunPag")) {
			map.put("delete", (byte)0);
			pr=topicService.queryHql( CommUtil.getHql("htcx"),  CommUtil.getHql("htcql"), map, pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*10:0, 10);
			topics=pr.getContents();
		}
		if (param.equals("update")) {
	    	//topicService.updateObject(topic);
		}
	
	
		if (param.equals("stick")) { //置顶修改
			if (topicService.changeStick(topic)) {//添加日志
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				if (topic.getState()==(byte)1) {
					adminLog.setContent("将Id为："+topic.getTopicId()+"的取消置顶。");
				}
				if (topic.getState()==(byte)0) {
					adminLog.setContent("将Id为："+topic.getTopicId()+"的置顶。");
				}
				adminLogService.insertObject(adminLog);
				topic=topicService.getObject(topic.getTopicId());
			}else{
				topic=null;
			}
				
		}
		
		if (param.equals("changeFindFlag")) {
			
			if (topicService.changeFindFlag(topic)) {
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				if (topic.getFindFlag()==(byte)1) {
					adminLog.setContent("将Id为："+topic.getTopicId()+"从发现移除。");
				}
				if (topic.getFindFlag()==(byte)0) {
					adminLog.setContent("将Id为："+topic.getTopicId()+"添加到发现。");
				}
				adminLogService.insertObject(adminLog);
				topic=topicService.getObject(topic.getTopicId());
			}else{
				topic=null;
			}
				
		}
		if (param.equals("seach")) {
			topics=	topicService.seachTopic(seach);
			num=(topics==null?0:topics.size());
		}
		return param;
	}
	
	@Action(value="fxglController",results={
			@Result(name="seach",type="dispatcher",location="../../backJsp/seach/fxseach.jsp"),
			@Result(name="trunPag",type="dispatcher",location="../../backJsp/pag/fxgl.jsp"),
			@Result(name="onload",type="dispatcher",location="../../backJsp/pag/fxgl.jsp")})
	public String ControllerFind(){
		Map map = new HashMap();
		if (param.equals("onload")) {
			map.put("delete", (byte)0);
			map.put("findFlag", (byte)1);
			pr=topicService.queryHql( CommUtil.getHql("fxcx"),  CommUtil.getHql("fxcql"), map, 0, 10);
			topics=pr.getContents();
		}
		
		if (param.equals("trunPag")) {
			map.put("delete", (byte)0);
			map.put("findFlag", (byte)1);
			pr=topicService.queryHql( CommUtil.getHql("fxcx"),  CommUtil.getHql("fxcql"), map, pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*10:0, 10);
			topics=pr.getContents();
		}
		
		if (param.equals("seach")) {
			topics=	topicService.seachFxTopic(seach);
			num=(topics==null?0:topics.size());
		}
		
		return param;
		
	}
	
	
	@Action(value="topicController",results={
			@Result(name="addTopic",type="json",params={"root","returnFlag"}),
			@Result(name="onload",type="chain",location="onload"),
			@Result(name="getTopic",type="dispatcher",location="../../jsp/showTopic.jsp")})
	public String ControllerTopic(){
		if (param.equals("getTopic")) {
			if (topic!=null) {
				List<Object> param=new ArrayList<Object>();
				topicVo=topicService.findTopic(topic);
				param.add(topicVo.getFid());
				pr=topicService.searchPageSql(CommUtil.getSql("flateTopic"), 100, 1, param.toArray());
				topicViews=CommUtil.transform(pr.getContents());
				
				if (topicVo.getReplyNumber()>0) {
					param.clear();
				    param.add(topic.getTopicId());
					pr=replyService.searchPageSql(CommUtil.getSql("topicReply"), 100, 1,param.toArray());
					replyViews= CommUtil.transformReply(pr.getContents());	
					Collections.sort(replyViews);
				}
				
				user=(User) sessionMap.get("personMessage");
				
				if (user!=null) { //验证是否关注
					UserToTopic userToTopic=new UserToTopic();
					userToTopic.setTid(topic.getTopicId());
					userToTopic.setUid(user.getUserId());
					fousTopic=userToUserService.checkFous(userToTopic);
				}
			}else {
			
				return "onload";
			
			}
		}
		
		if (param.equals("addTopic")) {
			user=(User) sessionMap.get("personMessage");
			if (user!=null) {
				topic.setCreateTime(new Date());
				topic.setFid(flate.getFlateId());
				topic.setUid(user.getUserId());
				topic.setFousNumber(0);
				topic.setReplyNumber(0);
				topicService.insertObject(topic);
				Flate flate1=flateService.getObject(flate.getFlateId());
				flate1.setTopicNumber(flate1.getTopicNumber()+1);
				flateService.updateObject(flate1);
				User user2=userService.getObject(user.getUserId());
				if (user2.getIntegration()/20>user2.getPrestige()) {
					user2.setPrestige(user2.getPrestige()+1);
				}
				user2.setIntegration(user2.getIntegration()+5);
				userService.updateObject(user2);
				ReturnFlag = 1;
			}else{
				ReturnFlag = 2; //还没登陆
			}
		
		}
		return param;
		
	}

	public PageResult getPr() {
		return pr;
	}

	public void setPr(PageResult pr) {
		this.pr = pr;
	}

	
	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
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

	public String getSeach() {
		return seach;
	}

	public void setSeach(String seach) {
		this.seach = seach;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public List<TopicVo> getTopicViews() {
		return topicViews;
	}

	public TopicVo getTopicVo() {
		return topicVo;
	}

	public void setTopicVo(TopicVo topicVo) {
		this.topicVo = topicVo;
	}

	public void setTopicViews(List<TopicVo> topicViews) {
		this.topicViews = topicViews;
	}

	public List<ReplyVo> getReplyViews() {
		return replyViews;
	}

	public void setReplyViews(List<ReplyVo> replyViews) {
		this.replyViews = replyViews;
	}

	public int getReturnFlag() {
		return ReturnFlag;
	}

	public void setReturnFlag(int returnFlag) {
		ReturnFlag = returnFlag;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.sessionMap=session;
		
	}

	public Boolean getFousTopic() {
		return fousTopic;
	}

	public void setFousTopic(Boolean fousTopic) {
		this.fousTopic = fousTopic;
	}
	
	
}
