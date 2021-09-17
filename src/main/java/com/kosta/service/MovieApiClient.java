package com.kosta.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kosta.dto.MovieResponseDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieApiClient {
	private final RestTemplate restTemplate;
	private static String CLIENT_ID;
	private static String CLIENT_SECRET;

	@Value("${CLIENT_ID}")
	public void setClientId(String value) {
		CLIENT_ID = value;
	}

	@Value("${CLIENT_SECRET}")
	public void setClientSecret(String value) {
		CLIENT_SECRET = value;
	}

	private final String OpenNaverMovieUrl_getMovies = "https://openapi.naver.com/v1/search/movie.json?query={keyword}";

	public MovieResponseDTO requestMovie(String keyword) {

		final HttpHeaders headers = new HttpHeaders();
		headers.set("X-Naver-Client-Id", CLIENT_ID);
		headers.set("X-Naver-Client-Secret", CLIENT_SECRET);

		final HttpEntity<String> entity = new HttpEntity<String>(headers);
		return restTemplate.exchange(OpenNaverMovieUrl_getMovies, HttpMethod.GET, entity, MovieResponseDTO.class, keyword).getBody();

	}
}
