package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.LifeWorkDao;
import com.hjx.model.LifeWork;
import com.hjx.service.LifeWorkService;


@Service("lifeWorkService")
@Transactional
public class LifeWorkServiceImpl extends BaseServiceImpl<LifeWork> implements LifeWorkService {

	@Autowired
	private LifeWorkDao lifeWorkDao;
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.lifeWorkDao;
	}
	@Override
	public LifeWork findLifeWork(LifeWork lifeWork) {
		// TODO Auto-generated method stub
		return lifeWorkDao.findLifeWork(lifeWork);
	}
	@Override
	public boolean updateIsWorkFlag(LifeWork lifeWork) {
		// TODO Auto-generated method stub
		return lifeWorkDao.updateIsWorkFlag(lifeWork);
	}

}
