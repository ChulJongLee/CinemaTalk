package com.kosta.dto;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter @Getter
@ToString
public class UserforumDTO {
	private String movieCd;
	private int content_no;
	private int user_no;
	private String user_id;
	private String content_title;
	private Date content_date;
	private String content_content;
	private int content_like;
	private int content_dislike;
	private int imageNum;
	private String imageName;
	private String imagePath;

}
