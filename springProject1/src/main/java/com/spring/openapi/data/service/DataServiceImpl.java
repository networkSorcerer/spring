package com.spring.openapi.data.service;

import java.io.BufferedReader;
import java.io.File;
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;

import com.spring.common.openapi.URLConnectUtil;
import com.spring.openapi.data.vo.AnimalDaejeonDTO;
import com.spring.openapi.data.vo.OpenApiDTO;

@Service
public class DataServiceImpl implements DataService {
	
//	@Override
//	public StringBuffer chungnamList() throws Exception {
//		
//		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
//		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
//		site.append("&" + URLEncoder.encode("start","UTF-8") + "=" +URLEncoder.encode("1","UTF-8"));
//		site.append("&" + URLEncoder.encode("end","UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
//		
//		URL url = new URL(site.toString());
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		
//		conn.setRequestMethod("GET");
//		conn.setRequestProperty("Accept", "application/xml");
//		
//		int resCode = conn.getResponseCode();
//		System.out.println("응답코드 : " + resCode);
//		
//		BufferedReader in = new BufferedReader (new InputStreamReader(conn.getInputStream(), "UTF-8"));
//		String inputLine;
//		StringBuffer output = new StringBuffer();
//		while ((inputLine = in.readLine()) != null) {
//			output.append(inputLine);
//		}
//		
//		return output;
//	}
	//시험 출제
//	@Override
//	public StringBuffer chungnamDetail(String mng_no) throws Exception {
//		String site = "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&mode=V&mng_no="+mng_no;
//		URL url = new URL(site);
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		
//		int resCode = conn.getResponseCode();
//		System.out.println("응답코드 : " + resCode);
//		
//		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
//		String inputLine;
//		StringBuffer output = new StringBuffer();
//		while((inputLine = in.readLine()) != null) {
//			output.append(inputLine);
//		}
//		return output;
//	}
	
