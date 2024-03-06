package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
//	@PostMapping("/boardInsert")
//	public String boardInsert(BoardVO bvo, RedirectAttributes ras) {
//		log.info("boardInsert 호출 성공");
//		
//		int result = 0;
//		String url = "";
//		
//		result = boardService.boardInsert(bvo);
//		if(result == 1) {
//			url = "/board/boardList";
//			
//		} else {
//			ras.addFlashAttribute("errorMsg", "입력에 문제가 있어 다시 진행해 주세요");
//			url = "/board/writeForm";
//		}
//		
//		return "redirect:"+url;
//	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO bvo) {
		log.info("boardInsert 호출 성공 ");
		boardService.boardInsert(bvo);
		return "redirect:/board/boardList";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model) {
		log.info("boardDetail 호출 성공");
		
		BoardVO detail = boardService.boardDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "client/board/boardDetail";
	}
	
	@GetMapping(value="/updateForm")
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("boardNumber = " + bvo.getBoardNumber());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData", updateData);
		return "client/board/updateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute BoardVO bvo) {
		log.info("boardUpdate 호출 성공");
		
		int result=0;
		String url ="";
		
		result = boardService.boardUpdate(bvo);
		
		if(result == 1) {
			url ="/board/boardDetail?boardNumber="+bvo.getBoardNumber();
		}else {
			url="/board/updateForm?boardNumber=" +bvo.getBoardNumber();
		}
		return "redirect:" + url;
	}
	
	@PostMapping(value="/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO bvo, RedirectAttributes ras) {
		log.info("boardDelete 호출 성공");
		
		int result = 0;
		String url = "";
		result = boardService.boardDelete(bvo);
		
		if(result == 1) {
			url ="/board/boardList";
		}else {
			ras.addFlashAttribute("errorMsg", "삭제에 문제가 있어 다시 진행해 주세요");
			url="/board/boardDetail?boardNumber="+bvo.getBoardNumber();
		}
		return "redirect:"+url;
	}
	
	@ResponseBody
	@PostMapping(value="/pwdConfirm", produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfirm 호출 성공");
		
		int result = boardService.pwdConfirm(bvo);
		String value="";
		if(result==1) {
			value="일치";
		}else {
			value="불일치";
		}
		log.info("result= " + result);
		return value;
	}
	
//	@ResponseBody
//	@PostMapping(value="/pwdConfirm", produces = "text/plain; charset=UTF-8")
//	public String pwdConfirm(BoardVO bvo) {
//		int result = boardService.pwdConfirm(bvo);
//		return(result==1) ? "일치" : "불일치";
//	}
	
	//글 삭제 전 댓글 개수 구현하기
	//@Param int
	@ResponseBody
	@PostMapping(value="/replyCount", produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyCount(@RequestParam("boardNumber") int boardNumber) {
		log.info("replyCount 호출 성공");
		
		int result = 0;
		result = boardService.replyCount(boardNumber);
		
		return String.valueOf(result);
	}
	
}
