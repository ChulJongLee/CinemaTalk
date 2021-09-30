package com.kosta.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class PersonInfoDTO {
	private String peopleCd;
	private String peopleNm;
	private String peopleNmEn;
	private String repRoleNm;
	
	private String person_bdate;
	private String nationality;
	private String person_pic;
	
	private List<KobisDTO> filmos;
}