package com.kosta.cinematalk;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KobisDTO;
import com.kosta.service.MovieService;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MovieController {
	private final MovieService movieService;
	
	@GetMapping("/searchmovie")
	public String goMovieSearch() {
		return "/view.jsp?page=movie/kobismovie";
	}

	@PostMapping("/kobismovieresult")
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception {
		List<KobisDTO> list = movieService.getMovieList(keyword);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		
		return "/view.jsp?page=movie/kobismovieresult";
	}

	@GetMapping("/kobisrank")
	public String RankSearchResult(Model model) throws OpenAPIFault, Exception {
		List<KobisDTO> list = movieService.getMovieRank();
		List<KobisDTO> result=new ArrayList<KobisDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getRank();
			KobisDTO detail = movieService.getMovieDetail(list.get(i).getMovieCd());
			result.add(detail);
		}
		
		model.addAttribute("list", result);
		
		return "/view.jsp?page=movie/kobisrank";
	}

	@GetMapping("/moviedetail/{movieCd}")
	public String MovieDetail(@PathVariable String movieCd, Model model) throws OpenAPIFault, Exception {
		KobisDTO detail = movieService.getMovieDetail(movieCd);
		model.addAttribute("detail", detail);

		return "/view.jsp?page=movie/moviedetail";
	}

}
