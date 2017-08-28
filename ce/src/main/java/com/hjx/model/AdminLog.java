package com.hjx.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.AccessType;

import com.hjx.vo.ReplyVo;

@Entity
@Table(name="t_adminLog")
public class AdminLog implements Serializable {


	@Id
	@Column(name="logId",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer logId; // 
	
	@AccessType("property")
	@Column(name="content",length=150)
	private String content; // 内容
	
	@AccessType("property")
	@Column(name="createTime")
	private Date createTime;
	
	@AccessType("property")
	@Column(name="handlers",length=30)
	private String handlers;
	
	
	
	public String getHandlers() {
		return handlers;
	}

	public void setHandlers(String handlers) {
		this.handlers = handlers;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
