package com.spring.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reply.dao.ReplyDao;
import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_= @Autowired)
	private ReplyDao replyDao;
	
	//글목록 구현
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		List<ReplyVO> list = null;
		list = replyDao.replyList(rvo);
		return list;
	}
	
	// 글입력 구현
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyInsert(rvo);
		return result;
	}
	
	//글삭제 구현
	public int replyDelete(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyDelete(rvo);
		return result;
	}
	
}