	@Override
	public StringBuffer chungnamList() throws Exception {
		//리스트 요청
		
		//요청 url 및 전달해 주어야 하는 파라미터
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
		site.append("&" + URLEncoder.encode("start","UTF-8") + "=" +URLEncoder.encode("1","UTF-8"));
		site.append("&" + URLEncoder.encode("end","UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
		
		//OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
	@Override
	public StringBuffer chungnamDetail(String mng_no) throws Exception {
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
		site.append("&" + URLEncoder.encode("mode","UTF-8") + "=" +URLEncoder.encode("V","UTF-8"));
		site.append("&" + URLEncoder.encode("mng_no","UTF-8") + "=" + URLEncoder.encode(mng_no,"UTF-8"));
		
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
//	@Override
//	public StringBuffer chungnamDetail(String mng_no) throws Exception {
//		String site = "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&mode=V&mng_no="+mng_no;
//		OpenApiDTO openApi = new OpenApiDTO(site, "GET");
//		
//		StringBuffer result = URLConnectUtil.openAPIData(openApi);
//		return result;
//	}
	
	@Override
	public StringBuffer animalDaejeonList(AnimalDaejeonDTO animalDaejeonDTO) throws Exception {
		StringBuffer site = new StringBuffer("http://apis.data.go.kr/6300000/animalDaejeonService/animalDaejeonList");
		site.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Va8g%2BwrI2rBylM2BYEtI2nMGQz0tlWWqvFNg6SiQlqZaMizJqW9jQ15LoKxKTXWaPCs7eqiADX3QMVswr8DMLQ%3D%3D" );
		site.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" +URLEncoder.encode("1","UTF-8"));
		site.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
		
		site.append("&" + URLEncoder.encode("searchCondition", "UTF-8") + "=" + animalDaejeonDTO.getSearchCondition());
		site.append("&" + URLEncoder.encode("searchCondition3", "UTF-8") + "=" + animalDaejeonDTO.getSearchCondition3()); 
		
		OpenApiDTO openApi = new OpenApiDTO (site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
	
	@Override
	public StringBuffer animalDaejeonItem(AnimalDaejeonDTO animalDaejeonDTO) throws Exception {
		StringBuffer site= new StringBuffer("http://apis.data.go.kr/6300000/animalDaejeonService/animalDaejeonItem");
		site.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=Va8g%2BwrI2rBylM2BYEtI2nMGQz0tlWWqvFNg6SiQlqZaMizJqW9jQ15LoKxKTXWaPCs7eqiADX3QMVswr8DMLQ%3D%3D");
		site.append("&" + URLEncoder.encode("animalSeq", "UTF-8") + "=" + animalDaejeonDTO.getAnimalSeq());
		
		OpenApiDTO openApi = new OpenApiDTO (site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;	
	}
	
	@Override
	public StringBuffer daejeonTourList() throws Exception {
		StringBuffer site = new StringBuffer("https://apis.data.go.kr/6300000/openapi2022/tourspot/gettourspot");
		site.append("?" + URLEncoder.encode("serviceKey", "UTF-8")+ "=Va8g%2BwrI2rBylM2BYEtI2nMGQz0tlWWqvFNg6SiQlqZaMizJqW9jQ15LoKxKTXWaPCs7eqiADX3QMVswr8DMLQ%3D%3D");
		site.append("&" + URLEncoder.encode("pageNo","UTF-8")+"=" +URLEncoder.encode("1","UTF-8"));
		site.append("&" +URLEncoder.encode("numOfRows","UTF-8")+ "=" +URLEncoder.encode("20","UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO (site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
	@Override
	public StringBuffer gyeongnammuseumList() throws Exception {
		StringBuffer site = new StringBuffer("http://apis.data.go.kr/6480000/gyeongnammuseum/gyeongnammuseumList");
		site.append("?" + URLEncoder.encode("serviceKey", "UTF-8")+ "=Va8g%2BwrI2rBylM2BYEtI2nMGQz0tlWWqvFNg6SiQlqZaMizJqW9jQ15LoKxKTXWaPCs7eqiADX3QMVswr8DMLQ%3D%3D");
		site.append("&" + URLEncoder.encode("pageNo","UTF-8")+"=" +URLEncoder.encode("1","UTF-8"));
		site.append("&" + URLEncoder.encode("numOfRows","UTF-8")+ "=" +URLEncoder.encode("20","UTF-8"));
		site.append("&" + URLEncoder.encode("resultType","UTF-8")+ "=" +URLEncoder.encode("json","UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO (site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
	@Override
	public List<Map<String, String>> geochanggunPopulationList() throws Exception{
		BufferedReader br
		= Files.newBufferedReader(Paths.get("C://opendata//geochanggunPopulationList.csv"));
		
		String line ="";
		//자료를 저장하기 위한 리스트
		List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
		//데이터를 저장하기 위한 리스트
		List<String> dataList = new ArrayList<String>();
		//헤더를 저장하기 위한 리스트
		List<String> headerListKor = Arrays.asList(br.readLine().split(","));
		//헤더와 매칭되는 영문 데이터를 저장하기 위한 리스트
		List<String> headerListEng = Arrays.asList(new String[]{"eubmyeon", "gagusu", 
				"ingusu", "allmen", "allwomen", "ingusu65", "men65", "women65", "ratio", "basedate"});
		Map<String, String> headerMap = new HashMap<String, String>();
		
		for(int i = 0; i < headerListKor.size(); i++) {
			headerMap.put(headerListEng.get(i), headerListKor.get(i));
		}
		mapList.add(headerMap);
		
		while((line=br.readLine())!=null) {
			String[] dataArray = line.split(",");
			dataList = Arrays.asList(dataArray);
			//헤더를 key, 데이터를 value로 저장하기 위한 맵
			Map<String, String> map = new HashMap<String , String >();
			
			for(int i =0; i < headerListEng.size(); i++) {
				map.put(headerListEng.get(i), dataList.get(i));
			}
			mapList.add(map);
		}
		return mapList;
	}

}
