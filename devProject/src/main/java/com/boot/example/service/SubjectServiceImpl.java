package com.boot.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.example.dao.SubjectDAO;
import com.boot.example.domain.SubjectVO;

import lombok.Setter;

@Service
public class SubjectServiceImpl implements SubjectService {
	 // BookDAO 빈을 주입받기 위한 필드 선언
	@Setter(onMethod_ = @Autowired )
	private SubjectDAO subjectDAO;
	
	// BookService 인터페이스의 메서드를 구현
	@Override
	public List<SubjectVO> subjectList() {
		// BookDAO를 사용하여 도서 목록을 가져옴
		List<SubjectVO> list = null;
		list = subjectDAO.subjectList();
		// 도서 목록 반환
		return list;
	}
}
