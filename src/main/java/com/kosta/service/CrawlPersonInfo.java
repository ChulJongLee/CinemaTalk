package com.kosta.service;

import java.util.List;

import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RequestDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public interface CrawlPersonInfo {
	public List<PersonInfoDTO> addPersonDetail(RequestDTO rdto) throws OpenAPIFault, Exception;
	public String addPersonPic(String peopleNm, String movieTitle) throws OpenAPIFault, Exception;
}
