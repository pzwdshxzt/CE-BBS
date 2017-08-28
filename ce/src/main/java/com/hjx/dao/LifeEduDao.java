package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.LifeEdu;

public interface LifeEduDao extends IBaseDao<LifeEdu> {

	/**
	 * 查找通过  Uid
	 * @param lifeEdu
	 * @return 
	 */
	public LifeEdu findLifeEdu(LifeEdu lifeEdu);
	
}
