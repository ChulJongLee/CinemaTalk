package com.kosta.cinematalk;


import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.PageBlock;
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
	public String reviewAll( @RequestParam(required = false, defaultValue = "1") int currPage
							, @RequestParam(required = false, defaultValue = "") String search
							, @RequestParam(required = false, defaultValue = "") String searchtxt
							, Model model) {
		Pattern p = Pattern.compile("([0-9]*$)");	// 012345111
		if(search=="userno" || search.equals("userno") || search=="like" || search.equals("like")) {
			
			Matcher m = p.matcher(searchtxt);
			if(m.find()) {
				model.addAttribute("searchtxt", searchtxt);
			}else {
				model.addAttribute("searchtxt", "");
			}
		}
		
		int totalcount = service.totalCount(search, searchtxt); // 전체 자료수
		int pagesize=10;
		int blocksize=5;
		

		PageBlock page = new PageBlock(currPage, totalcount, pagesize, blocksize);
		
//		List<ReviewDTO> review = service.review(search, searchtxt, page.getStartRow(), page.getEndRow());
		List<ReviewDTO> allreview = service.allReview(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		model.addAttribute("allreview", allreview);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		
		return "reviewall";
	}
	
	// 리뷰 디테일 페이지
	@RequestMapping("/reviewdetail")
	public String reviewDetail(Model model) {
		
		return "reviewdetail";
	}
	
	

	
	// 참여 게시판 메인 페이지
	@RequestMapping("/bestscenemain")
	public String bestSceneMain(Model model) {		
		
		// 명대사 4개
		List<ReviewDTO> famouslinelist = service.famousLineList();
		model.addAttribute("famouslinelist", famouslinelist);
		
		
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
	public String famousLineList(@RequestParam(required = false, defaultValue = "1") int currPage
								, @RequestParam(required = false, defaultValue = "") String search
								, @RequestParam(required = false, defaultValue = "") String searchtxt
								, Model model) {
		
		Pattern p = Pattern.compile("([0-9]*$)");	// 012345111
		if(search=="userno" || search.equals("userno") || search=="like" || search.equals("like")) {
			
			Matcher m = p.matcher(searchtxt);
			if(m.find()) {
				model.addAttribute("searchtxt", searchtxt);
			}else {
				model.addAttribute("searchtxt", "");
			}
		}

		int totalcount = service.totalCount(search, searchtxt); // 전체 자료수
		int pagesize=10;
		int blocksize=5;
		

		PageBlock page = new PageBlock(currPage, totalcount, pagesize, blocksize);

		List<ReviewDTO> allfamousline = service.allFamousLine(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		model.addAttribute("page", page);
		model.addAttribute("allfamousline", allfamousline);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		

		return "famouslinelist";
	}
	// 명대사 디테일
	@RequestMapping("/famouslinedetail")
	public String famouslinedetail() {
		
		
		return "famouslinedetail";
	}
	
	
	
	
	// 자유 게시판 리스트 페이지(메인)
	@RequestMapping("/userforumlist")
	public String userForumList(Model model) {
		
		List<ReviewDTO> alluserforum = service.allUserForum();
		model.addAttribute("alluserforum", alluserforum);
		
		
		
		return "userforumlist";
	}
	// 자유 게시판 디테일 페이지
	@RequestMapping("/userforumdetail")
	public String userForumDetail(Model model) {
		
		
		return "userforumdetail";
	}
	
	
	
	
}