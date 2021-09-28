package com.kosta.service;

import java.io.IOException;
import java.net.MalformedURLException;

import com.kosta.dto.KmdbResponseDTO;
import com.kosta.dto.KobisResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


public interface MovieService {	
	public KobisResponseDTO requestMovieList(String keyword) throws OpenAPIFault, Exception;
	public KobisResponseDTO requestMovieDetail(String movieCdList) throws OpenAPIFault, Exception;
	public KmdbResponseDTO requestMovieDetail(String movieCd, String movieNm, String showTm, String director) throws MalformedURLException, IOException;
	public String requestMoviePoster(String movieNm, String director) throws MalformedURLException, IOException;
	public KobisResponseDTO requestRank() throws OpenAPIFault, Exception;

}