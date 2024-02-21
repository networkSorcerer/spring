package com.spring.client.board.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class BoardDaoTests {
	@Setter(onMethod_=@Autowired)
	private BoardDAO boardDAO;
	
//	@Test
//	public void testBoardList() {
//		BoardVO boardVO = null;
//		List<BoardVO> list = boardDAO.boardList(boardVO);
//		for(BoardVO vo : list) {
//			log.info(vo.toString());
//		}
//	}
	
//	@Test
//	public void testBoardInsert() {
//		BoardVO board = new BoardVO();
//		board.setBoardName("김철수");
//		board.setBoardTitle("용기가 필요할 때");
//		board.setBoardContent("도중에 포기하지 말라. 망설이지 말라. 최후의 성공을 거둘때까지 밀고 나가자");
//		board.setBoardPasswd("1234");
//		
//		int count = boardDAO.boardInsert(board);
//		log.info("입력된 행의 수 " + count);
//		
//	}
	
	@Test
	public void testReadCntUpdate() {
		BoardVO bvo = new BoardVO();
		bvo.setBoardNumber(1);
		
		int count = boardDAO.readCntUpdate(bvo);
		log.info("수정된 행의 수 : " + count);
	}
	
	@Test
	public void testBoardDetail() {
		BoardVO bvo = new BoardVO();
		bvo.setBoardNumber(1);
		
		BoardVO board = boardDAO.boardDetail(bvo);
		log.info(board.toString());
	}
}
