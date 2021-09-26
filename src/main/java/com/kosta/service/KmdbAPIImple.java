package com.kosta.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kosta.dto.KmdbResponseDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KmdbAPIImple implements KmdbAPI {
	private static String key;

	@Value("${kmdbkey}")
	public void setKey(String value) {
		key = value;
	}

	@Override
	public KmdbResponseDTO requestMovieDetail(String movieCd, String movieNm, String showTm, String director) throws IOException {
		// TODO Auto-generated method stub
	    String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
	    movieNm =movieNm.replaceAll(match, "").replace(" ", "");
	    director=director.replaceAll(match, "").replace(" ", "");
		System.out.println("영화제목 : "+movieNm);

		String urladdr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey="
				+ key + "&detail=Y&query=" + movieNm+"&director="+director;

		URL url = new URL(urladdr);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader br;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		Gson gson = new Gson();
		System.out.println("sb......" + sb.toString());

		br.close();
		conn.disconnect();
		return gson.fromJson(sb.toString(), KmdbResponseDTO.class);

	}

}
