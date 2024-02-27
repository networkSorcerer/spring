package com.spring.client.reply.vo;

import lombok.Data;

@Data
public class ReplyVO{ 
	private int    replyNumber     = 0;  //댓글번호
	private int    boardNumber     = 0;  //게시판 글번호
	private String replyName       = ""; //댓글 작성자  
	private String replyContent    = ""; //댓글 내용 
	private String replyDate       = ""; //댓글 작성일 
	private String replyPasswd     = ""; //댓글 비밀번호 
}