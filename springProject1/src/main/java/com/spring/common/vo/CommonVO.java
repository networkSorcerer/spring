package com.spring.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	private int pageNum=0;   //페이지 번호
	private int amount = 0;  //페이지 보여줄 데이터 수
	
	private String search = "";
	private String keyword = "";
	
	private String startDate = "";
	private String endDate = "";
	
	public CommonVO() {
		this(1, 10);
	}
	
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
