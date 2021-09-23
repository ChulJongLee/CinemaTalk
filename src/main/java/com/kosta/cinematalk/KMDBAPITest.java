package com.kosta.cinematalk;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam; 

@Controller
//@PropertySource("classpath:api.properties")
public class KMDBAPITest { 
	
	@GetMapping("/searchposter")
	public String searchposter() {
		return "searchposter";
	}
	
	
	@PostMapping("/searchposterresult")
	public String main(@RequestParam String keyword, Model model) throws IOException { 

		
		String urladdr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=서비스키&detail=Y&query=" + keyword;
		URL url = new URL(urladdr);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		

		conn.setRequestMethod("GET"); 
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode()); 
		BufferedReader br; 
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { 
			br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
		} else { 
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream())); 
		} 

		StringBuilder sb = new StringBuilder(); 
		String line; 

		while ((line = br.readLine()) != null) { 
			sb.append(line); 
		} 
		br.close(); 
		conn.disconnect(); 
		
		model.addAttribute("result", sb.toString());
		
		return "searchposterresult";
	} 
}