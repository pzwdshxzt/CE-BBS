package com.hjx.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hjx.core.model.MailInfo;
import com.hjx.mail.Mail;
import com.hjx.util.CommUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MyMailTest {
	@Test
	public void test(){
		MailInfo mailInfo=new MailInfo();
		mailInfo.setHost("smtp.qq.com");
		mailInfo.setPost(25);
		String code=CommUtil.getCode();
		System.out.println(code);
		mailInfo.setMsg("欢迎注册CE-论坛，你的验证码是 :"+code);
		mailInfo.setPassword("nhbgejczdlwjbjdh");
		mailInfo.setFromEmail("ce-bbs@qq.com");
		mailInfo.setUsername("83265414");
		mailInfo.setToEmail("83265414@qq.com");
		mailInfo.setSubject("CE-邮箱认证");
		Mail.simpleMailSend(mailInfo);
	}
}
