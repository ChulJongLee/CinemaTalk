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

	
	
	
}