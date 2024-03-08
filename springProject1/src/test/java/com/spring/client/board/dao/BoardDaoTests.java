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
	
//	@Test
//	public void testReadCntUpdate() {
//		BoardVO bvo = new BoardVO();
//		bvo.setBoardNumber(1);
//		
//		int count = boardDAO.readCntUpdate(bvo);
//		log.info("수정된 행의 수 : " + count);
//	}
//	
//	@Test
//	public void testBoardDetail() {
//		BoardVO bvo = new BoardVO();
//		bvo.setBoardNumber(1);
//		
//		BoardVO board = boardDAO.boardDetail(bvo);
//		log.info(board.toString());
//	}
	
//	@Test
//	public void testBoardUpdate() {
//		BoardVO board = new BoardVO ();
//		board.setBoardTitle("용기가 필요할 때 수정~!");
//		board.setBoardContent("당신이 할 수 있다고 믿든, 할수 없다고 믿든, 믿는 대로 될것이다~!");
//		//board.setBoardPasswd("4321");
//		board.setBoardNumber(2);
//		
//		int count = boardDAO.boardUpdate(board);
//		log.info("수정된 행의 수 : " + count);
//	}
	
//	@Test
//	public void testPwdConfirm() {
//		BoardVO bvo = new BoardVO();
//		bvo.setBoardNumber(1);
//		bvo.setBoardPasswd("1234");
//		int result = boardDAO.pwdConfirm(bvo);
//		
//		log.info("result : " + result);
//	}
	
//	@Test
//	public void testBoardList() {
//		BoardVO bvo = new BoardVO();
//		
//		bvo.setSearch("b_title");
//		bvo.setKeyword("노력");
//		
//		List<BoardVO> list = boardDAO.boardList(bvo);
//		for(BoardVO vo : list) {
//			log.info(vo.toString());
//		}
//		log.info("총 레코드 수 : " + boardDAO.boardListCnt(bvo));
//	}
	
	@Test
	public void testBoardList() {
		BoardVO bvo = new BoardVO();
		bvo.setPageNum(1);
		bvo.setAmount(10);
		
		List<BoardVO> list= boardDAO.boardList(bvo);
		for(BoardVO vo : list) {
			log.info(vo.toString());
		}
		log.info("총 레코드수 : " + boardDAO.boardListCnt(bvo)) ;
	}
	
}
