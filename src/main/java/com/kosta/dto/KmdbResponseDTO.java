package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KmdbResponseDTO {
	private String Query;
	private String KMAQuery;
	private int TotalCount;
	private List<KmdbDTO> Data;
	

}
