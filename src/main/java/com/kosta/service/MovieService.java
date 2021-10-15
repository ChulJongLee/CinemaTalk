package com.kosta.service;

import java.util.List;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.RequestDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


public interface MovieService {	
	public void insertMovie(RequestDTO rdto) throws OpenAPIFault, Exception;
	public KobisDTO getMovieDetail(String movieCd);
	public List<KobisDTO> getMovieList(String keyword, int startRow, int pageSize);
	public List<KobisDTO> getMovieGenreList(String keyword, int startRow, int pageSize);
	public void insertRank(RequestDTO rdto) throws OpenAPIFault, Exception;
	public List<KobisDTO> getMovieRank();
	public List<KobisDTO> getRandomList();
	public void movieRate(RateDTO movieRateData);
	public List<PersonInfoDTO> getPersonInfo(String movieCd);
	public List<KobisDTO> getMovieRate();
	public List<KobisDTO> getMovieOpen();
	public float getMovieRateOne(String movieCd, int user_no);
	public int getTotalCount(String keyword);
	public int getGenreCount(String keyword);
}