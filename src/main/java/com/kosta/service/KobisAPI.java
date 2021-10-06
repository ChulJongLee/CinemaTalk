package com.kosta.service;

import java.util.List;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RequestDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public interface KobisAPI {
//	public List<KobisDTO> getMovieList(RequestDTO rdto) throws OpenAPIFault, Exception;
//	public void deleteMovieList(List<KobisDTO> list);
//	public List<KobisDTO> getMovieListPlus(List<KobisDTO> list, RequestDTO rdto) throws OpenAPIFault, Exception;
//	public int getMovieCount(RequestDTO rdto) throws OpenAPIFault, Exception;
//	public KobisDTO getMovieDetail(RequestDTO rdto) throws OpenAPIFault, Exception;
	public List<KobisDTO> requestRank(RequestDTO rdto) throws OpenAPIFault, Exception ;
	public List<KobisDTO> requestMovieList(RequestDTO rdto) throws OpenAPIFault, Exception;
//	public String getKor(String word);
	public List<PersonInfoDTO> requestPersonList(RequestDTO rdto) throws OpenAPIFault, Exception;
	public List<PersonInfoDTO> getKobisPersonList(RequestDTO rdto) throws OpenAPIFault, Exception;
	public List<PersonInfoDTO> addPersonInfo(RequestDTO rdto) throws OpenAPIFault, Exception;
}
