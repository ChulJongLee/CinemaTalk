package com.kosta.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class KobisDTO2 {
	
   
    //제작국가 이름
  	private String nationNm;
  	
	//장르명
  	private String genreNm;
 	//영화감독명(국문), 배우명(국문)
 	private String peopleNm;
 	//영화감독명(영문), 배우명(영문)
 	private String peopleNmEn;
 	
 	//관람등급 명칭
 	private String watchGradeNm;
    
    
    //영화인

}
