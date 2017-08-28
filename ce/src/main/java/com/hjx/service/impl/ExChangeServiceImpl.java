package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.ExChangeDao;
import com.hjx.model.ExChange;
import com.hjx.service.ExChangeService;



@Service("exChangeService")
@Transactional
public class ExChangeServiceImpl extends BaseServiceImpl<ExChange> implements ExChangeService {

	@Autowired
	private ExChangeDao exChangeDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.exChangeDao;
	}
	@Override
	public ExChange findExChange(ExChange exChange) {
		// TODO Auto-generated method stub
		return exChangeDao.findExChange(exChange);
	}

}
