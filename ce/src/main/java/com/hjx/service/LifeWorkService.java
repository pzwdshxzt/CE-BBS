package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.LifeWork;

public interface LifeWorkService extends IBaseService<LifeWork>{

	
	/**
	 * 查找通过  Uid
	 * @param lifeWork
	 * @return 
	 */
	public LifeWork findLifeWork(LifeWork lifeWork);
	
	/**
	 * 修改isworkFlag
	 * @param lifeWork
	 * @return
	 */
	public boolean updateIsWorkFlag(LifeWork lifeWork);
	
}
