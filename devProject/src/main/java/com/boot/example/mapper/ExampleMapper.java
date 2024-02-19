package com.boot.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.example.domain.BookVO;



@Mapper
public interface ExampleMapper {
	@Select("select sysdate from dual")
	public String getTime();
	
	public String getDate();
	
	public List<BookVO> getBookList();
}


