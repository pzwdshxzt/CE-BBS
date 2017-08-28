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
@Table(name="t_exChange")
public class ExChange implements Serializable {
	

	@Id
	@Column(name="id",length=4)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@AccessType("property")
	@Column(name="qq",length=20)
	private String qq;
	
	@AccessType("property")
	@Column(name="weChat",length=20)
	private String weChat;
	
	@AccessType("property")
	@Column(name="hide",length=1)
	private byte hide; //隐私 //0 公开 1隐藏 
	
	@AccessType("property")
	@Column(name="email",length=20)
	private String email;
	
	@AccessType("property")
	@Column(name="tel",length=20)
	private String tel;

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
	
}
