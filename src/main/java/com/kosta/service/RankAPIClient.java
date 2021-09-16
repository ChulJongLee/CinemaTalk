package com.kosta.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kosta.dto.RankResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:api.properties")
public class RankAPIClient {

	private final SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");
	
	private static String key;
	
	@Value("${key}")
	public void setKey(String value) {
		key = value;
	}

	public RankResponseDTO requestRank() throws OpenAPIFault, Exception {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -1);
		String yesterday = DATE_FMT.format(cal.getTime());

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		String dailyResponse = service.getDailyBoxOffice(true, yesterday, "", "", "", "");

		Gson gson = new Gson();		
		JsonObject obj = gson.fromJson(dailyResponse, JsonObject.class);
		
		return gson.fromJson(obj.getAsJsonObject("boxOfficeResult").toString(), RankResponseDTO.class);
		
	}
}
