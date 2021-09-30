package com.kosta.cinematalk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.service.PersonSearchAPI;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PersonSearchController {
	
	private final PersonSearchAPI personSearchAPI;
	
	@GetMapping("/personsrc")
	public String srcPerson() {
		return "personsearch";
	}
	
	@GetMapping("/personsrcresult")
	public String srcPersonResult() throws OpenAPIFault, Exception {

		personSearchAPI.personDetail();
		
		return "personsearchresult";
	}
}
