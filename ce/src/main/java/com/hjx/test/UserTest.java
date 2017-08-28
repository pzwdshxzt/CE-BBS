package com.hjx.test;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import com.aliyun.oss.model.OSSObject;
import com.hjx.core.model.Image;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.service.TopicService;
import com.hjx.service.UserService;
import com.hjx.util.AliyunOSSUtil;
import com.hjx.util.CommUtil;
import com.hjx.util.ImageUtil;
import com.hjx.util.PageResult;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.ContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserTest {

	private static final Logger logger = Logger.getLogger(UserTest.class);

	private PageResult pr;
	
	@Autowired
	private UserService userService;
	@Autowired
	private TopicService topicService;
	
	@Test
	public void UserAddTest(){
		User user=new User();
		user.setDeleteFlag((byte)0);
		userService.insertObject(user);
	}
	
	@Test
	public void UserDeleteTest(){		
		
	}
	
	@Test
	public void UserFindTest(){
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from User t where t.deleteFlag=:delete";
		String cql =  "select count(*) from User t where t.deleteFlag=:delete";	
		map.put("delete", (byte) 0);
	    pr=	userService.queryHql(hql, cql, map,0, 10);
		List<User> lists=pr.getContents();
		System.out.println("长度为："+lists.size());
	}
	
	@Test
	public void AddPIC(){
		String filePath="d://bz//aas.jpg";
		String key=	AliyunOSSUtil.addPic(new File(filePath), "hello4.jpg");
		System.out.println(key);
		System.out.println(AliyunOSSUtil.getUrl(key));
		
		
	}
	
	@Test
	public void DeleteOss(){
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		System.out.println(AliyunOSSUtil.deleteObject("hello"));
	}
	
	@Test
	public void getOss(){
		//System.out.println(AliyunOSSUtil.getUrl("09933466-eaaa-4056-9a6f-08e25edb4adeaas.jpg"));
		//System.out.println(CommUtil.getMD5("md5+12"));
	/*	int a=1;
		int b=1;
		System.out.println(a+b+"");
		*/
		System.out.println(CommUtil.getCode());
	}
	
	@Test
	public void modi(){
		String filePath="d://bz//aas.jpg";
		String key=AliyunOSSUtil.modifyOSS("5a3b7e0a-ffff-49f8-b5e6-8375ee21b7a1hello4.jpg", "hello.jpg", new File(filePath));
		System.out.println(key);
		System.out.println(AliyunOSSUtil.getUrl(key));
	}
	@Test
	public void cutPic(){
		Image image=new Image();
		image.setFilePhoto(new File("fakepath//df.jpg"));
		image.setFilePhotoFileName("hello.jpg");
		image.setX(852);
		image.setY(75);
		image.setWidth(341);
		image.setHeight(341);
		File file=ImageUtil.cutImage(image);
		String key=	AliyunOSSUtil.addPic(file, "aas.jpg");
		System.out.println(key);
		System.out.println(AliyunOSSUtil.getUrl(key));
	}
	
	@Test
	public void adc(){
		User user =userService.getObject(1);
		Topic topic =topicService.getObject(1);
		userService.updateObject(user);
		
	}
	@Test
	public void testmd5(){
		System.out.println(CommUtil.getMD5("1"));
	}
}
