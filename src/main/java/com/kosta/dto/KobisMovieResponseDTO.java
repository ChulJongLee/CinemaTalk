package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter  @Setter
public class KobisMovieResponseDTO {
	private String totCnt;
	private String source;
	private List<KobisMovieDTO> movieList;

}
