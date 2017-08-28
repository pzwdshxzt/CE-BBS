package com.hjx.core.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;


/**
 * 
 * @author pkd
 *
 */

@MappedSuperclass
public abstract class VersionableEntity extends BlameableEntity
{
  private static final long serialVersionUID = -2131078288150855035L;
  public static final String F_VERSION = "version";
  private Long version = Long.valueOf(0L);

  @Version
  @Column(name="version")
  public Long getVersion() { if (this.version == null) {
      this.version = Long.valueOf(0L);
    }
    return this.version;
  }



  public void setVersion(Long version) {
    this.version = version;
    if (this.version == null)
      this.version = Long.valueOf(0L);
  }


}