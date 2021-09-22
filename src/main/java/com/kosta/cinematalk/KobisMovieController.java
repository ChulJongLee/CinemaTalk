package com.kosta.cinematalk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KobisDTO;
import com.kosta.service.KobisMovieAPI;
import com.kosta.service.MovieApiClient;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class KobisMovieController {
	private final KobisMovieAPI kobisMovieAPI;
	private final MovieApiClient movieApiClient;

	@GetMapping("/kobismovie")
	public String goMovieSearch(){
		return "kobismovie";
	}
	
	@PostMapping("/kobismovieresult")					
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception{
//		String[] movieCdList= {"20183782"};
		String movieCdList= "20183782";

		
		model.addAttribute("list", kobisMovieAPI.requestMovieCode(keyword).getMovieList());
		KobisDTO detail=kobisMovieAPI.requestMovieDetail(movieCdList).getMovieInfo();
		
		model.addAttribute("detail", detail);
		System.out.println(movieApiClient.requestMovie(detail.getMovieNm(), detail.getPrdtYear(), detail.getGenres().get(0).getGenreNm()).getItems());
		model.addAttribute("dto", movieApiClient.requestMovie(detail.getMovieNm(), detail.getPrdtYear(), detail.getGenres().get(0).getGenreNm()).getItems());

		
//		String actor=kobisMovieApi.requestMovie(keyword).getItems().get(0).getActor();
//		String[] actorlist=actor.replace("|", ",").split(",");
//		model.addAttribute("list", actorlist);
		return "kobismovieresult";
	}
}
