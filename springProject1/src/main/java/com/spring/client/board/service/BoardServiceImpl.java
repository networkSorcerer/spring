package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{
	@Setter(onMethod_=@Autowired)
	private BoardDAO boardDAO;
	
	//글목록 구현
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> list =null;
		list = boardDAO.boardList(bvo);
		return list;
	}
	
	@Override
	public int boardInsert(BoardVO bvo) {
		int result = 0;
		//예외를 발생시킬 코드 작성
//		bvo.setBoardNumber(0);
//		if(bvo.getBoardNumber() == 0)  {
//			return result;
//		}
		result = boardDAO.boardInsert(bvo);
		return result;
	}
	
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		boardDAO.readCntUpdate(bvo);
		
		BoardVO detail = boardDAO.boardDetail(bvo);
		if(detail != null) {
			detail.setBoardContent(detail.getBoardContent().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	
	@Override
	public BoardVO updateForm(BoardVO bvo) {
		BoardVO updateData = null;
		updateData = boardDAO.boardDetail(bvo);
		return updateData;
	}
 }
