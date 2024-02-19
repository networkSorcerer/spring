package com.boot.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.example.domain.SubjectVO;

@Mapper
public interface SubjectDAO {
	public List<SubjectVO> subjectList();
}
