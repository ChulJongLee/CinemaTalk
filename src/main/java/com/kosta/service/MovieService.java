package com.kosta.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import com.kosta.dto.KmdbResponseDTO;
import com.kosta.dto.KobisDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


public interface MovieService {	
	public List<KobisDTO> requestMovieList(String keyword) throws OpenAPIFault, Exception;
	public KobisDTO requestMovieDetail(String movieCdList) throws OpenAPIFault, Exception;
	public KmdbResponseDTO requestMovieDetail(String movieCd, String movieNm, String showTm, String director) throws MalformedURLException, IOException;
	public String requestMoviePoster(String movieNm, String director) throws MalformedURLException, IOException;
	public List<KobisDTO> requestRank() throws OpenAPIFault, Exception;

}