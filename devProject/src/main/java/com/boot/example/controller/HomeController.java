package com.boot.example.controller; //패키지 선언

//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//import java.util.Locale;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import문 필요한 클래스 및 패키지를 가져옵니다
//'Controller', 'LocalDateTime','DateTimeFormatter','Locale','Model','GetMapping'
//등을 사용합니다
@Controller 
public class HomeController {//컨트롤러 클래스 선언
	
	//@GetMapping("/")//GetMapping 어노테이션 사용
	//HTTP GET메서드로 "/"경로에 대한 요청을 처리하는 메서드를 정의 합니다
//	public String home(Locale locale, Model model) {//home 메서드는 Locale과 Model을 매개변수로 받습니다
//		LocalDateTime now = LocalDateTime.now(); //LocalDateTime클래스를 사용하여 현재날짜와 시간을 가져옴
//		
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 (E) a hh시 mm분 ss초");
//		String formattedNow = now.format(formatter);//DateTimeFormatter를 사용하여 날짜와 시간을 지정된 패턴으로 포메팅합니다
//		model.addAttribute("serverTime", formattedNow);//모델에 속성 추가 . 포맷팅된 날짜와 시간을 모덴속성 "serverTime"으로 추가합니다
//		
//		return "home"; //  /WEB-INF/views/home.jsp
//	}
	@GetMapping("/")
	public String main() {
		return "main"; //WEB-INF/views/main.jsp
	}
}
