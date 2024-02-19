package com.boot.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.example.dao.BookDAO;
import com.boot.example.domain.BookVO;

import lombok.Setter;

@Service
public class BookServieImpl implements BookService {
	 // BookDAO 빈을 주입받기 위한 필드 선언
	@Setter(onMethod_ = @Autowired )
	private BookDAO bookDAO;
	
	// BookService 인터페이스의 메서드를 구현
	@Override
	public List<BookVO> bookList() {
		// BookDAO를 사용하여 도서 목록을 가져옴
		List<BookVO> bookList = bookDAO.bookList();
		// 도서 목록 반환
		return bookList;
	}
}
