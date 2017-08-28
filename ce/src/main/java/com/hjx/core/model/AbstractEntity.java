package com.hjx.core.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/*
 * @DynamicInsert   hibernate4中可以提高添加性能   hibernate3不能使用
 * @DynamicUpdate   hibernate4中可以提高修改性能  hibernate3不能使用
 */

/**
 * 
 * @author pkd
 *
 */

@MappedSuperclass
public abstract class AbstractEntity implements Serializable {
	private static final long serialVersionUID = 7687101844541831460L;
	private Date createdAt;//　　创建时间
	private Date updatedAt;//　　更新时间
	private Integer flagAt;//　　删除标记。

	@Column(name = "is_delete")
	public Integer getFlagAt() {
		return flagAt;
	}

	public void setFlagAt(Integer flagAt) {
		this.flagAt = flagAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", updatable = false)
	public Date getCreatedAt() {
		return this.createdAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_time")
	public Date getUpdatedAt() {
		return this.updatedAt;
	}


	public void setCreatedAt(Date createDate) {
		this.createdAt = createDate;
	}

	public void setUpdatedAt(Date updateDate) {
		this.updatedAt = updateDate;
	}



}