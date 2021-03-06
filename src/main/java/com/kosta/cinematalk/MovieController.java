package com.kosta.cinematalk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PageBlock;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;
import com.kosta.dto.UserforumDTO;
import com.kosta.service.CommunityService;
import com.kosta.service.MovieService;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MovieController {
	private final MovieService movieService;
	private final CommunityService communityService;
	
	@GetMapping("/searchresult")
	public String MovieSearchResult(@RequestParam String keyword
			, @RequestParam(required = false, defaultValue = "1") int currPage
			, Model model) throws OpenAPIFault, Exception {
		int totalCount=movieService.getTotalCount(keyword);
		int pageSize = 10;
		int blockSize = 5;
		PageBlock page = new PageBlock(currPage, totalCount, pageSize, blockSize);
		List<KobisDTO> list = movieService.getMovieList(keyword, page.getStartRow() - 1, pageSize);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "/view.jsp?page=movie/searchresult";
	}

	
	@GetMapping("/genre/{genre}")
	public String MovieGenreResult(@PathVariable String genre
			, @RequestParam(required = false, defaultValue = "1") int currPage
			, Model model) throws OpenAPIFault, Exception {
		String keyword="";
		if(genre.equals("drama"))
			keyword="?????????";
		else if(genre.equals("comedy"))
			keyword="?????????";
		else if(genre.equals("horror"))
			keyword="??????(??????)";
		else if(genre.equals("romance"))
			keyword="??????";
		else if(genre.equals("thriller"))
			keyword="?????????";
		int totalCount=movieService.getGenreCount(keyword);
		int pageSize = 10;
		int blockSize = 5;
		PageBlock page = new PageBlock(currPage, totalCount, pageSize, blockSize);
		List<KobisDTO> list = movieService.getMovieGenreList(keyword, page.getStartRow() - 1, pageSize);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("genre", genre);
		return "/view.jsp?page=movie/searchgenre";
	}
	
	@GetMapping("/")
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

	@RequestMapping (value =  "/moviedetail/{movieCd}")
	public String MovieDetail(@PathVariable String movieCd, Model model, HttpSession session) throws OpenAPIFault, Exception {
		KobisDTO detail = movieService.getMovieDetail(movieCd);
		model.addAttribute("detail", detail);
		model.addAttribute("movieCd", movieCd);
		List<PersonInfoDTO> personInfo=movieService.getPersonInfo(movieCd);
		model.addAttribute("personInfo", personInfo);
		
		UserDTO user = (UserDTO) session.getAttribute("user");
		float rate=0;
		if(user!=null) {
			rate=movieService.getMovieRateOne(movieCd, user.getUser_no())*2;
		}
		model.addAttribute("rate", rate);
		
		
		// ????????? ?????? 2???
		List<ReviewDTO> bestreviewlist = communityService.reviewList(movieCd);
		model.addAttribute("bestreviewlist", bestreviewlist);		
		// ?????? ?????? 4???
		List<ReviewDTO> generalreviewlist = communityService.generalReviewList(movieCd);
		model.addAttribute("generalreviewlist", generalreviewlist);
		// ????????? ?????????
		List<UserforumDTO> bestUserforumList = communityService.getBestUserforms(movieCd);
		model.addAttribute("bestUserforumList", bestUserforumList);
		// ????????? ?????????
		List<UserforumDTO> worstUserforumList = communityService.getWorstUserforms(movieCd);
		model.addAttribute("worstUserforumList", worstUserforumList);
				
		return "/view.jsp?page=movie/moviedetail";
	}
	
//	?????? ?????? Ajax
	@PostMapping("/movieRate")
    @ResponseBody
    public Map<String, Object> movieRate(RateDTO movieRateData, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			UserDTO user = (UserDTO) session.getAttribute("user");
			movieRateData.setUser_no(user.getUser_no());
	        movieService.movieRate(movieRateData);
	        // ?????? ????????? ??????
	        result.put("result", "?????? ?????? ??????");
		}catch(NullPointerException e){
			result.put("result", "???????????? ????????? ??????????????????.");
		}
		
        
        return result;
		
    }
	//?????? Ajax
	@PostMapping("/movieAvgRate")
    @ResponseBody
    public float movieAvgRate(String movieCd){
		float rate=movieService.getMovieRateOne(movieCd);
		
        return rate;
		
    }


}
