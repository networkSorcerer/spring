package com.spring.client.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	@GetMapping("/")
	@ResponseBody
	public String index() {
		
		return "springProject 실행 화면 &#x1F1FA;&#x1F1F8;";
	}
	
}
