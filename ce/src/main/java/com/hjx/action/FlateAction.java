package com.hjx.action;
import java.util.ArrayList;
import java.util.Date;
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
import com.hjx.core.model.Image;
import com.hjx.model.Admin;
import com.hjx.model.AdminLog;
import com.hjx.model.Flate;
import com.hjx.model.User;
import com.hjx.model.UserToFlate;
import com.hjx.service.AdminLogService;
import com.hjx.service.FlateService;
import com.hjx.service.TopicService;
import com.hjx.service.UserToFlateService;
import com.hjx.util.AliyunOSSUtil;
import com.hjx.util.CommUtil;
import com.hjx.util.ImageUtil;
import com.hjx.util.PageResult;
import com.hjx.vo.TopicVo;

@Controller
@Scope(value="prototype")
@Namespace("/")
@ParentPackage("json-default")
public class FlateAction implements SessionAware{
	
	@Autowired
	private AdminLogService adminLogService;
	@Autowired
	private UserToFlateService userToFlateService;
	@Autowired
	private FlateService flateService;
	@Autowired
	private TopicService topicService;
	private Boolean fousFlate;
	private List<TopicVo> topicViews;
	private List<TopicVo> topicViews2;
	private Map<String, Object> sessionMap;
	private Flate flate;
	private List<Flate> flates;
	private List<Flate> newflates;
	private PageResult pr;
	private PageResult pr2;//精华的pr
	private String param;
	private Image image;
	
	@Action(value="zbkController",results={
			@Result(name="onload",type="dispatcher",location="../../backJsp/pag/zbk.jsp"),
			@Result(name="add",type="dispatcher",location="../../backJsp/success/addSuccess.jsp"),
			@Result(name="show",type="json",params={"root","param"}),
			@Result(name="watch",type="json",params={"root","flate"}),
			@Result(name="delete",type="json",params={"root","param"}),
			@Result(name="trunPag",type="dispatcher",location="../../backJsp/pag/zbk.jsp"),
			@Result(name="update",type="dispatcher",location="../../backJsp/success/updateSuccess.jsp")
			})
	public String Controller(){
		
		Map map = new HashMap();
		if (param.equals("onload")) {
			map.put("delete", (byte)0);
			pr=flateService.queryHql(CommUtil.getHql("bkcql"), CommUtil.getHql("bkcx"), map, 0, 10);
			flates=pr.getContents();
			
		}
	
		if (param.equals("delete")) {
			if (flateService.deleteFlag(flate)) {
				//添加日志
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				adminLog.setContent("删除了Id为："+flate.getFlateId()+"的板块。");
				adminLogService.insertObject(adminLog);
			}
		}
		
		if (param.equals("add")) {
			image.setFilePhoto(ImageUtil.cutImage(image));
			if (image.getFilePhoto()!=null) {
				flate.setImageUrl(AliyunOSSUtil.addPic(image.getFilePhoto(), image.getFilePhotoFileName()));
				flate.setFousNumber(0);
				flate.setReplyNumber(0);
				flate.setTopicNumber(0);
				flateService.insertObject(flate);
				//添加日志
				Admin admin=(Admin) sessionMap.get("adminKey");
				AdminLog adminLog=new AdminLog();
				adminLog.setHandlers(admin.getUsername());
				adminLog.setCreateTime(new Date());
				adminLog.setContent("添加了板块名称为："+flate.getFlateName()+"的板块。");
				adminLogService.insertObject(adminLog);
			}else{
				System.out.println("找不到文件！");
			}
		}
		
		if (param.equals("show")) {
			flate=flateService.getObject(flate.getFlateId());
			flate.setImageUrl(AliyunOSSUtil.getUrl(flate.getImageUrl()));
			sessionMap.put("show", flate);
		}
		
		if (param.equals("watch")) {
			flate=flateService.getObject(flate.getFlateId());
		}
		
		if (param.equals("trunPag")) {
			map.put("delete", (byte)0);
			pr=flateService.queryHql(CommUtil.getHql("bkcx"), CommUtil.getHql("bkcql"), map, pr.getCurrentPage()>0?(pr.getCurrentPage()-1)*5:0, 10);
			flates=pr.getContents();
		}
		
		if (param.equals("update")) {
			Flate f=flateService.getObject(flate.getFlateId());
			if ("".equals(image.getFilePhotoFileName())||image.getFilePhotoFileName()==null) {
			System.out.println("不需要修改图片");
			}else{
			 image.setFilePhoto(ImageUtil.cutImage(image));	 
				 if ( image.getFilePhoto()!=null) {
					  String fileId=AliyunOSSUtil.modifyOSS(f.getImageUrl(), image.getFilePhotoFileName(), image.getFilePhoto());
					  f.setImageUrl(fileId);
				 }
		    }
			f.setFlateContent(flate.getFlateContent());
			f.setFlateName(flate.getFlateName());
		    flateService.updateObject(f);
		    //添加日志
			Admin admin=(Admin) sessionMap.get("adminKey");
			AdminLog adminLog=new AdminLog();
			adminLog.setHandlers(admin.getUsername());
			adminLog.setCreateTime(new Date());
			adminLog.setContent("修改了Id为："+flate.getFlateId()+"的板块。");
			adminLogService.insertObject(adminLog);
		}
		return param;
		
	}
	
