package com.hjx.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hjx.model.Admin;
import com.hjx.model.AdminLog;
import com.hjx.model.Flate;
import com.hjx.model.Reply;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.service.AdminLogService;
import com.hjx.service.FlateService;
import com.hjx.service.ReplyService;
import com.hjx.service.TopicService;
import com.hjx.service.UserService;
import com.hjx.util.PageResult;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope(value="prototype")
@Namespace("/")
@ParentPackage("json-default")
public class ReplyAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 6478271964186374599L;
	private List<Reply> replys;
	private Map<String, Object> sessionMap;
	private Reply reply;
	private Flate flate;
	private Topic topic;
	private PageResult pr;
	private String param;
	private User user;
	private String seach;
	private int num;
	private int returnFlag;

	@Autowired
	private UserService userService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private FlateService flateService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private AdminLogService adminLogService;
	
	@Action(value="hfglController",results={
			@Result(name="onload",type="dispatcher",location="../../backJsp/pag/hfgl.jsp"),
			@Result(name="seach",type="dispatcher",location="../../backJsp/seach/hfseach.jsp"),
			@Result(name="show",type="json",params={"root","topic"}),
			@Result(name="delete",type="json",params={"root","returnFlag"}),
			@Result(name="add",type="json",params={"root","returnFlag"}),
			@Result(name="trunPag",type="dispatcher",location="../../backJsp/pag/hfgl.jsp"),
			@Result(name="update",type="dispatcher",location="../../backJsp/success/updateSuccess.jsp")
			})
	public String Controller(){
		
		Map map = new HashMap();
		if (param.equals("onload")) {
			map.put("delete", (byte)0);
			pr=replyService.queryHql(getHql("hfcx"), getHql("hfcql"), map, 0, 10);
			replys=pr.getContents();
		}
	
		if (param.equals("delete")) {
			if (replyService.deleteReply(reply)) {
				reply=replyService.getObject(reply.getReplyId());
				topic=topicService.getObject(reply.getTid());
				topic.setReplyNumber(topic.getReplyNumber()-1);
				topicService.updateObject(topic);
				flate=flateService.getObject(topic.getFid());
				flate.setReplyNumber(flate.getReplyNumber()-1);
				flateService.updateObject(flate);
				//添加日志
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				adminLog.setContent("删除了Id为："+reply.getReplyId()+"的回复。");
				adminLogService.insertObject(adminLog);
				returnFlag=1;
				}else{
					returnFlag=0;
				}
		}
		if (param.equals("add")) {
			user=(User) sessionMap.get("personMessage");
			if (user==null) {
				returnFlag=0;
			}else{
				User user2=userService.getObject(user.getUserId());
				user2.setIntegration(user.getIntegration()+1);//回帖积分加1
				userService.updateObject(user2);
				reply.setReplyTime(new Date());
				reply.setDeleteFlag((byte)0);
				reply.setUid(user.getUserId());
				reply.setTid(topic.getTopicId());
				replyService.insertObject(reply);
				topic=topicService.getObject(topic.getTopicId());
				topic.setLastReplyName(user.getUserName());
				topic.setLastReplyTime(new Date());
				topic.setReplyNumber(topic.getReplyNumber()+1);
				topicService.updateObject(topic);
				flate=flateService.getObject(topic.getFid());
				flate.setReplyNumber(flate.getReplyNumber()+1);
				flateService.updateObject(flate);
				returnFlag=1;
			}
		}
		
		if (param.equals("show")) {
//			reply=replyService.getObject(reply.getReplyId());		
		}
		
		if (param.equals("trunPag")) {
			map.put("delete", (byte)0);
			pr=replyService.queryHql(getHql("hfcx"), getHql("hfcql"), map, pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*10:0, 10);
			replys=pr.getContents();
		}
		if (param.equals("update")) {
	    	//topicService.updateObject(topic);
		}
	
	
		if (param.equals("seach")) {
			replys=	replyService.seachReply(seach);
			num=(replys==null?0:replys.size());
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

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
	
	public String getHql(String param){
		String sql=null;
		if (param.equals("hfcx")) {
			sql="from Reply s where s.deleteFlag =:delete";
		}
		if (param.equals("hfcql")) {
			sql="select count(*) from Reply s where s.deleteFlag =:delete ";
		}
		return sql;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.sessionMap=session;
		
	}

	public int getReturnFlag() {
		return returnFlag;
	}

	public void setReturnFlag(int returnFlag) {
		this.returnFlag = returnFlag;
	}

	public Flate getFlate() {
		return flate;
	}

	public void setFlate(Flate flate) {
		this.flate = flate;
	}
    
	
}
