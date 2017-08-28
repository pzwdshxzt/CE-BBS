package com.hjx.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.AccessType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="t_security")
public class Security implements Serializable {

	@Id
	@Column(name="id",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@AccessType("property")
	@Column(name="uid",length=4)
	private Integer uid;
	
	@AccessType("property")
	@Column(name="password",length=20)
	private String password; //密码
	
	@AccessType("property")
	@Column(name="securityTEL",length=20)
	private String securityTEL; //安全电话

	@AccessType("property")
	@Column(name="securityEmail",length=20)
	private String securityEmail; //安全邮箱
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
}
