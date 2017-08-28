package com.hjx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjx.core.dao.IBaseDao;
import com.hjx.core.service.impl.BaseServiceImpl;
import com.hjx.dao.ReplyDao;
import com.hjx.model.Reply;
import com.hjx.model.User;
import com.hjx.service.ReplyService;
import com.hjx.vo.ReplyVo;
@Service("replyService")
@Transactional
public class ReplyServiceImpl extends BaseServiceImpl<Reply> implements ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	@Override
	protected IBaseDao getDao() {
		// TODO Auto-generated method stub
		return this.replyDao;
	}

	@Override
	public Boolean deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return replyDao.deleteReply(reply);
	}

	@Override
	public List<Reply> seachReply(String seach) {
		// TODO Auto-generated method stub
		return replyDao.seachReply(seach);
	}

	@Override
	public List<ReplyVo> findReply(User user) {
		// TODO Auto-generated method stub
		return replyDao.findReply(user);
	}

}
