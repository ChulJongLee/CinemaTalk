package com.kosta.cinematalk;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KmdbDTO.KmdbDTO2;
import com.kosta.dto.KobisDTO;
import com.kosta.service.KmdbAPI;
import com.kosta.service.KobisMovieAPI;
import com.kosta.service.RankAPIClient;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class KobisMovieController {
	private final KobisMovieAPI kobisMovieAPI;
	private final KmdbAPI kmdbAPI;
	private final RankAPIClient rankApiClient;

	@GetMapping("/kobismovie")
	public String goMovieSearch() {
		return "kobismovie";
	}

	@PostMapping("/kobismovieresult")
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception {

		List<KobisDTO> list = kobisMovieAPI.requestMovieList(keyword).getMovieList();

		for (Iterator<KobisDTO> it = list.iterator(); it.hasNext();) {
			KobisDTO str = it.next();
			if (str.getMovieNmEn().equals("Package Screening"))
				it.remove();
			if (str.getOpenDt().equals(""))
				it.remove();
			
		}
		
		for (int i = 0; i < list.size(); i++) {
			String director="";
			KobisDTO detail = kobisMovieAPI.requestMovieDetail(list.get(i).getMovieCd()).getMovieInfo();
			if(detail.getDirectors().size()!=0)
				director=detail.getDirectors().get(0).getPeopleNm();
			if(kmdbAPI.requestMoviePoster(detail.getMovieNm(), director)!=null)
				list.get(i).setPoster(kmdbAPI.requestMoviePoster(detail.getMovieNm(), director));
			list.get(i).setShowTm(detail.getShowTm());
			list.get(i).setActors(detail.getActors());
		}

		model.addAttribute("list", list);
		return "kobismovieresult";
	}

	@GetMapping("/kobisrank")
	public String RankSearchResult(Model model) throws OpenAPIFault, Exception {

		model.addAttribute("list", rankApiClient.requestRank().getDailyBoxOfficeList());
		return "kobisrank";
	}

	@GetMapping("/moviedetail/{movieCd}")
	public String MovieDetail(@PathVariable String movieCd, Model model) throws OpenAPIFault, Exception {

		KobisDTO detail = kobisMovieAPI.requestMovieDetail(movieCd).getMovieInfo();

		System.out.println(detail);
		model.addAttribute("detail", detail);

		
		String movieNm = detail.getMovieNm();
		String director="";
		if(detail.getDirectors().size()!=0)
			director = detail.getDirectors().get(0).getPeopleNm();
		String story="";
		String poster="";
		if(kmdbAPI.requestMovieDetail("", movieNm, "", director)!=null) {
			// 줄거리 받아오기
			List<KmdbDTO2> kmdblist = kmdbAPI.requestMovieDetail("", movieNm, "", director).getData().get(0).getResult();
			story = kmdblist.get(0).getPlots().getPlot().get(0).getPlotText();
			
			
			// 포스터 받아오기
			poster = kmdbAPI.requestMoviePoster(movieNm, director);
			
		}
		model.addAttribute("story", story);
		model.addAttribute("poster", poster);
		

		return "moviedetail";
	}
}
