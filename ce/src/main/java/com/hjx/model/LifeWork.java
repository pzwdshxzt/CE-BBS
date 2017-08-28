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
@Table(name="t_lifeWork")
public class LifeWork implements Serializable{

	@Id
	@Column(name="id",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@AccessType("property")
	@Column(name="uid",length=4)
	private Integer uid;
	
	@AccessType("property")
	@Column(name="company",length=30)
	private String company;  //
	
	@AccessType("property")
	@Column(name="department",length=20)
	private String department; //
	
	@AccessType("property")
	@Column(name="position",length=20)
	private String position;
	
	@AccessType("property")
	@Column(name="isWork",length=1)
	private byte isWork; //是否是学生		 /0.是 1.不是														
	
	@AccessType("property")
	@Column(name="hide",length=1)
	private byte hide; //隐私 //0 公开 1隐藏 
	
	
	
	public byte getIsWork() {
		return isWork;
	}
	public void setIsWork(byte isWork) {
		this.isWork = isWork;
	}
	public byte getHide() {
		return hide;
	}
	public void setHide(byte hide) {
		this.hide = hide;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	
	
	
}
