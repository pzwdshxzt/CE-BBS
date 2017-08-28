package com.hjx.core.model;


/**
 * 邮件发送等信息
 * @author hjx
 * @version 1.0
 * 2017-03-23
 *
 */
public class MailInfo {

	
	private String toEmail;
	private String subject;
	private String msg;
	
	private String username;
	private String password;
	private String host;
	private int post;
	private String fromEmail;
	private String codeMd5;
	
	
	public String getCodeMd5() {
		return codeMd5;
	}
	public void setCodeMd5(String codeMd5) {
		this.codeMd5 = codeMd5;
	}
	public String getToEmail() {
		return toEmail;
	}
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	
	
	
}
