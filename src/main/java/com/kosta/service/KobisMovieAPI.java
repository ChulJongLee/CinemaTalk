package com.kosta.service;

import com.kosta.dto.KobisResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


public interface KobisMovieAPI {	
	public KobisResponseDTO requestMovieCode(String keyword) throws OpenAPIFault, Exception;
	public KobisResponseDTO requestMovieDetail(String movieCdList) throws OpenAPIFault, Exception;

}