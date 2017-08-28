package com.hjx.dao;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.User;
import com.hjx.vo.UserVo;


public interface UserDao extends IBaseDao<User> {

	/**
	 * 查找用户
	 * @param user
	 * @return UserVo
	 *//*	
	public UserVo findUser(User user);*/

	/**
	 * 用户添加
	 * @param user
	 * @return  返回添加的Id
	 */
	public Integer addUser(User user);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);
	
	/**
	 * 删除用户信息
	 * @param user
	 * @return
	 */
	public boolean deleteUser(User user);
	
	/**
	 * 检验用户名是否被使用
	 * @param user
	 * @return boolean
	 */
	public boolean checkUsername(User user);
}
