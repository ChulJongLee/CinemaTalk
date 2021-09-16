package com.kosta.cinematalk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kosta.service.RankAPIClient;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RankSearchController {
	private final RankAPIClient rankApiClient;

	@GetMapping("/searchrank")
	public String goRankSearch(){
		return "searchrank";
	}

	@PostMapping("/searchrankresult")               
	public String RankSearchResult(Model model) throws OpenAPIFault, Exception{

		model.addAttribute("list", rankApiClient.requestRank().getDailyBoxOfficeList());
		return "searchrankresult";
	}
}