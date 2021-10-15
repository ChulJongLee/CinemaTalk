package com.kosta.service;

import java.util.List;
import java.util.Map;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public interface PersonService {
//	public List<PersonInfoDTO> getKobisPersonList() throws OpenAPIFault, Exception;
//	public List<PersonInfoDTO> addPersonDetail() throws OpenAPIFault, Exception;
//	public List<PersonInfoDTO> addPersonPic() throws OpenAPIFault, Exception;
	
	public void insertPersonInfo(String keyword) throws OpenAPIFault, Exception;

	public PersonInfoDTO getPersonInfo(String peopleCd);

	public String[] getPersonFilmo(String peopleCd);

	public KobisDTO getMovieFilmo(String item);

	public String[] getRealatedPerson(Map<String, String> hm);
	
	public List<KobisDTO> getFilmoList(String peopleCd, int startRow, int pageSize);

	public int getFilmoNum(String peopleCd);

}

