package com.kosta.cinematalk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KobisDTO;
import com.kosta.service.KobisMovieAPI;
import com.kosta.service.MovieApiClient;
import com.kosta.service.RankAPIClient;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class KobisMovieController {
	private final KobisMovieAPI kobisMovieAPI;
	private final MovieApiClient movieApiClient;
	private final RankAPIClient rankApiClient;
	
	@GetMapping("/kobismovie")
	public String goMovieSearch(){
		return "kobismovie";
	}
	
	@PostMapping("/kobismovieresult")					
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception{

		model.addAttribute("list", kobisMovieAPI.requestMovieCode(keyword).getMovieList());
		
		return "kobismovieresult";
	}
	
	@GetMapping("/kobisrank")               
	public String RankSearchResult(Model model) throws OpenAPIFault, Exception{

		model.addAttribute("list", rankApiClient.requestRank().getDailyBoxOfficeList());
		return "kobisrank";
	}
	
	@GetMapping("/moviedetail/{movieCd}")
	public String MovieDetail(@PathVariable String movieCd, Model model) throws OpenAPIFault, Exception {
		
		KobisDTO detail = kobisMovieAPI.requestMovieDetail(movieCd).getMovieInfo();

		model.addAttribute("detail", detail);
		
		//포스터 받아오기
		model.addAttribute("dto", movieApiClient.requestMovie(detail.getMovieNm(), detail.getPrdtYear(), detail.getGenres().get(0).getGenreNm()).getItems());


		return "moviedetail";
	}
}
