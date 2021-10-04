package com.kosta.service;

import java.util.List;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.RequestDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


public interface MovieService {	
	public void insertMovie(RequestDTO rdto) throws OpenAPIFault, Exception;
	public KobisDTO getMovieDetail(String movieCd);
	public List<KobisDTO> getMovieList(String keyword);
	public void insertRank(RequestDTO rdto) throws OpenAPIFault, Exception;
	public List<KobisDTO> getMovieRank();
}