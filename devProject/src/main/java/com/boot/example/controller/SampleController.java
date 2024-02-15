package com.boot.example.controller;



import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.example.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/sample/*")
@Slf4j
public class SampleController {
	
//	@GetMapping("/basic")
//	public String basic() {
//		log.info("basic get...................");
//		
//		return "example/basic"; //WEB-INF/views/example/basic.jsp
//	}
	
	@GetMapping("/basic")
	public void basic() {
		log.info("basic get1......................");
	}
	//요청 url : http://localhost:8080/sample/bbs?kind=notice
	//params는 쿼리스트링에 따라 요청 범위를 제한 
	@GetMapping(path="/bbs", params = "kind=notice")
	public String get1() {
		log.info("params에 따른 get2......................");
		
		return "example/basic";
	}
	
	@GetMapping(path="/bbs", params = "kind=qna")
	public String get2() {
		log.info("params에 따른 get3.......................");
		
		return "example/basic";
	}
	
	//요청 방법 : http://localhost:8080/sample/exma01?name=홍길동&age=25
	@GetMapping("/exam01")
	public String exam01(@RequestParam("name") String name, 
			@RequestParam(required = false, defaultValue = "0") int age, Model model) {
		log.info("name : " +name);
		log.info("age : " + age);
		
		model.addAttribute("name",name);
		model.addAttribute("age", age);
		return "example/exam01"; //뷰정보 : /WEB-INF/views/example/exam01.jsp
	}
	//@ModelAttribute는 전달 받은 파라미터를 Model에 담아서 전달하도록 할 때 필요한 어노테이션이다
	@GetMapping("/exam02")
	public String exam02(@ModelAttribute SampleDTO dto) {
		log.info("" + dto);
		
		return "example/exam02";
	}
	
	@GetMapping("/exam02Array")
	public String exam02Array(@RequestParam("hobby") String[] hobby, Model model) {
		log.info("array hobby: " + Arrays.toString(hobby));
		
		model.addAttribute("hobby", hobby);
		return "example/exam02Array";
	}
	
	@GetMapping("/exam02List")
	public String exam02List(@RequestParam("language") ArrayList<String> language, Model model) {
		for(String lang : language ) {
			log.info("language values : " + lang);
		}
		model.addAttribute("language", language);
		
		return "example/exam02List";
	}
}
