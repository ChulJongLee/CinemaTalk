package com.kosta.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.google.gson.Gson;
import com.kosta.dto.KmdbResponseDTO;
import com.kosta.dto.RequestDTO;

public class KmdbAPIImple implements KmdbAPI {

	@Override
	public KmdbResponseDTO requestMovieDetail(RequestDTO rdto) throws IOException {
		// TODO Auto-generated method stub
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		String movieNm = rdto.getMovieNm().replaceAll(match, "^").replace(" ", "").replace("3D", "");
//		System.out.println(movieNm);
		for (int i = 0; i < 3; i++) {
			if (movieNm.startsWith("^")) {
				movieNm = movieNm.substring(1);
			}
		}

		String director = rdto.getDirectorNm().replaceAll(match, "").replace(" ", "^");
		if (director.startsWith("^")) {
			director = director.substring(1);
		}
		String urladdr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey="
				+ rdto.getKmdbkey() + "&detail=Y&query=" + movieNm + "&director=" + director;
		URL url = new URL(urladdr);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
//		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader br;
		int responseCode=conn.getResponseCode();
		if (responseCode >= 200 && responseCode <= 300) {
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
//	System.out.println(sb.toString().isEmpty());
		if(!sb.toString().isEmpty()) {
			Gson gson = new Gson();
			KmdbResponseDTO result = gson.fromJson(sb.toString(), KmdbResponseDTO.class);
			if (result.getTotalCount() != 0)
				return result;
		}
		return null;
	}

	@Override
	public String requestMoviePoster(RequestDTO rdto) throws MalformedURLException, IOException {
		// TODO Auto-generated method stub
		String poster = "";
		if (requestMovieDetail(rdto) != null && requestMovieDetail(rdto).getData().get(0).getResult().size() != 0) {

			String posters = requestMovieDetail(rdto).getData().get(0).getResult().get(0).getPosters();
			String posterlist[] = posters.replace("|", ",").split(",");
			poster = posterlist[0];

		}
		return poster;
	}

}
