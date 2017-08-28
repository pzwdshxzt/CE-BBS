package com.hjx.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.AccessType;

@Entity
@Table(name="t_flate")
public class Flate implements Serializable {
	//子板块
	@Id
	@Column(name="flateId",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer flateId;
	
	@AccessType("property")
	@Column(name="flateName",length=20)
	private String flateName; //板块名字
	
	@AccessType("property")
	@Column(name="flateContent",length=100)
	private String flateContent; //板块说明
	@AccessType("property")
	@Column(name="deleteFlag",length=1)
	private byte deleteFlag;
	
	@AccessType("property")
	@Column(name="imageUrl",length=200)
	private String imageUrl; //板块图片
	
	@AccessType("property")
	@Column(name="fousNumber",length=8)
	private Integer fousNumber; //板块关注数量
	
	@AccessType("property")
	@Column(name="topicNumber",length=8)
	private Integer topicNumber; //板块话题数量
	
	@AccessType("property")
	@Column(name="replyNumber",length=8)
	private Integer replyNumber; //板块话题数量
	
	

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
	public Integer getTopicNumber() {
		return topicNumber;
	}
	public void setTopicNumber(Integer topicNumber) {
		this.topicNumber = topicNumber;
	}
	public Integer getFlateId() {
		return flateId;
	}
	public void setFlateId(Integer flateId) {
		this.flateId = flateId;
	}
	public String getFlateName() {
		return flateName;
	}
	public void setFlateName(String flateName) {
		this.flateName = flateName;
	}
	public String getFlateContent() {
		return flateContent;
	}
	public void setFlateContent(String flateContent) {
		this.flateContent = flateContent;
	}
	public byte getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(byte deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
