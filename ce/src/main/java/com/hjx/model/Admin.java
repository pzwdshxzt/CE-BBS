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
@Table(name="t_admin")
public class Admin implements Serializable {

	@Id
	@Column(name="adminId",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer adminId; //uid
	
	@AccessType("property")
	@Column(name="username",length=30)
	private String username; //
	
	@AccessType("property")
	@Column(name="password",length=30)
	private String password; //
	
	@AccessType("property")
	@Column(name="deleteFlag",length=1)
	private byte deleteFlag;
	
	@AccessType("property")
	@Column(name="authority",length=1)
	private byte authority; //角色/0.普通管理员.单纯(话题/回复) 1.高级管理员(发现/板块/会员) 2.最高(可以对管理员管理)

	
	
	public byte getAuthority() {
		return authority;
	}

	public void setAuthority(byte authority) {
		this.authority = authority;
	}

	public byte getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(byte deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
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
	
	
	
}
