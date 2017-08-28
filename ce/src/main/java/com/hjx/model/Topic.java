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


@Entity
@Table(name="t_topic")
public class Topic implements Serializable {

	@Id
	@Column(name="topicId",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer topicId;
	
	@AccessType("property")
	@Column(name="uid",length=4)
	private Integer uid; //话题的主人是谁！
	
	@AccessType("property")
	@Column(name="fid",length=4)
	private Integer fid; //指向板块所属！！
	
	@AccessType("property")
	@Column(name="state",length=1)
	private byte state; //置顶  /0.普通 /1置顶
	
	@AccessType("property")
	@Column(name="findFlag",length=1)
	private byte findFlag; //是否在首页出现  /0.不在 /1在
	
	@AccessType("property")
	@Column(name="title",length=100)
	private String title; //话题名称
	
	@AccessType("property")
	@Column(name="content",length=1000)
	private String content; //内容
	
	@AccessType("property")
	@Column(name="createTime")
	private Date createTime; //创建时间
	
	@AccessType("property")
	@Column(name="deleteFlag",length=1)
	private byte deleteFlag; 
	
	@AccessType("property")
	@Column(name="fousNumber",length=4)
	private Integer fousNumber; //话题关注数量
	
	@AccessType("property")
	@Column(name="replyNumber",length=4)
	private Integer replyNumber; //板块回复数量
	
	@AccessType("property")
	@Column(name="lastReplyTime")
	private Date lastReplyTime;//最后回复的时间
	
	@AccessType("property")
	@Column(name="lastReplyName",length=20)
	private String lastReplyName;//最后一次回复
	
	
	
	public String getLastReplyName() {
		return lastReplyName;
	}

	public void setLastReplyName(String lastReplyName) {
		this.lastReplyName = lastReplyName;
	}

	public Date getLastReplyTime() {
		return lastReplyTime;
	}

	public void setLastReplyTime(Date lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
	}

	public Integer getFousNumber() {
		return fousNumber;
	}

	public void setFousNumber(Integer fousNumber) {
		this.fousNumber = fousNumber;
	}

	public Integer getReplyNumber() {
		return replyNumber;
	}

	public void setReplyNumber(Integer replyNumber) {
		this.replyNumber = replyNumber;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public byte getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(byte deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getTopicId() {
		return topicId;
	}
	
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public byte getState() {
		return state;
	}

	public void setState(byte state) {
		this.state = state;
	}

	public byte getFindFlag() {
		return findFlag;
	}

	public void setFindFlag(byte findFlag) {
		this.findFlag = findFlag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
