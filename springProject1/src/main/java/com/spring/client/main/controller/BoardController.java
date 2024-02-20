package com.spring.client.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
	@Setter(onMethod_=@Autowired)
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public String boardList(@ModelAttribute BoardVO bvo, Model model) {
		log.info("boardList 호출 성공");
		
		//전체 레코드 조회
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList", boardList);
		
		return "client/board/boardList"; // /WEB-INF/views/client/board/boardList.jsp
		
	}
	
	@GetMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		
		return "client/board/writeForm"; //  /WEB-INF/views/client/board/writeForm.jsp
	}
}
