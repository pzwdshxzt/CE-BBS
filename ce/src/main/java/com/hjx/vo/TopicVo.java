package com.hjx.vo;

import java.util.Date;

public class TopicVo implements Comparable<TopicVo> {

	private Integer tid;
	private Integer uid;
	private Integer fid;
	private String userName;
	private String userImage;
	private String flateName;
	private byte state;
	private byte findFlag;
	private String title;
	private String content;
	private Date createTime;
	private Integer fousNumber;
	private Integer replyNumber;
	private Date lastReplyTime;//最后回复的时间
	private String lastReplyName;
	
	
	
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
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public Date getLastReplyTime() {
		return lastReplyTime;
	}
	public void setLastReplyTime(Date lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
	}
	public String getLastReplyName() {
		return lastReplyName;
	}
	public void setLastReplyName(String lastReplyName) {
		this.lastReplyName = lastReplyName;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFlateName() {
		return flateName;
	}
	public void setFlateName(String flateName) {
		this.flateName = flateName;
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
	
	public Integer getReplyNumber() {
		return replyNumber;
	}
	public void setReplyNumber(Integer replyNumber) {
		this.replyNumber = replyNumber;
	}
	public Integer getFousNumber() {
		return fousNumber;
	}
	public void setFousNumber(Integer fousNumber) {
		this.fousNumber = fousNumber;
	}
	
	@Override
	public int compareTo(TopicVo o) {
		int otherTid = o.getTid();
		
		return this.tid.compareTo(otherTid);
	} 
	
}
