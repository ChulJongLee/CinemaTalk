package com.kosta.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class KobisDTO {
	//영화 목록
	//영화코드
	private String movieCd;
	//대표 제작국가명
	private String repNationNm;
	//대표 장르명
	private String repGenreNm;
		
	//영화 순위
	//해당일자의 박스오피스 순위
    public String rank;
    //누적관객수
    public String audiAcc;
    //해당일의 관객수
    public String audiCnt;
    
	//영화디테일
    //영화명(국문)
  	private String movieNm;
  	//영화명(영문)
  	private String movieNmEn;
  	//제작연도
  	private String prdtYear;
  	//개봉일
  	private String openDt;
  	//영화유형
  	private String typeNm;
  	//영화명(원문)
    private String movieNmOg;
    //상영시간
    private String showTm;
    //제작국가(리스트)
  	private List<KobisDTO2> nations;
    //제작국가 이름
//  	private String repNationNm;
  	//장르(리스트)
  	private List<KobisDTO2> genres;
	//장르명
//  	private String repGenreNm;
    //영화감독(리스트)
  	private List<KobisDTO2> directors;
 	//배우(리스트)
 	private List<KobisDTO2> actors;
 	//영화감독명(국문), 배우명(국문)
// 	private String peopleNm;
 	//영화감독명(영문), 배우명(영문)
// 	private String peopleNmEn;
 	//심의정보(리스트)
 	private List<KobisDTO2> audits;
 	//심의번호
// 	private String auditNo;
 	//관람등급 명칭
// 	private String watchGradeNm;
    
    
    //영화인

}
