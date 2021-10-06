package com.kosta.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;

@Mapper
public interface PersonMapper {

	public void insertPersonInfo(List<PersonInfoDTO> list);

	public void insertPersonDistinct(List<PersonInfoDTO> list);





}
