package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.Flate;

public interface FlateService extends IBaseService<Flate> {

	/**
	 * 修改删除Flag
	 * @param标记 flate
	 * @return
	 */
	public boolean deleteFlag(Flate flate);
}
