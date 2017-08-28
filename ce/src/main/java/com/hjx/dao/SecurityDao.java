package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.Security;

public interface SecurityDao extends IBaseDao<Security> {
	

	/**
	 * 登录验证
	 * @param security
	 * @return
	 */
	public Security loginSecurity(Security security);
	
	
	/**
	 * 修改邮箱 uid
	 * @param security
	 * @return 
	 */
	public boolean updateEmail(Security security);
	
	/**
	 * 修改手机 uid
	 * @param security
	 * @return 
	 */
	public boolean updateTel(Security security);
	
	/**
	 * 修改密码
	 * @param security
	 * @return 
	 */
	public boolean updatePassword(Security security);
	
	/**
	 * 检验邮箱是否被注册
	 * @param security
	 * @return true 没有找到  false 已被注册
	 */
	public boolean checkEmail(Security security);
	/**
	 * 查找通过  Uid
	 * @param security
	 * @return 
	 */
	public Security findSecurity(Security security);
	

	/**
	 * 查找通过 email
	 * @param security.email
	 * @return  Security
	 */
	public Security findSecurityByEmail(Security security);
}
