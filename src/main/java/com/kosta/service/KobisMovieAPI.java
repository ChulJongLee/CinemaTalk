package com.kosta.service;

import com.kosta.dto.KobisResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


public interface KobisMovieAPI {	
	public KobisResponseDTO requestMovieList(String keyword) throws OpenAPIFault, Exception;
	public KobisResponseDTO requestMovieDetail(String movieCdList) throws OpenAPIFault, Exception;

}