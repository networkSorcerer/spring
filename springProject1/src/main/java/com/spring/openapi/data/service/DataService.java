package com.spring.openapi.data.service;

import com.spring.openapi.data.vo.AnimalDaejeonDTO;

public interface DataService {
	public StringBuffer chungnamList() throws Exception;
	public StringBuffer chungnamDetail(String mng_no) throws Exception;
	public StringBuffer animalDaejeonList(AnimalDaejeonDTO animalDaejeonDTO) throws Exception; 
}
