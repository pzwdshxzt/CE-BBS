package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.Flate;

public interface FlateDao extends IBaseDao<Flate>  {

	
	/**
	 * 修改删除Flag
	 * @param标记 flate
	 * @return
	 */
	public boolean deleteFlag(Flate flate);
}
