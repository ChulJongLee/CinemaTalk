package com.kosta.dto;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter @Getter
@ToString
public class ReviewDTO {
	
	private int userno;
	private Date writedate;
	private String contents;
	private int like;
	private int dislike;

}
