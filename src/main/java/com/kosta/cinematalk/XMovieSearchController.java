//package com.kosta.cinematalk;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.kosta.service.MovieApiClient;
//
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequiredArgsConstructor
//public class XMovieSearchController {
//	private final MovieApiClient movieApiClient;

//	@GetMapping("/searchmovie")
//	public String goMovieSearch(){
//		return "searchmovie";
//	}
//	
//	@PostMapping("/searchresult")					
//	public String MovieSearchResult(@RequestParam String keyword, Model model){
//		
//		
//		model.addAttribute("dto", movieApiClient.requestMovie(keyword).getItems());
//		
//		String actor=movieApiClient.requestMovie(keyword).getItems().get(0).getActor();
//		String[] actorlist=actor.replace("|", ",").split(",");
//		model.addAttribute("list", actorlist);
//		return "searchmovieresult";
//	}
//}
