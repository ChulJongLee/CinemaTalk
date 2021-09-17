package com.kosta.cinematalk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.service.KobisMovieApi;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class KobisMovieController {
	private final KobisMovieApi kobisMovieApi;

	@GetMapping("/kobismovie")
	public String goMovieSearch(){
		return "kobismovie";
	}
	
	@PostMapping("/kobismovieresult")					
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception{
		
		
		model.addAttribute("list", kobisMovieApi.requestMovie(keyword).getMovieList());
		
//		String actor=kobisMovieApi.requestMovie(keyword).getItems().get(0).getActor();
//		String[] actorlist=actor.replace("|", ",").split(",");
//		model.addAttribute("list", actorlist);
		return "kobismovieresult";
	}
}
