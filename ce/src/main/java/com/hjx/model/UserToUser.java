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
@Table(name="user_user")
public class UserToUser implements Serializable {

	@Id
	@Column(name="id",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id; //uid
	
	@AccessType("property")
	@Column(name="uid",length=4)
	private Integer uid; //关注的人
	
	@AccessType("property")
	@Column(name="ued",length=4)
	private Integer ued; //被关注的人

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getUed() {
		return ued;
	}

	public void setUed(Integer ued) {
		this.ued = ued;
	}
	
}
