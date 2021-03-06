package com.kosta.dto;

import java.util.List;

import com.google.gson.JsonObject;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PersonResponseDTO {
	//영화인 목록
	private String totCnt;
	private List<PersonInfoDTO> peopleList;

	//영화인검색
	private JsonObject peopleInfo;
	
}


