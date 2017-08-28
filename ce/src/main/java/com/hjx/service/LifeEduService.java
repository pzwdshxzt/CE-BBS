package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.LifeEdu;

public interface LifeEduService extends IBaseService<LifeEdu> {

	/**
	 * 查找通过  Uid
	 * @param lifeEdu
	 * @return 
	 */
	public LifeEdu findLifeEdu(LifeEdu lifeEdu);
}
