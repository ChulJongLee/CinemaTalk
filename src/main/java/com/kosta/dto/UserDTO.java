package com.kosta.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {
	
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String user_email;
	private String user_nickname;
	private String user_bdate;
	private int user_grade_no;
	private int user_point;
	
	

}
