package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter  @Setter
public class KobisResponseDTO {
	//영화목록
	private String totCnt;
	private String source;
	private List<KobisDTO> movieList;
	
	//영화순위
	private String boxofficeType;
	private String showRange;
    private List<KobisDTO> dailyBoxOfficeList;
    
    //영화디테일
    private KobisDTO movieInfo;
    
    //영화인
}
