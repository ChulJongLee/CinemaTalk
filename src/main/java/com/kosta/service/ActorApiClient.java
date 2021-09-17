package com.kosta.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kosta.dto.ActorResponseDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ActorApiClient {
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


	private final String OpenNaverImageUrl_getImages = "https://openapi.naver.com/v1/search/image.json?query={keyword}&display=1";

	public ActorResponseDTO requestActor(String keyword) {

		final HttpHeaders headers = new HttpHeaders();
		headers.set("X-Naver-Client-Id", CLIENT_ID);
		headers.set("X-Naver-Client-Secret", CLIENT_SECRET);

		final HttpEntity<String> entity = new HttpEntity<String>(headers);
		return restTemplate.exchange(OpenNaverImageUrl_getImages, HttpMethod.GET, entity, ActorResponseDTO.class, keyword).getBody();

	}
}
