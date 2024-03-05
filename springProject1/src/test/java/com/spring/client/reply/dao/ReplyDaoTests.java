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
	
	/*
	 * @Test public void testReplyList() { ReplyVO rvo = new ReplyVO();
	 * rvo.setBoardNumber(1); List<ReplyVO> list = replyDao.replyList(rvo);
	 * for(ReplyVO vo : list) { log.info(vo.toString()); } }
	 */
	
//	@Test
//	public void testReplyInsert() {
//		ReplyVO rvo = new ReplyVO();
//		rvo.setBoardNumber(1);
//		rvo.setReplyName("홍길동");
//		rvo.setReplyContent("남을 위해 사는 착한사람 말고, 나를 위해 사는 좋은 사람이 되기를");
//		rvo.setReplyPasswd("1234");
//		int result = replyDao.replyInsert(rvo);
//		
//		log.info("입력결과 : " + result);
//		
//	}
	
	@Test
	public void restReplyDelete() {
		ReplyVO rvo = new ReplyVO();
		rvo.setReplyNumber(1);
		int result = replyDao.replyDelete(rvo);
		
		log.info("삭제결과 : " + result);
	}
}
