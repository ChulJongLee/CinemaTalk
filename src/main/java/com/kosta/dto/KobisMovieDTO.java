package com.kosta.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class KobisMovieDTO {
	//영화코드
	private String movieCd;
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
	//제작국가
	private String repNationNm;
	//장르
	private String repGenreNm;
	//영화감독
//	private String directors;
	//제작사
//	private String companys;

}
