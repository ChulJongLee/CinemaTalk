package com.kosta.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RequestDTO {
	private String keyword;
	private String curPage="1";
	private String itemPerPage="100";
	private String movieNm="";
	private String directorNm="";
	private String openStartDt="";
	private String openEndDt="";
	private String prdtStartYear="";
	private String prdtEndYear="";
	private String repNationCd="";
	private String[] movieTypeCdArr=new String[0];
	private String kobiskey;
	private String kmdbkey;
	private String movieCd;
	
	private String peopleNm;
}
