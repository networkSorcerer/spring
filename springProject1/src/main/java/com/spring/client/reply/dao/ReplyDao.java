package com.spring.client.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.client.reply.vo.ReplyVO;

@Mapper
public interface ReplyDao {
	public List<ReplyVO> replyList(ReplyVO rvo);
}
