package com.kosta.dto;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class ReportDTO {
	
	private int reportno;
	private int contentno;
	private int reply;
	private String reportreason;
	private int reportsize;
	private String content_content;
	private String movieCd;
}
