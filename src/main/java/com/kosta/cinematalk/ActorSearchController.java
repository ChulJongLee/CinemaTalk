package com.kosta.cinematalk;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.service.ActorApiClient;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ActorSearchController {
	private final ActorApiClient actorApiClient;

	@GetMapping("/searchactor")
	public String goActorSearch(){
		return "searchactor";
	}
	
	@PostMapping("/searchactorresult")					
	public String ActorSearchResult(@RequestParam String keyword, Model model){
		
		model.addAttribute("list", actorApiClient.requestActor(keyword));
		return "searchactorresult";
	}
}
