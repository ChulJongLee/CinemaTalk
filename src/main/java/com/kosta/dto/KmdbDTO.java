package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KmdbDTO {
	private String CollName;
	private String TotalCount;
	private String Count;
	private List<KmdbDTO2> Result;
	
	@Setter
	@Getter
	public class KmdbDTO2 {

		private String title;
		private String titleEng;
		private plots plots;		//줄거리
		private String runtime;		//상영시간
		private String keywords;	
//		private String CodeNo;		//영화코드
		private String posters;	//포스터	|이거 써있어서 수정해야함
		
		@Setter
		@Getter
		public class plots{
			private List<plot> plot;
			
			@Setter
			@Getter
			public class plot{
				private String plotLang;
				private String plotText;
			}
		}
	}
}

