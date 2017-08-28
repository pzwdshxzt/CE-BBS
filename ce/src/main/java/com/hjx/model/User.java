package com.hjx.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.annotations.AccessType;


@Entity
@Table(name="t_user")
public class User implements Serializable {

	//UserId
	@Id
	@Column(name="userId",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer userId; //uid

	@AccessType("property")
	@Column(name="deleteFlag",length=1)
	private byte deleteFlag;

	@AccessType("property")
	@Column(name="userName",length=20)
	private String userName; //用户名
	
	@AccessType("property")
	@Column(name="sex",length=1)
	private byte sex;  //性别 2.保密0.男1.女
	
	@AccessType("property")
	@Column(name="birthDay")
	private Date birthDay;  //生日
	
	@AccessType("property")
	@Column(name="imageUrl",length=200)
	private String imageUrl; //图片URL
	
	@AccessType("property")
	@Column(name="address",length=200)
	private String address; //地址
	
	@AccessType("property")
	@Column(name="hide",length=1)
	private byte hide; //隐私 //0 公开 1隐藏 
	
	@AccessType("property")
	@Column(name="look",length=8)
	private Integer look; //主页浏览次数
	
	@AccessType("property")
	@Column(name="fousUserNumber",length=8)
	private Integer fousUserNumber; //关注用户数量
	
	@AccessType("property")
	@Column(name="fousedNumber",length=8)
	private Integer fousedNumber; //被关注数量
	
	@AccessType("property")
	@Column(name="fousTopicNumber",length=8)
	private Integer fousTopicNumber; //关注话题数量
	
	@AccessType("property")
	@Column(name="fousFlateNumber",length=8)
	private Integer fousFlateNumber; //关注板块数量
	
	@AccessType("property")
	@Column(name="integration",length=10)
	private int integration;//积分
	
	@AccessType("property")
	@Column(name="prestige",length=10)
	private int prestige;//威望
	

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public byte getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(byte deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public byte getSex() {
		return sex;
	}

	public void setSex(byte sex) {
		this.sex = sex;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public byte getHide() {
		return hide;
	}

	public void setHide(byte hide) {
		this.hide = hide;
	}

	public Integer getLook() {
		return look;
	}

	public void setLook(Integer look) {
		this.look = look;
	}
	
	public Integer getFousedNumber() {
		return fousedNumber;
	}

	public void setFousedNumber(Integer fousedNumber) {
		this.fousedNumber = fousedNumber;
	}

	public Integer getFousUserNumber() {
		return fousUserNumber;
	}

	public void setFousUserNumber(Integer fousUserNumber) {
		this.fousUserNumber = fousUserNumber;
	}

	public Integer getFousTopicNumber() {
		return fousTopicNumber;
	}

	public void setFousTopicNumber(Integer fousTopicNumber) {
		this.fousTopicNumber = fousTopicNumber;
	}

	public Integer getFousFlateNumber() {
		return fousFlateNumber;
	}

	public void setFousFlateNumber(Integer fousFlateNumber) {
		this.fousFlateNumber = fousFlateNumber;
	}

	public int getIntegration() {
		return integration;
	}

	public void setIntegration(int integration) {
		this.integration = integration;
	}

	public int getPrestige() {
		return prestige;
	}

	public void setPrestige(int prestige) {
		this.prestige = prestige;
	}
	
	
}
