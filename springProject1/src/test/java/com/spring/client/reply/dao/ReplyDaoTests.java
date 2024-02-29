package com.spring.client.reply.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class ReplyDaoTests {
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
	@Test
	public void testReplyList() {
		ReplyVO rvo = new ReplyVO();
		rvo.setBoardNumber(1);
		List<ReplyVO> list = replyDao.replyList(rvo);
		for(ReplyVO vo : list) {
			log.info(vo.toString());
		}
	}
}
