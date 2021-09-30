package com.kosta.cinematalk;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.dto.ReviewDTO;
import com.kosta.service.CommunityService;
import com.kosta.service.CommunityServiceImple;

@Controller
public class CommunityController {

	@Resource(name = "reviewservice")
	private CommunityService service;
	
	
	
	
	
	// 영화 정보 메인 페이지                   
	@RequestMapping("/movieinfomain")
	public String movieInfoMain() {
		
		
		return "movieinfomain";
	}	
	
	
	// 리뷰 메인 페이지
	@RequestMapping("/reviewmain")
	public String reviewMain(Model model) {
		
		// 베스트 리뷰 2개
		List<ReviewDTO> bestreviewlist = service.reviewList();
		model.addAttribute("bestreviewlist", bestreviewlist);
		
		// 일반 리뷰 4개
		List<ReviewDTO> generalreviewlist = service.generalReviewList();
		model.addAttribute("generalreviewlist", generalreviewlist);
		
		return "reviewmain";
	}
	
	// 리뷰 전체 리스트
	@RequestMapping("/reviewall")
	public String reviewAll(Model model) {
		
		List<ReviewDTO> allreview = service.allReview();
		model.addAttribute("allreview", allreview);
		
		return "reviewall";
	}
	
	// 리뷰 디테일 페이지
	@RequestMapping("/reviewdetail")
	public String reviewDetail(Model model) {
		
		return "reviewdetail";
	}
	
	

	
	// 참여 게시판 페이지
	@RequestMapping("/bestscenemain")
	public String bestSceneMain(Model model) {				
		
		return "bestscenemain";
	}
	// 최고장면,최악장면 리스트
	@RequestMapping("/bestscenelist")
	public String bestSceneList() {
		
		
		return "bestscenelist";
	}
	// 최고장면,최악장면 디테일
	@RequestMapping("/bestscenedetail")
	public String bestSceneDetail() {
		
		return "bestscenedetail";
	}
	
	// 명대사 리스트
	@RequestMapping("/famouslinelist")
	public String famousLineList() {
		
		return "famouslinelist";
	}
	// 명대사 디테일
	@RequestMapping("/famouslinedetail")
	public String famouslinedetail() {
		
		
		return "famouslinedetail";
	}
	
	
	
	
	// 자유 게시판 리스트 페이지
	@RequestMapping("/userforumlist")
	public String userForumList(Model model) {
		
		
		return "userforumlist";
	}
	// 자유 게시판 디테일 페이지
	@RequestMapping("/userforumdetail")
	public String userForumDetail(Model model) {
		
		
		return "userforumdetail";
	}
	
	
	
	
}