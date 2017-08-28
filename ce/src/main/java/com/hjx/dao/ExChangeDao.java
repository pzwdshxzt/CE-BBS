package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.ExChange;
import com.hjx.model.Security;

public interface ExChangeDao extends IBaseDao<ExChange>{
	
	/**
	 * 查找通过  Uid
	 * @param exChange
	 * @return 
	 */
	public ExChange findExChange(ExChange exChange);

}
