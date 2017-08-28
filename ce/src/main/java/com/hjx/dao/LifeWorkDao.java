package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.LifeWork;

public interface LifeWorkDao extends IBaseDao<LifeWork> {

	
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
