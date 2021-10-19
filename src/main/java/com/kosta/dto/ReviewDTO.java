package com.kosta.dto;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter @Getter
@ToString
public class ReviewDTO {
	
	private int contentno;
	private int userno;
	private String userid;
	private String title;
	private Date writedate;
	private String contents;
	private int like;
	private int dislike;
	private String movieCd;
	private int spoiler;

}
