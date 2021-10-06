package com.kosta.service;

import java.util.List;

import com.kosta.dto.PersonInfoDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public interface PersonService {
//	public List<PersonInfoDTO> getKobisPersonList() throws OpenAPIFault, Exception;
//	public List<PersonInfoDTO> addPersonDetail() throws OpenAPIFault, Exception;
//	public List<PersonInfoDTO> addPersonPic() throws OpenAPIFault, Exception;
	
	public void insertPersonInfo(String keyword) throws OpenAPIFault, Exception;

}

