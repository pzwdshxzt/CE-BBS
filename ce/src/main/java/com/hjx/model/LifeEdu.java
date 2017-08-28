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
@Table(name="t_lifeEdu")
public class LifeEdu implements Serializable {


	@Id
	@Column(name="id",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@AccessType("property")
	@Column(name="education",length=20)
	private String education; //
	
	@AccessType("property")
	@Column(name="hide",length=1)
	private byte hide; //隐私 //0 公开 1隐藏 
	
	@AccessType("property")
	@Column(name="school",length=20)
	private String school;//
	
	@AccessType("property")
	@Column(name="uid",length=4)
	private Integer uid;
	
	
	public byte getHide() {
		return hide;
	}
	public void setHide(byte hide) {
		this.hide = hide;
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
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	
	
	
	
}
