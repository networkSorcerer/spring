package com.boot.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.example.domain.SubjectVO;
import com.boot.example.service.SubjectService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/subject/*")
@Controller
public class SubjectController {
	  // BookService 빈을 주입받기 위한 필드 선언
    @Setter(onMethod_ = @Autowired)
    private SubjectService subjectService;
    
    // "/book/bookList" 경로로 들어오는 GET 요청에 대한 핸들러 메서드
    @GetMapping("/subjectList")
    public String subjectList(Model model) {
    	//Model 객체는 컨트롤러와 뷰 사이에서 데이터를 전달하는 역할을 합니다.
    	//따라서 컨트롤러에서 데이터를 모델에 추가하면, 해당 데이터는 뷰에서 사용 가능하게 됩니다.
    	
        // 로깅: bookList() 메서드 호출을 출력
        log.info("subjectList 메서드 호출");
        
        // BookService를 통해 도서 목록을 가져옴
        List<SubjectVO> subjectList = subjectService.subjectList();
        
        // 모델에 도서 목록을 추가하여 뷰로 전달
        model.addAttribute("subjectList", subjectList);
        
        // "book/bookList" 뷰로 이동
        return "subject/subjectList"; // /WEB-INF/views/book/bookList.jsp
	}
}
