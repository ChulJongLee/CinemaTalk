package com.kosta.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RequestDTO;
import com.kosta.mapper.PersonMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonServiceImple implements PersonService {

	private static String kobiskey;

	@Value("${kobiskey}")
	public void setKey(String value) {
		kobiskey = value;
	}

	@Autowired
	private PersonMapper mapper;
	
	//인물 입력
	@Override
	public void insertPersonInfo(String keyword) throws OpenAPIFault, Exception {
		RequestDTO rdto = new RequestDTO();
		rdto.setKobiskey(kobiskey);
		rdto.setPeopleNm(keyword);
		KobisAPI kobisAPI=new KobisAPIImple();
		List<PersonInfoDTO> list = kobisAPI.addPersonInfo(rdto);
		mapper.insertPersonInfo(list);
		mapper.insertPersonDistinct(list);

		
	}

	//인물 정보 출력
	@Override
	public PersonInfoDTO getPersonInfo(String peopleCd) {
		PersonInfoDTO dto = mapper.getPersonInfo(peopleCd);
		
		if(dto != null) {
			if(dto.getPerson_pic().equals("")) {
				dto.setPerson_pic("/resources/img/person_noimg.png");
			}
			
		}
		return dto;
	}

	//인물 필모 영화코드 출력
	@Override
	public String[] getPersonFilmo(String peopleCd) {
		
		return mapper.getPersonFilmo(peopleCd);
	}

	//영화 정보 출력
	@Override
	public KobisDTO getMovieFilmo(String movieCd) {
		KobisDTO dto = mapper.getMovieFilmo(movieCd);
		if(dto.getPoster().equals("")) {
			dto.setPoster("/resources/img/poster_noimg.png");
		}
		return dto;
	}

	//연관인물 출력
	@Override
	public String[] getRealatedPerson(Map<String, String> hm) {
		
		return mapper.getRelatedPerson(hm);
	}

	//인물 필모 출력
	@Override
	public List<KobisDTO> getFilmoList(String peopleCd, int startRow, int pageSize) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("peopleCd", peopleCd);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		
		return mapper.getFilmoList(hm);
	}

	//인물 필모 수 출력
	@Override
	public int getFilmoNum(String peopleCd) {
		
		return mapper.getFilmoNum(peopleCd);
	}



}




