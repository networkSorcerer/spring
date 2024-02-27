package com.spring.openapi.data.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

@Service
public class DataServiceImpl implements DataService {
	
	@Override
	public StringBuffer chungnamList() throws Exception {
		
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/");
		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour","UTF-8"));
		site.append("&" + URLEncoder.encode("start","UTF-8") + "=" +URLEncoder.encode("1","UTF-8"));
		site.append("&" + URLEncoder.encode("end","UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
		
		URL url = new URL(site.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/xml");
		
		int resCode = conn.getResponseCode();
		System.out.println("응답코드 : " + resCode);
		
		BufferedReader in = new BufferedReader (new InputStreamReader(conn.getInputStream(), "UTF-8"));
		String inputLine;
		StringBuffer output = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			output.append(inputLine);
		}
		
		return output;
	}
	
	@Override
	public StringBuffer chungnamDetail(String mng_no) throws Exception {
		String site = "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&mode=V&mng_no="+mng_no;
		URL url = new URL(site);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		int resCode = conn.getResponseCode();
		System.out.println("응답코드 : " + resCode);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		String inputLine;
		StringBuffer output = new StringBuffer();
		while((inputLine = in.readLine()) != null) {
			output.append(inputLine);
		}
		return output;
	}
}
