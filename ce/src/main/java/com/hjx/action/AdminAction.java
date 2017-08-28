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
import com.hjx.model.User;
import com.hjx.service.AdminLogService;
import com.hjx.service.AdminService;
import com.hjx.util.CommUtil;
import com.hjx.util.PageResult;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope(value="prototype")
@Namespace("/")
@ParentPackage("json-default")
public class AdminAction extends ActionSupport implements SessionAware,RequestAware {
	
	private static final long serialVersionUID = -1050956933326571899L;
	private Admin admin;
	private List<Admin> admins;
	private List<AdminLog> adminLogs;
	private Map<String, Object> sessionMap;
	private Map<String, Object> requestMap;
	private PageResult pr;
	private String successMessage;
	private String param;
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminLogService adminLogService;
	
	@Action(value="adminLogin",results={
			@Result(name="success",type="dispatcher",location="../../backJsp/jsp/backIndex.jsp"),
			@Result(name="fail",type="dispatcher",location="../../backJsp/admin.jsp")})
    public String login(){
		
		admin=adminService.checkIn(admin);
		if (admin!=null) {
			successMessage="登录成功！";
			requestMap.put("message", successMessage);
			sessionMap.put("adminKey", admin);
			//添加日志
			AdminLog adminLog=new AdminLog();
			adminLog.setHandlers(admin.getUsername());
			adminLog.setCreateTime(new Date());
			adminLog.setContent("管理员"+admin.getUsername()+"登陆。");
			adminLogService.insertObject(adminLog);
			return SUCCESS;
		}else{
			successMessage="登录失败！";
			requestMap.put("message", successMessage);//onload 提示登录失败
			return "fail";
		}
	}	
	
	@Action(value="adminExitCe",results={@Result(name="success",type="json",params={"root","successMessage"})})
    public String exitCe(){
		admin=(Admin) sessionMap.get("adminKey");
		sessionMap.remove("adminKey");
		successMessage=admin.getUsername();
		//添加日志
		AdminLog adminLog=new AdminLog();
		adminLog.setHandlers(admin.getUsername());
		adminLog.setCreateTime(new Date());
		adminLog.setContent("管理员"+admin.getUsername()+"退出了。");
		adminLogService.insertObject(adminLog);
		return SUCCESS;
	}
	
	@Action(value="adminLog",results={
			@Result(name="success",type="dispatcher",location="../../backJsp/pag/adminLog.jsp"),
			@Result(name="fail",type="dispatcher",location="../../backJsp/admin.jsp")})
    public String adminLog(){
		if (param.equals("onload")) {
			pr=adminService.queryHql(CommUtil.getHql("log"), CommUtil.getHql("logcx"), null, 0, 10);
			adminLogs=pr.getContents();
		}
		if (param.equals("trunPag")) {
			pr=adminService.queryHql(CommUtil.getHql("log"), CommUtil.getHql("logcx"), null, pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*10:0, 10);
			adminLogs=pr.getContents();
		}
		return "success";	
	}
	@Action(value="adminContrl",results={
			@Result(name="onload",type="dispatcher",location="../../backJsp/pag/glygl.jsp"),
			@Result(name="delete",type="json",params={"root","param"}),
			@Result(name="degrade",type="json",params={"root","param"}),
			@Result(name="upgrade",type="json",params={"root","param"}),
			@Result(name="add",type="json",params={"root","param"}),
			@Result(name="xxxx",type="dispatcher",location="../../backJsp/admin.jsp")})
	public String control(){
		if (param.equals("onload")) {
			Map map = new HashMap();
			map.put("delete", (byte)0);
			pr=adminService.queryHql(CommUtil.getHql("admincx"), CommUtil.getHql("admincql"), map, 0, 10);
			admins=pr.getContents();
		}
		
		if (param.equals("add")) {
			adminService.insertObject(admin);
			//添加日志
			Admin admin1=(Admin) sessionMap.get("adminKey");
			AdminLog adminLog=new AdminLog();
			adminLog.setHandlers(admin1.getUsername());
			adminLog.setCreateTime(new Date());
			adminLog.setContent("添加管理员："+admin.getUsername());
			adminLogService.insertObject(adminLog);
		}
		if (param.equals("degrade")) {
			Admin admin2=adminService.getObject(admin.getAdminId());
			admin2.setAuthority((byte) (admin2.getAuthority()-1));
			adminService.updateObject(admin2);
			//添加日志
			admin=(Admin) sessionMap.get("adminKey");
			AdminLog adminLog=new AdminLog();
			adminLog.setHandlers(admin.getUsername());
			adminLog.setCreateTime(new Date());
			adminLog.setContent("将管理员"+admin2.getUsername()+"降级了。");
			adminLogService.insertObject(adminLog);
		}
			
		if (param.equals("upgrade")) {
			Admin admin2=adminService.getObject(admin.getAdminId());
			admin2.setAuthority((byte) (admin2.getAuthority()+1));
			adminService.updateObject(admin2);
			admin=(Admin) sessionMap.get("adminKey");
			AdminLog adminLog=new AdminLog();
			adminLog.setHandlers(admin.getUsername());
			adminLog.setCreateTime(new Date());
			adminLog.setContent("将管理员"+admin2.getUsername()+"升级了。");
			adminLogService.insertObject(adminLog);
		}
		
		
		if (param.equals("delete")) {
				admin=adminService.getObject(admin.getAdminId());
				String name=admin.getUsername();
			if (adminService.deleteFlag(admin)) {
				Admin admin1=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin1.getUsername());
				adminLog.setCreateTime(new Date());
				adminLog.setContent("将管理员"+name+"删除了。");
				adminLogService.insertObject(adminLog);
				}
		}
		if (param.equals("trunPag")) {
			Map map = new HashMap();
			map.put("delete", (byte)0);
			pr=adminService.queryHql(CommUtil.getHql("admincx"), CommUtil.getHql("admincql"), map,pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*5:0, 10);
			admins=pr.getContents();
		}
		return param;
	}
	public Admin getAdmin() {
		return admin;
	}


	public void setAdmin(Admin admin) {
		this.admin = admin;
	}


	public String getSuccessMessage() {
		return successMessage;
	}

	public void setSuccessMessage(String successMessage) {
		this.successMessage = successMessage;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		 this.sessionMap=arg0;	
	}


	@Override
	public void setRequest(Map<String, Object> arg0) {
	     this.requestMap=arg0;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public PageResult getPr() {
		return pr;
	}

	public void setPr(PageResult pr) {
		this.pr = pr;
	}

	public List<Admin> getAdmins() {
		return admins;
	}

	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
	}


	public List<AdminLog> getAdminLogs() {
		return adminLogs;
	}


	public void setAdminLogs(List<AdminLog> adminLogs) {
		this.adminLogs = adminLogs;
	}
	
	

}
