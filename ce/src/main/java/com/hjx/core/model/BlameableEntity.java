package com.hjx.core.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;


/**
 * 
 * @author pkd
 *
 */
@MappedSuperclass
public abstract class BlameableEntity extends AbstractEntity
{
  private static final long serialVersionUID = -1683290940520353667L;
  private String createdBy;
  private String updatedBy;

  @Column(name="create_by", updatable=false)
  public String getCreatedBy()
  {
    return this.createdBy;
  }
  @Column(name="update_by")
  public String getUpdatedBy() {
    return this.updatedBy;
  }



  public void setCreatedBy(String createBy) {
    this.createdBy = createBy;
  }

  public void setUpdatedBy(String updateBy) {
    this.updatedBy = updateBy;
  }


}