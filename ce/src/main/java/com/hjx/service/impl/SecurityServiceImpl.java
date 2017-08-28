package com.hjx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.SecurityDao;
import com.hjx.model.Security;
import com.hjx.service.SecurityService;

@Service("securityService")
@Transactional
public class SecurityServiceImpl extends BaseServiceImpl<Security> implements SecurityService {

	@Autowired
	private SecurityDao securityDao;
	@Override
	protected IBaseDao getDao() {
		return this.securityDao;
	}
	@Override
	public Security loginSecurity(Security security) {
		// TODO Auto-generated method stub
		return securityDao.loginSecurity(security);
	}

	@Override
	public boolean checkEmail(Security security) {
		// TODO Auto-generated method stub
		return securityDao.checkEmail(security);
	}
	@Override
	public boolean updatePassword(Security security) {
		// TODO Auto-generated method stub
		return securityDao.updatePassword(security);
	}
	@Override
	public Security findSecurity(Security security) {
		// TODO Auto-generated method stub
		return securityDao.findSecurity(security);
	}
	@Override
	public boolean updateEmail(Security security) {
		// TODO Auto-generated method stub
		return securityDao.updateEmail(security);
	}
	@Override
	public boolean updateTel(Security security) {
		// TODO Auto-generated method stub
		return securityDao.updateTel(security);
	}
	@Override
	public Security findSecurityByEmail(Security security) {
		// TODO Auto-generated method stub
		return securityDao.findSecurityByEmail(security);
	}

}
