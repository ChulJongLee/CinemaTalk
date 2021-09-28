package com.kosta.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KobisDTO {
	//영화 목록
	private String movieCd;		//영화코드
	private String repNationNm;		//대표 제작국가명
	private String repGenreNm;		//대표 장르명
	private String poster;
	//영화 순위
    public String rank;		//해당일자의 박스오피스 순위
    public String audiAcc;		 //누적관객수
    public String audiCnt;	//해당일의 관객수	
    
	//영화디테일
    private String movieNm;		//영화명(국문)	
  	private String movieNmEn;		//영화명(영문)
  	private String prdtYear;		//제작연도	
  	private String openDt;		//개봉일
  	private String typeNm;		//영화유형
    private String movieNmOg;		//영화명(원문)
    private String showTm; 		//상영시간
  	private List<KobisDTO2> nations;		//제작국가(리스트)
  	private List<KobisDTO2> genres;		//장르(리스트)
  	private List<KobisDTO2> directors;		//영화감독(리스트)
 	private List<KobisDTO2> actors;			//배우(리스트)
 	private List<KobisDTO2> audits;		//심의정보(리스트)
 	private String plotText;
    private String[] keywordlist;
    private String watchGradeNm;
    
    //영화인
 	
 	@Getter
 	@Setter
 	public class KobisDTO2 {
 		private String nationNm;		  //제작국가 이름
 	  	private String genreNm;		//장르명
 	 	private String peopleNm;			//영화감독명(국문), 배우명(국문)
 	 	private String peopleNmEn;		//영화감독명(영문), 배우명(영문)
 	 	private String watchGradeNm;		//관람등급 명칭
 	    
 	    
 	    //영화인

 	}

}
