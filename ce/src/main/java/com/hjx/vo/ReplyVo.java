package com.hjx.vo;

import java.util.Date;


public class ReplyVo implements Comparable<ReplyVo> {

	private Integer rid; //回复Id
	private Integer tid; //指向话题
	private String topicName; //话题标题
	private Integer uid; //指向用户id
	private String userName; //用户名
	private String userImage;//用户头像
	private Date replyTime; //
	private String replyContent; //
	private byte deleteFlag;
	
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
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

	@Override
	public int compareTo(ReplyVo o) {
	       int otherRid = o.getRid();
	      // note: enum-type's comparation depend on types' list order of enum method
	      // so, if compared property is enum-type ,then its comparationfollow ObjEnum.objType order
	      return this.rid.compareTo(otherRid);
	}
	
}
