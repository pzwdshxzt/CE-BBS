package com.hjx.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import com.hjx.model.Security;
import com.hjx.service.SecurityService;
import com.hjx.util.PageResult;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.ContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class SercurityTest {

	private static final Logger logger = Logger.getLogger(SercurityTest.class);

	private PageResult pr;
	
	@Autowired
	private SecurityService securityService;
	
	@Test
	public void SercurityAddTest(){
		Security security=new Security();
		security.setSecurityEmail("83265414@qq.com");
		security.setPassword("12345");
		securityService.insertObject(security);
	}
	
	
	@Test
	public void SercurityFindOne(){
		Security security=new Security();
		security.setSecurityEmail("12306@123.com");
		security.setPassword("12345");
		security=securityService.loginSecurity(security);
		System.out.println(security.getId());
	}
	
	
	
	
}
