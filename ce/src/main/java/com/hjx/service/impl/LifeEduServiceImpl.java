package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.LifeEduDao;
import com.hjx.model.LifeEdu;
import com.hjx.service.LifeEduService;


@Service("lifeEduService")
@Transactional
public class LifeEduServiceImpl extends BaseServiceImpl<LifeEdu> implements LifeEduService {

	@Autowired
	private LifeEduDao lifeEduDao;
	
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.lifeEduDao;
	}

	@Override
	public LifeEdu findLifeEdu(LifeEdu lifeEdu) {
		// TODO Auto-generated method stub
		return lifeEduDao.findLifeEdu(lifeEdu);
	}

}
