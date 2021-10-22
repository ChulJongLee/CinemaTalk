package com.kosta.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@ToString
public class LikeDTO {
	
	private int content_no;
	private int user_no;
	private int likecheck;
	private int hatecheck;

}
