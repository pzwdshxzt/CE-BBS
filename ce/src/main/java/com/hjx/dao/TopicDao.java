package com.hjx.dao;

import java.util.List;

import com.hjx.core.dao.IBaseDao;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.vo.TopicVo;

public interface TopicDao extends IBaseDao<Topic>{

	
	/**
	 * 删除话题
	 * @param topic
	 */
	public Boolean deleteTopic(Topic topic);

	/**
	 * 修改置顶
	 * @param topic
	 * @return topicId
	 */
	public Boolean changeStick(Topic topic);
	
	/**
	 * 查找话题
	 * @param seach
	 * @return
	 */
	public List<Topic> seachTopic(String seach);
	
	/**
	 * 查找发现话题
	 * @param seach
	 * @return
	 */
	public List<Topic> seachFxTopic(String seach);
	
	/**
	 * 修改发现标记
	 * @param topic
	 * @return topicId
	 */
	public Boolean changeFindFlag(Topic topic);
	
	/**
	 * 查找话题 
	 * @param topic
	 * @return TopicVo
	 */	
	public TopicVo findTopic(Topic topic);
	
	/**
	 * 查找某个用户所有话题 
	 * @param user
	 * @return TopicVo
	 */	
	public List<TopicVo> findTopic(User user);
}
