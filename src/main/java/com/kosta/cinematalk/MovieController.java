package com.kosta.cinematalk;

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

	@GetMapping("/kobismovie")
	public String goMovieSearch() {
		return "kobismovie";
	}

	@PostMapping("/kobismovieresult")
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception {
		List<KobisDTO> list = movieService.requestMovieList(keyword);
		model.addAttribute("list", list);
		
		return "kobismovieresult";
	}

	@GetMapping("/kobisrank")
	public String RankSearchResult(Model model) throws OpenAPIFault, Exception {
		model.addAttribute("list", movieService.requestRank());
		
		return "kobisrank";
	}

	@GetMapping("/moviedetail/{movieCd}")
	public String MovieDetail(@PathVariable String movieCd, Model model) throws OpenAPIFault, Exception {
		KobisDTO detail = movieService.requestMovieDetail(movieCd);
		model.addAttribute("detail", detail);

		return "moviedetail";
	}

}
