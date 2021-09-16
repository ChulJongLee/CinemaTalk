package com.kosta.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kosta.dto.RankResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:api.properties")
public class RankAPIClient {

	private final SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");

	@Value("${key}")
	private static String key;

	public RankResponseDTO requestRank() throws OpenAPIFault, Exception {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -1);
		String yesterday = DATE_FMT.format(cal.getTime());

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		String dailyResponse = service.getDailyBoxOffice(true, yesterday, "", "", "", "");

		Gson gson = new Gson();

		return gson.fromJson(dailyResponse, RankResponseDTO.class);
	}
}
