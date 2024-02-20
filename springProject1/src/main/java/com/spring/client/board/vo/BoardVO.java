package com.spring.client.board.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNumber =0;
	private String boardName ="";
	private String boardTitle="";
	private String boardContent="";
	private String boardDate;
	private String boardPasswd ="";
	private int readcnt =0;
}
