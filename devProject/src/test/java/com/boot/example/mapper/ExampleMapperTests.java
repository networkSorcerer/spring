package com.boot.example.mapper;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.example.domain.BookVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ExampleMapperTests {
	//@Setter(onMethod_ = @Autowired)
	@Autowired
	private ExampleMapper exampleMapper;
	
	@Test
	public void testGetTime() {
		log.info(exampleMapper.getClass().getName());
		log.info("getTime() 메서드 실행");
		log.info(exampleMapper.getTime());
	}
	
	@Test
	public void testGetDate() {
		log.info("getDate() 메서드 실행");
		log.info(exampleMapper.getDate());
	}
	
	@Test
	public void testBookList() {
		log.info("getBookList() 메서드 실행");
		List<BookVO> list = exampleMapper.getBookList();
		for(BookVO vo : list) {
			log.info(vo.toString());
		}
		log.info("레코드수: " + list.size());
	}
}
