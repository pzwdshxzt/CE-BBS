package com.hjx.mail;

import java.util.Properties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.hjx.core.model.MailInfo;

/**
 * mail发送核心类
 * @author hjx
 * @version 1.0
 * 207-03-23
 */ 
public class Mail {
	
	
	public static void simpleMailSend(MailInfo mailInfo) {  
	     //创建邮件发送服务器  
	        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();    
	        mailSender.setHost(mailInfo.getHost());  
    	    mailSender.setPort(mailInfo.getPost());  
	        mailSender.setUsername(mailInfo.getUsername());  
	        mailSender.setPassword(mailInfo.getPassword());  
	        //加认证机制  
	        Properties javaMailProperties = new Properties();  
	        javaMailProperties.put("mail.smtp.auth", true);   
	        javaMailProperties.put("mail.smtp.starttls.enable", true);   
	        javaMailProperties.put("mail.smtp.timeout", 50000);  
	        javaMailProperties.put("mail.smtp.socketFactory.port",465);  
	        //  javaMailProperties.put("mail.smtp.socketFactory.class", "javax.Net.ssl.SSLSocketFactory");
	        mailSender.setJavaMailProperties(javaMailProperties);  
	        //创建邮件内容  
	        SimpleMailMessage message=new SimpleMailMessage();  
	        message.setFrom(mailInfo.getFromEmail());  
	        message.setTo(mailInfo.getToEmail());  
	        message.setSubject(mailInfo.getSubject());  
	        message.setText(mailInfo.getMsg());  
	        //发送邮件  
	        mailSender.send(message);  
	    }  
}
