package com.kosta.cinematalk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
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

	@GetMapping("/cinematalk")
	public String RankSearchResult(Model model) throws OpenAPIFault, Exception {
		List<KobisDTO> dailyList = movieService.getMovieRank();
		model.addAttribute("dailyList", dailyList);
		
		List<KobisDTO> rateList = movieService.getMovieRate();
		model.addAttribute("rateList", rateList);
		
		List<KobisDTO> openList = movieService.getMovieOpen();
		model.addAttribute("openList", openList);
		
		List<KobisDTO> randomList=movieService.getRandomList();
		model.addAttribute("randomList", randomList);
		
		return "/view.jsp?page=movie/main";
	}

	@GetMapping("/moviedetail/{movieCd}")
	public String MovieDetail(@PathVariable String movieCd, Model model) throws OpenAPIFault, Exception {
		KobisDTO detail = movieService.getMovieDetail(movieCd);
		model.addAttribute("detail", detail);
		List<PersonInfoDTO> personInfo=movieService.getPersonInfo(movieCd);
		model.addAttribute("personInfo", personInfo);
		
		return "/view.jsp?page=movie/moviedetail";
	}
	
	@GetMapping("/test")
	public String Test() {
		
		return "/view.jsp?page=movie/test";
	}
	
//	Ajax
	@PostMapping("/movieRate")
    @ResponseBody
    public Map<String, Object> testAjax(RateDTO movieRateData){
        
        Map<String, Object> result = new HashMap<String, Object>();
        movieService.movieRate(movieRateData);
        
        
//        System.out.println(movieRateData.getMovieCd());
//        System.out.println(movieRateData.getRate());
//      System.out.println(testVo.getUser_no());

        // 응답 데이터 셋팅
        result.put("result", "평점 주기 완료");
        
        return result;
        
    }


}
