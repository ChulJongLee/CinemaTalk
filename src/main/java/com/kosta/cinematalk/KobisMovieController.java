package com.kosta.cinematalk;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.KmdbDTO.KmdbDTO2;
import com.kosta.service.KmdbAPI;
import com.kosta.service.KobisMovieAPI;
import com.kosta.service.MovieApiClient;
import com.kosta.service.RankAPIClient;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class KobisMovieController {
	private final KobisMovieAPI kobisMovieAPI;
	private final KmdbAPI kmdbAPI;
	private final MovieApiClient movieApiClient;
	private final RankAPIClient rankApiClient;
	
	@GetMapping("/kobismovie")
	public String goMovieSearch(){
		return "kobismovie";
	}
	
	@PostMapping("/kobismovieresult")					
	public String MovieSearchResult(@RequestParam String keyword, Model model) throws OpenAPIFault, Exception{
		
		
		List<KobisDTO> list=kobisMovieAPI.requestMovieList(keyword).getMovieList();
		
	
		for(Iterator<KobisDTO> it=list.iterator(); it.hasNext();){
            KobisDTO str = it.next();
            if(str.getMovieNmEn().equals("Package Screening")) 
            	it.remove();
            if(str.getOpenDt().equals("")) 
            	it.remove();
        }
		
		String movieNm;
		String director;
		String posters;
		String[] posterlist;
		String poster;
		for(int i=0;i<list.size();i++) {
			KobisDTO detail = kobisMovieAPI.requestMovieDetail(list.get(i).getMovieCd()).getMovieInfo();
			movieNm=detail.getMovieNm();
			director=detail.getDirectors().get(0).getPeopleNm();
			posters=kmdbAPI.requestMovieDetail("", movieNm, "", director).getData().get(0).getResult().get(0).getPosters();
			posterlist=posters.replace("|", ",").split(",");
			poster=posterlist[0];
			list.get(i).setPoster(poster);
		}
		
		model.addAttribute("list", list);
		System.out.println(kobisMovieAPI.requestMovieList(keyword).getMovieList());
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
		
		System.out.println(detail);
		model.addAttribute("detail", detail);
		
		//줄거리 받아오기
		String movieNm=detail.getMovieNm();
		String director=detail.getDirectors().get(0).getPeopleNm();
		List<KmdbDTO2> kmdblist=kmdbAPI.requestMovieDetail("", movieNm, "", director).getData().get(0).getResult();
		String story=kmdblist.get(0).getPlots().getPlot().get(0).getPlotText();
		model.addAttribute("story", story);
		
		//포스터 받아오기
		String posters=kmdbAPI.requestMovieDetail("", movieNm, "", director).getData().get(0).getResult().get(0).getPosters();
		String[] posterlist=posters.replace("|", ",").split(",");
		model.addAttribute("poster", posterlist[0]);

		return "moviedetail";
	}
}
