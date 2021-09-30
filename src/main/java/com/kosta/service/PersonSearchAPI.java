package com.kosta.service;

import java.util.List;

import com.kosta.dto.PersonInfoDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public interface PersonSearchAPI {
	public List<PersonInfoDTO> getKobisPersonList() throws OpenAPIFault, Exception;
	public void personDetail() throws OpenAPIFault, Exception;
}

