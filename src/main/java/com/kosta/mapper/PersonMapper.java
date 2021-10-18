package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;

@Mapper
public interface PersonMapper {

	public void insertPersonInfo(List<PersonInfoDTO> list);

	public void insertPersonDistinct(List<PersonInfoDTO> list);

	public PersonInfoDTO getPersonInfo(String peopleCd);

	public String[] getPersonFilmo(String peopleCd);

	public KobisDTO getMovieFilmo(String movieCd);

	public String[] getRelatedPerson(Map<String, String> hm);

	public List<KobisDTO> getFilmoList(HashMap<String, Object> hm);

	public int getFilmoNum(String peopleCd);

}
