package com.hjx.action;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hjx.core.model.CodeInfo;
import com.hjx.core.model.Image;
import com.hjx.core.model.MailInfo;
import com.hjx.mail.Mail;
import com.hjx.model.Admin;
import com.hjx.model.AdminLog;
import com.hjx.model.ExChange;
import com.hjx.model.LifeEdu;
import com.hjx.model.LifeWork;
import com.hjx.model.Security;
 import com.hjx.model.User;
import com.hjx.model.UserToUser;
import com.hjx.service.AdminLogService;
import com.hjx.service.ExChangeService;
import com.hjx.service.LifeEduService;
import com.hjx.service.LifeWorkService;
import com.hjx.service.ReplyService;
import com.hjx.service.SecurityService;
import com.hjx.service.TopicService;
import com.hjx.service.UserService;
import com.hjx.service.UserToUserService;
import com.hjx.util.AliyunOSSUtil;
import com.hjx.util.CommUtil;
import com.hjx.util.ImageUtil;
import com.hjx.util.MakeCode;
import com.hjx.util.PageResult;
import com.hjx.vo.ReplyVo;
import com.hjx.vo.TopicVo;
import com.hjx.vo.UserVo;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope(value="prototype")
@Namespace("/")
@ParentPackage("json-default")
public class UserAction extends ActionSupport implements SessionAware,ServletResponseAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7802383672866232889L;
	private Security security;
	private User user;
	private Map<String, Object> sessionMap;
	private List<ReplyVo> replyViews;
	private String successMessage;
	private PageResult pr;
	private List<TopicVo> topicViews;
	private List<TopicVo> topicLastViews;
	private String param;
	private int returnFlag;
	private Image image;
	private File filePhoto;
	private UserVo userVo;
	private MailInfo mailInfo;
	private ExChange exChange;
	private LifeWork lifeWork;
	private LifeEdu lifeEdu;
	private List<User> users;
	private Boolean fousUser;
	
	@Autowired
	private UserService userService;
	@Autowired
	private SecurityService securityService;
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private UserToUserService userToUserService;
	
    private HttpServletResponse response;
    @Autowired
    private ExChangeService exChangeService;
    @Autowired
    private LifeWorkService lifeWorkService;
    @Autowired
    private LifeEduService lifeEduService;
    @Autowired
    private ReplyService replyService;
    @Autowired
	private AdminLogService adminLogService;

	@Action(value="login",results={
			@Result(name="fail",type="json",params={"root","user"}),
			@Result(name="success",type="json",params={"root","user"})
			})
    public String login(){
		security=securityService.loginSecurity(security);
		if(security==null){
			user=null;
			return "fail";
		}else{
			user=userService.getObject(security.getUid());
			user.setImageUrl(AliyunOSSUtil.getUrl(user.getImageUrl()));
			sessionMap.put("personMessage", user);
			return SUCCESS;
		}
		
	}	
	
	@Action(value="exitCe",results={@Result(name="success",type="json",params={"root","successMessage"})})
    public String exitCe(){
		user=(User) sessionMap.get("personMessage");
		sessionMap.remove("personMessage");
		successMessage=user.getUserName();
		return SUCCESS;
	}
	
	@Action(value="look",results={
			@Result(name="success",type="dispatcher",location="../../jsp/look.jsp")
			})
    public String look(){
		user=userService.getObject(user.getUserId());
		user.setLook(user.getLook()+1);
		userService.updateObject(user);
		user.setImageUrl(AliyunOSSUtil.getUrl(user.getImageUrl()));
		int uid=user.getUserId();
		exChange=new ExChange();
		exChange.setUid(uid);
		exChange = exChangeService.findExChange(exChange);
		lifeEdu=new LifeEdu();
		lifeEdu.setUid(uid);
		lifeEdu = lifeEduService.findLifeEdu(lifeEdu);
		lifeWork=new LifeWork();
		lifeWork.setUid(uid);
		lifeWork = lifeWorkService.findLifeWork(lifeWork);
		security=new Security();
		security.setUid(uid);
		security = securityService.findSecurity(security);
		topicViews=topicService.findTopic(user);
		replyViews=replyService.findReply(user);
	
		User user2=(User) sessionMap.get("personMessage");
		if (user2!=null) {
			UserToUser userToUser= new UserToUser();
			userToUser.setUed(user.getUserId());
			userToUser.setUid(user2.getUserId());
			fousUser=userToUserService.checkFous(userToUser);
		}
		return SUCCESS;
	}
	

	@Action(value="checkLogin",results={@Result(name="success",type="json",params={"root","successMessage"})})
    public String checkLogin(){
		user=(User) sessionMap.get("personMessage");
		if (user==null) {
			successMessage="1";
		}else{
			successMessage="0";
		}
		return SUCCESS;
	}
	
	@Action(value="getPic",results={@Result(name="success",type="json",params={"root","successMessage"})})
    public String getPic() throws IOException{
	
		CodeInfo codeInfo=MakeCode.getCodeInfo();
        //5.输出到屏幕
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(codeInfo.getBuffImg(),codeInfo.getPictype(),sos);
        //6.保存到session中
        sessionMap.put("codeMd5",codeInfo.getCodeMd5());
        
        //7.禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/png");
        //8.关闭sos
        sos.close();
		return null;
	}
	@Action(value="onload",results={@Result(name="success",type="dispatcher",location="../../onload.jsp")})
    public String onload(){
		List<Object> params=new ArrayList<Object>();
		params.add(1);
		pr=topicService.searchPageSql(CommUtil.getSql("indexTopic"), 10, 1, params.toArray());
		topicViews=CommUtil.transform(pr.getContents());
		pr=null;
		pr=topicService.searchPageSql(CommUtil.getSql("indexTopicLast"), 5, 1, null);
		topicLastViews=CommUtil.transform(pr.getContents()); //最新的话题 5条
		if (topicLastViews!=null && topicLastViews.size()>0) {
			Collections.sort(topicLastViews,Collections.reverseOrder());//降序排列
		}else{
			topicLastViews=null;
		}
		pr=null;
		pr=userService.searchPageSql(CommUtil.getSql("indexFousUser"), 5, 1, null);
		users=CommUtil.transformUser(pr.getContents());
		return SUCCESS;
	}
	
	@Action(value="userContrl",results={
			@Result(name="onload",type="dispatcher",location="../../backJsp/pag/hygl.jsp"),
			@Result(name="trunPag",type="dispatcher",location="../../backJsp/pag/hygl.jsp"),
			@Result(name="delete",type="json",params={"root","returnFlag"}),
			@Result(name="fail",type="dispatcher",location="../../backJsp/error/updateError.jsp"),
			@Result(name="watch",type="json",params={"root","user"}),
			@Result(name="checkEmail",type="json",params={"root","returnFlag"}),
			@Result(name="checkUsername",type="json",params={"root","returnFlag"}),
			@Result(name="uploadImage",type="dispatcher",location="../../backJsp/success/updateSuccess.jsp"),
			@Result(name="updateUser",type="json",params={"root","returnFlag"}),
			@Result(name="updateLifeWork",type="json",params={"root","returnFlag"}),
			@Result(name="updateLifeEdu",type="json",params={"root","returnFlag"}),
			@Result(name="checkPassWord",type="json",params={"root","returnFlag"}),
			@Result(name="updateTel",type="json",params={"root","returnFlag"}),
			@Result(name="updatePassword",type="json",params={"root","returnFlag"}),
			@Result(name="updateLifeWorkIsWorkFlag",type="json",params={"root","returnFlag"}),
			@Result(name="updateExChange",type="json",params={"root","returnFlag"})
			})
	
	public String Controller(){
		if (param.equals("updateTel")) {
			if (security.getSecurityTEL()!=null) {
				user=(User) sessionMap.get("personMessage");
				security.setUid(user.getUserId());
				Security security1 = securityService.findSecurity(security);
				security.setId(security1.getId());
				if (securityService.updateTel(security)) {
					returnFlag = 2;
				}else{
					returnFlag = 1;
				}
			}else{
				returnFlag = 0;
			}
		}
		
		if (param.equals("delete")) {
			
			if (userService.deleteUser(user)) {
				//添加日志
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				adminLog.setContent("删除了Id为："+user.getUserId()+"的注册会员。");
				adminLogService.insertObject(adminLog);
				returnFlag = 1;
			}else{
				returnFlag = 0;
			}
		}
		if (param.equals("onload")) {
			Map map = new HashMap();
			map.put("delete", (byte)0);
			pr=userService.queryHql(CommUtil.getHql("hycx"), CommUtil.getHql("hycql"), map, 0, 10);
			users=pr.getContents();
		}
		
		if (param.equals("trunPag")) {
			Map map = new HashMap();
			map.put("delete", (byte)0);
			pr=userService.queryHql(CommUtil.getHql("hycx"), CommUtil.getHql("hycql"),map, pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*10:0,10);
			users=pr.getContents();
		}
		
		if (param.equals("watch")) {
			user=userService.getObject(user.getUserId());
		}
		if (param.equals("uploadImage")) {
			user=(User) sessionMap.get("personMessage");
			if (image!=null||filePhoto!=null) {
				user=userService.getObject(user.getUserId());
			if (image.getHeight()>1) {
				filePhoto=ImageUtil.cutImage(image);
				if (user.getImageUrl()==null) {
					user.setImageUrl(AliyunOSSUtil.addPic(filePhoto, image.getFilePhotoFileName()));
					userService.updateObject(user);
					user.setImageUrl(AliyunOSSUtil.getUrl(user.getImageUrl()));
					sessionMap.put("personMessage", user);
				}else{
					user.setImageUrl(AliyunOSSUtil.modifyOSS(user.getImageUrl(), image.getFilePhotoFileName(),filePhoto));
					userService.updateObject(user);
					user.setImageUrl(AliyunOSSUtil.getUrl(user.getImageUrl()));
					sessionMap.put("personMessage", user);
				}
			}else{
				//没有截屏
				return "fail";
			}
				return param;
				
			}else{
				return  "uploadImageFail";
			}
		}
		if (param.equals("checkEmail")) {
			
			if (securityService.checkEmail(security)) {
				returnFlag = 1; //还没有注册
			}else{
				returnFlag = 0;
			}
			
		}
		
		if (param.equals("checkUsername")) {
			
			if (userService.checkUsername(user)) {
				returnFlag = 1; //还没有人使用这个用户名
			}else{
				returnFlag = 0;
			}
			
		}
		
		if (param.equals("updateUser")) {
				User user2=(User) sessionMap.get("personMessage");
				user.setUserId(user2.getUserId());
				if (userService.updateUser(user)) {
					returnFlag = 1;
				}else{
					returnFlag = 0;
				}	
		}
		
		if (param.equals("updateLifeWork")) {
			User user2=(User) sessionMap.get("personMessage");
			lifeWork.setUid(user2.getUserId());
			LifeWork lifeWork2=lifeWorkService.findLifeWork(lifeWork);
			lifeWork.setId(lifeWork2.getId());
			lifeWork.setUid(user2.getUserId());
			lifeWorkService.updateObject(lifeWork);
			returnFlag = 1;
		}
		
		if (param.equals("updateLifeEdu")) {
			User user2=(User) sessionMap.get("personMessage");
			lifeEdu.setUid(user2.getUserId());;
			LifeEdu lifeEdu2=lifeEduService.findLifeEdu(lifeEdu);
			lifeEdu.setUid(user2.getUserId());
			lifeEdu.setId(lifeEdu2.getId());
			lifeEduService.updateObject(lifeEdu);
			returnFlag = 1;
		}
		if (param.equals("updateExChange")) {
			User user2=(User) sessionMap.get("personMessage");
			exChange.setUid(user2.getUserId());
			ExChange exChange2 = exChangeService.findExChange(exChange);
			exChange.setId(exChange2.getId());
			exChange.setUid(user2.getUserId());
			exChangeService.updateObject(exChange);
			returnFlag = 1;
		}
		
		if (param.equals("updateLifeWorkIsWorkFlag")) {
			User user2=(User) sessionMap.get("personMessage");
			lifeWork=new LifeWork();
			lifeWork.setUid(user2.getUserId());
			lifeWork=lifeWorkService.findLifeWork(lifeWork);
			if (lifeWork.getIsWork()==1) {
				lifeWork.setIsWork((byte)0);//没有工作
			}
			if (lifeWork.getIsWork()==0) {
				lifeWork.setIsWork((byte)1);//有工作
			}
			if (lifeWorkService.updateIsWorkFlag(lifeWork)) {
				returnFlag = 1;
			}else {
				returnFlag = 0;
			}
			
		}
		if(param.equals("updatePassword")){
			if (security.getPassword()!=null) {
				User user2=(User) sessionMap.get("personMessage");
				security.setUid(user2.getUserId());
				Security s=	securityService.findSecurity(security);
				security.setId(s.getId());
				security.setPassword(CommUtil.getMD5(security.getPassword()));
				if (securityService.updatePassword(security)) {
					returnFlag = 1;
				}else{
					returnFlag = 0;
				}
			}else{
				returnFlag = 0;
			}
		}
		
		if(param.equals("checkPassWord")){
			user=(User) sessionMap.get("personMessage");
			Security security2=new Security();
			security2.setUid(user.getUserId());
			security2=securityService.findSecurity(security2);
			user=userService.getObject(user.getUserId());
			if (security.getPassword()==null) {
				returnFlag = 0;
			}else {
				if (security2.getPassword().equals(CommUtil.getMD5(security.getPassword()))){
					returnFlag = 1;
				}else {
					returnFlag = 0;
				}
			}
			
		}
		
		return param;
	}
	
	@Action(value="checkEmailCode",results={
			@Result(name="success",type="json",params={"root","returnFlag"})
		   })
    public String checkEmailCode(){
		
		if (mailInfo.getCodeMd5()!=null) {
			if (CommUtil.getMD5("checkMailMd5+"+mailInfo.getCodeMd5()).equals(sessionMap.get("checkMailMd5"))) {
				//正确
				sessionMap.remove("checkMailMd5");
				returnFlag = 2;
				if (param!=null &&param.equals("newEmail") && !("".equals(mailInfo.getToEmail()))) {
					user=(User) sessionMap.get("personMessage");
					security=new Security();
					security.setUid(user.getUserId());
					Security security1 = securityService.findSecurity(security);
					security.setId(security1.getId());
					security.setSecurityEmail(mailInfo.getToEmail());
					if (securityService.updateEmail(security)) {
						returnFlag = 3;
					}else {
						returnFlag = 0;
					}
				}
			}else{
				returnFlag = 1;
			}
		}else{
			returnFlag = 0;
		}
		
		return SUCCESS;
	}
	
	@Action(value="user",results={
			@Result(name="success",type="dispatcher",location="../../jsp/user.jsp"),
			@Result(name="login",type="dispatcher",location="../../login.jsp")})
    public String user(){
		user=(User) sessionMap.get("personMessage");
		if (user==null) {
			return "login";
		}else{
			int uid=user.getUserId();
			System.out.println(uid);
			exChange=new ExChange();
			exChange.setUid(uid);
			exChange = exChangeService.findExChange(exChange);
			lifeEdu=new LifeEdu();
			lifeEdu.setUid(uid);
			lifeEdu = lifeEduService.findLifeEdu(lifeEdu);
			lifeWork=new LifeWork();
			lifeWork.setUid(uid);
			lifeWork = lifeWorkService.findLifeWork(lifeWork);
			security=new Security();
			security.setUid(uid);
			security = securityService.findSecurity(security);
			return SUCCESS;
		}	
	}
	
	@Action(value="register",results={
			@Result(name="success",type="json",params={"root","returnFlag"}),
			@Result(name="fail",type="json",params={"root","returnFlag"})})
    public String register(){
		String code=mailInfo.getCodeMd5();
		if (code==null) {
			returnFlag = 0;//没有验证码
		}else{
			String emailCode =(String) sessionMap.get("emailCode");
			if (emailCode.equals(CommUtil.getMD5("emailMd5+"+code))) {
				Integer id=null;
				user.setLook(0);
				user.setFousedNumber(0);
				user.setFousFlateNumber(0);
				user.setFousTopicNumber(0);
				user.setFousUserNumber(0);
				id=userService.addUser(user);	
				security.setUid(id);
				security.setPassword(CommUtil.getMD5(security.getPassword()));
     			securityService.insertObject(security);
     			lifeEdu=new LifeEdu();
     			lifeEdu.setUid(id);
     			lifeWork=new LifeWork();
     			lifeWork.setUid(id);
     			exChange=new ExChange();
     			exChange.setEmail(security.getSecurityEmail());
     			exChange.setUid(id);
     			lifeEduService.insertObject(lifeEdu);
     			lifeWorkService.insertObject(lifeWork);
     			exChangeService.insertObject(exChange);
     			sessionMap.put("personMessage", user);
     			returnFlag=2;
			}else{
				returnFlag=1;
			}
		}
		return  SUCCESS;
	}
	
	@Action(value="sendEmail",results={
			@Result(name="success",type="json",params={"root","returnFlag"}),
			@Result(name="login",type="dispatcher",location="../../login.jsp")})
    public String sendemail(){
		
		if (param.equals("register")) {
			if (mailInfo.getCodeMd5()!=null) {
				returnFlag =0; //请输入验证码
				String codeMd5=(String) sessionMap.get("codeMd5");
				if (codeMd5==null) {
					returnFlag=1; //验证码过期
				}else{
					if (codeMd5.equals(CommUtil.getMD5("md5+"+mailInfo.getCodeMd5()))) {
						sessionMap.remove("codeMd5");
						String code=CommUtil.getCode();
						MailInfo mailInfo1=CommUtil.getMailInfo();
						mailInfo1.setToEmail(mailInfo.getToEmail());
						sessionMap.put("emailCode", CommUtil.getMD5("emailMd5+"+code));
						mailInfo1.setMsg("Welcome to register CE- forum, your verification code is: "+code);
						Mail.simpleMailSend(mailInfo1);
						returnFlag=3;//返回成功
					}else{
						returnFlag=2;//验证错误
					}
					
				}
			}
		}
		
		if (param.equals("checkEmail")) {
			if (mailInfo.getToEmail()!=null) {
				user=(User) sessionMap.get("personMessage");
				security = new Security();
				security.setUid(user.getUserId());
				security = securityService.findSecurity(security);
				if (security.getSecurityEmail().equals(mailInfo.getToEmail())) {
					String code=CommUtil.getCode();
					MailInfo mailInfo1=CommUtil.getMailInfo();
					mailInfo1.setToEmail(mailInfo.getToEmail());
					sessionMap.put("checkMailMd5", CommUtil.getMD5("checkMailMd5+"+code));
					mailInfo1.setMsg("You are modifying the mailbox, the verification code is: "+code
							+" do not have to tell others you have to verify code.");
					Mail.simpleMailSend(mailInfo1);
					returnFlag=2;//返回成功
				}else{
					returnFlag=1;//返回成功
				}
			}else{
				returnFlag = 0 ;
			}
		}
		
		if (param.equals("telCheckEmail")) {
			
			if (mailInfo.getToEmail()!=null) {
				user=(User) sessionMap.get("personMessage");
				security = new Security();
				security.setUid(user.getUserId());
				security = securityService.findSecurity(security);
				if (security.getSecurityEmail().equals(mailInfo.getToEmail())) {
					String code = CommUtil.getCode();
					MailInfo mailInfo1=CommUtil.getMailInfo();
					mailInfo1.setToEmail(mailInfo.getToEmail());
					sessionMap.put("checkMailMd5", CommUtil.getMD5("checkMailMd5+"+code));
					mailInfo1.setMsg("You are modifying the phone number, the verification code is:"+code
							+" do not have to tell others you have to verify code.");
					Mail.simpleMailSend(mailInfo1);
					returnFlag=2;//返回成功
				}else{
					returnFlag=1;//返回成功
				}
			}else{
				returnFlag = 0 ;
			}
		}
		
		//忘记密码
		if (param.equals("forgetPassword")) {
			if (mailInfo.getToEmail()!=null) {
				security=new Security();
				security.setSecurityEmail(mailInfo.getToEmail());
				if (securityService.checkEmail(security)) {
					returnFlag = 3;//还没注册
				}else{
					String code = CommUtil.getCode();
					MailInfo mailInfo1=CommUtil.getMailInfo();
					mailInfo1.setToEmail(mailInfo.getToEmail());
					sessionMap.put("forgetMailMd5", CommUtil.getMD5("forgetMailMd5+"+code));
					sessionMap.put("sendEmail", mailInfo.getToEmail());
					mailInfo1.setMsg("forget code: "+code);
					Mail.simpleMailSend(mailInfo1);
					returnFlag = 2;//返回成功
				}
			}else{
				returnFlag = 1;//没有发现邮箱
			}
			
		}
		
		
		if (param.equals("newEmail")) {
			if (mailInfo.getToEmail()!=null) {
				user=(User) sessionMap.get("personMessage");
				String code = CommUtil.getCode();
				MailInfo mailInfo1=CommUtil.getMailInfo();
				mailInfo1.setToEmail(mailInfo.getToEmail());
				sessionMap.put("checkMailMd5", CommUtil.getMD5("checkMailMd5+"+code));
				mailInfo1.setMsg("New mailbox verification code: "+code);
				Mail.simpleMailSend(mailInfo1);
				returnFlag=2;//返回成功
			}else{
				returnFlag=1;//返回失败
			}
		}
		
		if (param.equals("findPassword")) {
			if (mailInfo.getToEmail()!=null||mailInfo.getCodeMd5()!=null) {
				security=new Security();
				security.setSecurityEmail((String) sessionMap.get("sendEmail"));
				if (securityService.checkEmail(security)) {
					returnFlag = 3;//还没注册
				}else{
					String code=(String) sessionMap.get("forgetMailMd5");
					
					if (code!=null) {
						if (code.equals(CommUtil.getMD5("forgetMailMd5+"+mailInfo.getCodeMd5()))) {
								sessionMap.remove("forgetMailMd5");
								String password = "ce"+CommUtil.getCode();
								Security security1=new Security();
								security1=securityService.findSecurityByEmail(security);
								security1.setPassword(CommUtil.getMD5(password));
								securityService.updateObject(security1);
								MailInfo mailInfo1=CommUtil.getMailInfo();
								mailInfo1.setToEmail((String) sessionMap.get("sendEmail"));
								mailInfo1.setMsg("new password: "+ password +" ----- Warning: never tell anyone ");
								Mail.simpleMailSend(mailInfo1);
								returnFlag=2;//返回成功
							}else{
							returnFlag=1;//验证码错误
						}
				  }else{
					  returnFlag=4;
				  }
				}
			}else{
				returnFlag=0;//返回失败
			}
		}
		
		return SUCCESS;
	}
	
	public String getSuccessMessage() {
		return successMessage;
	}

	public void setSuccessMessage(String successMessage) {
		this.successMessage = successMessage;
	}

	public Security getSecurity() {
		return security;
	}


	public void setSecurity(Security security) {
		this.security = security;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	
	public PageResult getPr() {
		return pr;
	}

	public void setPr(PageResult pr) {
		this.pr = pr;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		 this.sessionMap=arg0;	
	}

	public List<TopicVo> getTopicViews() {
		return topicViews;
	}

	public void setTopicViews(List<TopicVo> topicViews) {
		this.topicViews = topicViews;
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

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public File getFilePhoto() {
		return filePhoto;
	}

	public void setFilePhoto(File filePhoto) {
		this.filePhoto = filePhoto;
	}

	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		 this.response = response;
		
	}

	public MailInfo getMailInfo() {
		return mailInfo;
	}

	public void setMailInfo(MailInfo mailInfo) {
		this.mailInfo = mailInfo;
	}

	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public ExChange getExChange() {
		return exChange;
	}

	public void setExChange(ExChange exChange) {
		this.exChange = exChange;
	}

	public LifeWork getLifeWork() {
		return lifeWork;
	}

	public void setLifeWork(LifeWork lifeWork) {
		this.lifeWork = lifeWork;
	}

	public LifeEdu getLifeEdu() {
		return lifeEdu;
	}

	public void setLifeEdu(LifeEdu lifeEdu) {
		this.lifeEdu = lifeEdu;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public SecurityService getSecurityService() {
		return securityService;
	}

	public void setSecurityService(SecurityService securityService) {
		this.securityService = securityService;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<ReplyVo> getReplyViews() {
		return replyViews;
	}

	public void setReplyViews(List<ReplyVo> replyViews) {
		this.replyViews = replyViews;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Boolean getFousUser() {
		return fousUser;
	}

	public void setFousUser(Boolean fousUser) {
		this.fousUser = fousUser;
	}

	public List<TopicVo> getTopicLastViews() {
		return topicLastViews;
	}

	public void setTopicLastViews(List<TopicVo> topicLastViews) {
		this.topicLastViews = topicLastViews;
	}
	
	
}
