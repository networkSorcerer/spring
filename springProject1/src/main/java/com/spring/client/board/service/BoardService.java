package com.spring.client.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList(BoardVO bvo);
}
