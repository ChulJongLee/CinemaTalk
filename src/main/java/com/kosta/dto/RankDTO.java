package com.kosta.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class RankDTO {

		//박스오피스 종류
//        public String boxofficeType;
        //해당일자의 박스오피스 순위
        public String rank;
        //영화의 개봉일
        public String openDt;
        //누적관객수
        public String audiAcc;
        //해당일의 관객수
        public String audiCnt;
        //영화명(국문)
        public String movieNm;
       

}
