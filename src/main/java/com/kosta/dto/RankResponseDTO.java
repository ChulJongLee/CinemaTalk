package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter  @Setter
public class RankResponseDTO {
	private String boxofficeType;
	private String showRange;
    private List<RankDTO> dailyBoxOfficeList;
    
}