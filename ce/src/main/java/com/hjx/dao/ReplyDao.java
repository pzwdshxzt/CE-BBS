package com.hjx.dao;

import java.util.List;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.Reply;
import com.hjx.model.User;
import com.hjx.vo.ReplyVo;

public interface ReplyDao extends IBaseDao<Reply> {

	/**
	 * 删除回复
	 * @param topic
	 */
	public Boolean deleteReply(Reply reply);
	
	/**
	 * 查找话题
	 * @param seach
	 * @return
	 */
	public List<Reply> seachReply(String seach);
	
	/** 
	 * 查找所有关于userId得回复 
	 * @param seach
	 * @return
	 */
	public List<ReplyVo> findReply(User user);
	
	
}
