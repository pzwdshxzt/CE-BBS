package com.hjx.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.AccessType;


@Entity
@Table(name="t_reply")
public class Reply implements Serializable {

	@Id
	@Column(name="replyId",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer replyId;
	

	@AccessType("property")
	@Column(name="tid",length=4)
	private Integer tid; //指向话题
	
	@AccessType("property")
	@Column(name="uid",length=4)
	private Integer uid; //指向话题
	
	@AccessType("property")
	@Column(name="replyTime")
	private Date replyTime; //
	
	@AccessType("property")
	@Column(name="replyContent",length=200)
	private String replyContent; //
	
	@AccessType("property")
	@Column(name="deleteFlag",length=1)
	private byte deleteFlag;

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public byte getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(byte deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}

