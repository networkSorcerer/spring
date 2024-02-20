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
	
	@Test
	public void testBoardList() {
		BoardVO boardVO = null;
		List<BoardVO> list = boardDAO.boardList(boardVO);
		for(BoardVO vo : list) {
			log.info(vo.toString());
		}
	}
}
