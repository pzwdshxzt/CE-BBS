package com.hjx.service;

import com.hjx.core.service.IBaseService;
import com.hjx.model.Security;

public interface SecurityService extends IBaseService<Security> {

	/**
	 * 登录验证
	 * @param security
	 * @return Security
	 */
	public Security loginSecurity(Security security);
	

	
	/**
	 * 检验邮箱是否被注册
	 * @param security
	 * @return boolean
	 */
	public boolean checkEmail(Security security);
	
	/**
	 * 修改密码
	 * @param security
	 * @return boolean
	 */
	public boolean updatePassword(Security security);
	
	/**
	 * 修改邮箱 uid
	 * @param security
	 * @return boolean
	 */
	public boolean updateEmail(Security security);
	
	/**
	 * 修改手机 uid
	 * @param security
	 * @return boolean
	 */
	public boolean updateTel(Security security);

	/**
	 * 查找通过  Uid
	 * @param security
	 * @return Security
	 */
	public Security findSecurity(Security security);
	
	/**
	 * 查找通过 email
	 * @param security.email
	 * @return  Security
	 */
	public Security findSecurityByEmail(Security security);
}
