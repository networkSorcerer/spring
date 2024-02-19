package com.boot.example.service;

import java.util.List;

import com.boot.example.domain.BookVO;

//여기에 어노테이션 붙이는게 아니라 BookServiceImpl에 어노테이션 붙임
public interface BookService {
	public List<BookVO> bookList();
}
