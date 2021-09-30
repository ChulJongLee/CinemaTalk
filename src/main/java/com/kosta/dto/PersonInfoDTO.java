package com.kosta.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class PersonInfoDTO {
	private String peopleCd;
	private String peopleNm;
	private String peopleNmEn;
	private String repRoleNm;
	
	private String person_bdate;
	private String country_no;
	private String person_pic;
}