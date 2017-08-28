package com.hjx.vo;

import java.util.Date;

public class UserVo {

	private Integer userId;
	private byte deleteFlag;
	private String userName; //用户名
	private byte sex;  //性别 0.保密1.男2.女
	private Date birthDay;  //生日
	private String imageUrl; //图片URL
	private String address; //地址
	private byte userHide; //隐私 //0 公开 1隐藏 
	private int lookNumber; //主页浏览次数
	private int agree;//点赞 统计 /ganxie
	private int integration;//积分
	private int prestige;//威望
	private Integer lwId; //工作Id
	private String company;  //
	private String department; //
	private String position;
	private byte isWork; //是否是学生		 /0.是 1.不是														
	private byte lifeWorkHide;  //工作hide
	private Integer leId; //学业Id
	private String education; //
	private byte lifeEduHide; //隐私 //0 公开 1隐藏 
	private String school;//
	private Integer exChangeId;
	private String qq;
	private String weChat;
	private byte exChangeHide; 
	private String email;
	private String tel;
	private Integer securityId;
	private String password; //密码
	private String securityTEL; //安全电话
	private String securityEmail; //安全邮箱
	
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
	public byte getUserHide() {
		return userHide;
	}
	public void setUserHide(byte userHide) {
		this.userHide = userHide;
	}
	public int getLookNumber() {
		return lookNumber;
	}
	public void setLookNumber(int lookNumber) {
		this.lookNumber = lookNumber;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
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
	
	public Integer getLwId() {
		return lwId;
	}
	public void setLwId(Integer lwId) {
		this.lwId = lwId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public byte getIsWork() {
		return isWork;
	}
	public void setIsWork(byte isWork) {
		this.isWork = isWork;
	}
	public byte getLifeWorkHide() {
		return lifeWorkHide;
	}
	public void setLifeWorkHide(byte lifeWorkHide) {
		this.lifeWorkHide = lifeWorkHide;
	}
	public Integer getLeId() {
		return leId;
	}
	public void setLeId(Integer leId) {
		this.leId = leId;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public byte getLifeEduHide() {
		return lifeEduHide;
	}
	public void setLifeEduHide(byte lifeEduHide) {
		this.lifeEduHide = lifeEduHide;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Integer getExChangeId() {
		return exChangeId;
	}
	public void setExChangeId(Integer exChangeId) {
		this.exChangeId = exChangeId;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWeChat() {
		return weChat;
	}
	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	public byte getExChangeHide() {
		return exChangeHide;
	}
	public void setExChangeHide(byte exChangeHide) {
		this.exChangeHide = exChangeHide;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getSecurityId() {
		return securityId;
	}
	public void setSecurityId(Integer securityId) {
		this.securityId = securityId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSecurityTEL() {
		return securityTEL;
	}
	public void setSecurityTEL(String securityTEL) {
		this.securityTEL = securityTEL;
	}
	public String getSecurityEmail() {
		return securityEmail;
	}
	public void setSecurityEmail(String securityEmail) {
		this.securityEmail = securityEmail;
	}
	
}
