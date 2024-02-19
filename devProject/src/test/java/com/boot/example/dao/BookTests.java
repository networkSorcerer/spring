package com.boot.example.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;

import com.boot.example.domain.BookVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class BookTests {
	@Setter(onMethod_ = @Autowired)
	//@Autowired를 사용하면 스프링이 해당 타입의 빈을 찾아서 자동으로 주입해줍니다. 
	//이를 통해 객체 간의 결합도를 낮추고 유연성을 높일 수 있습니다.
	private BookDAO bookDAO;
	
	@Test
	public void testBookList() {
		log.info("getBookList() 메서드 실행");
		List<BookVO> list = bookDAO.bookList();
		for(BookVO vo : list) {
			log.info(vo.toString());
		}
		log.info("레코드수: " + list.size());
	}
}