	@Action(value="bkController",results={
			@Result(name="onload",type="dispatcher",location="../../jsp/showAllFlate.jsp"),
			@Result(name="show",type="dispatcher",location="../../jsp/showOneFlate.jsp"),
			@Result(name="trunPag",type="dispatcher",location="../../backJsp/pag/zbk.jsp")
			})
	public String indexFlate(){
		
		Map map = new HashMap();
		if (param.equals("onload")) {
			map.put("delete", (byte)0);
			pr2=flateService.queryHql(CommUtil.getHql("newFlateCql"), CommUtil.getHql("newFlateCx"), map, 0, 5);
			newflates = pr2.getContents();
			for(Flate flate:newflates){
				flate.setImageUrl(AliyunOSSUtil.getUrl(flate.getImageUrl()));
			}
			pr=flateService.queryHql(CommUtil.getHql("bkcql"), CommUtil.getHql("bkcx"), map, 0, 10);
			flates=pr.getContents();
			for(Flate flate:flates){
				flate.setImageUrl(AliyunOSSUtil.getUrl(flate.getImageUrl()));
			}
			
		}
		if (param.equals("show")) {
			map.put("delete", (byte)0);
			User user=(User) sessionMap.get("personMessage");
			if (user!=null) {
				UserToFlate userToFlate=new UserToFlate();
				userToFlate.setFid(flate.getFlateId());
				userToFlate.setUid(user.getUserId());
				fousFlate=userToFlateService.checkFous(userToFlate);
			}
			flate=flateService.getObject(flate.getFlateId());
			flate.setImageUrl(AliyunOSSUtil.getUrl(flate.getImageUrl()));
			List<Object> params=new ArrayList<Object>();
			params.add(flate.getFlateId());
			pr=topicService.searchPageSql(CommUtil.getSql("flateTopic"), 10, 1, params.toArray());
			topicViews=CommUtil.transform(pr.getContents());
			pr2=topicService.searchPageSql(CommUtil.getSql("flateStateTopic"), 10, 1, params.toArray());
			topicViews2=CommUtil.transform(pr2.getContents());
		}
		return param;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.sessionMap=arg0;
	}
	
	public PageResult getPr() {
		return pr;
	}
	public void setPr(PageResult pr) {
		this.pr = pr;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}

	public Flate getFlate() {
		return flate;
	}

	public void setFlate(Flate flate) {
		this.flate = flate;
	}


	public List<Flate> getFlates() {
		return flates;
	}


	public List<TopicVo> getTopicViews() {
		return topicViews;
	}

	public void setTopicViews(List<TopicVo> topicViews) {
		this.topicViews = topicViews;
	}

	public void setFlates(List<Flate> flates) {
		this.flates = flates;
	}

	public Image getImage() {
		return image;
	}

	
	public List<TopicVo> getTopicViews2() {
		return topicViews2;
	}

	public void setTopicViews2(List<TopicVo> topicViews2) {
		this.topicViews2 = topicViews2;
	}

	public PageResult getPr2() {
		return pr2;
	}

	public void setPr2(PageResult pr2) {
		this.pr2 = pr2;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Boolean getFousFlate() {
		return fousFlate;
	}

	public void setFousFlate(Boolean fousFlate) {
		this.fousFlate = fousFlate;
	}

	public List<Flate> getNewflates() {
		return newflates;
	}

	public void setNewflates(List<Flate> newflates) {
		this.newflates = newflates;
	}
	
}
