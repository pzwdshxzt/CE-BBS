package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.ExChange;

public interface ExChangeService extends IBaseService<ExChange>{

	
	/**
	 * 查找通过  Uid
	 * @param exChange
	 * @return 
	 */
	public ExChange findExChange(ExChange exChange);
}
