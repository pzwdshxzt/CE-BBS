package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.FlateDao;
import com.hjx.model.Flate;
import com.hjx.service.FlateService;

@Service("flateService")
@Transactional
public class FlateServiceImpl extends BaseServiceImpl<Flate> implements FlateService {

	@Autowired
	private FlateDao flateDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.flateDao;
	}
	@Override
	public boolean deleteFlag(Flate flate) {
		// TODO Auto-generated method stub
		return flateDao.deleteFlag(flate);
	}

}
