package com.kosta.cinematalk;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.dto.PersonInfoDTO;
import com.kosta.service.PersonService;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PersonInfoController {
	
	private final PersonService personServiceAPI;
	
	@GetMapping("/personsrc")
	public String srcPerson() {
		return "personsearch";
	}
	
	@GetMapping("/personsrcresult")
	public String srcPersonResult() throws OpenAPIFault, Exception {

		String keyword = "";
		personServiceAPI.insertPersonInfo(keyword);

		return "personsearchresult";
	}
}
