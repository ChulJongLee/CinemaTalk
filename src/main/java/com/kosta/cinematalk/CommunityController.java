package com.kosta.cinematalk;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.dto.PageBlock;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.service.CommunityService;
import com.kosta.service.MovieService;

@Controller
//@RequiredArgsConstructor
public class CommunityController {

	
	@Resource(name = "reviewservice")
	private CommunityService service;
	@Resource
	private MovieService movieService;
	

	
	// 영화 정보 메인 페이지                   
	@RequestMapping("/movieinfomain")
	public String movieInfoMain() {
		
		return "/view.jsp?page=board/movieinfomain";
	}	
	
	
	
	// 리뷰 메인 페이지
//	@RequestMapping("/moviedetail/{movieCd}/reviewmain")
	@RequestMapping("/reviewmain")
	public String reviewMain(Model model) {
		
		// 베스트 리뷰 2개
		List<ReviewDTO> bestreviewlist = service.reviewList();
		model.addAttribute("bestreviewlist", bestreviewlist);
		// 일반 리뷰 4개
		List<ReviewDTO> generalreviewlist = service.generalReviewList();
		model.addAttribute("generalreviewlist", generalreviewlist);
		
		return "/view.jsp?page=board/reviewmain";
	}
	
	
	
	// 리뷰 쓰기
	@RequestMapping("/moviedetail/{movieCd}/reviewinsertresult")
	public String insertResult(@RequestParam HashMap<String, Object> hm) {
		
		service.reviewinsert(hm);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+hm);
				
		return "redirect:/moviedetail/{movieCd}";
	}
	
	
	
	// 리뷰 전체 리스트
	@RequestMapping("/moviedetail/{movieCd}/reviewall")
//	@RequestMapping("/reviewall")
	public String reviewAll(@PathVariable String movieCd
							, @RequestParam(required = false, defaultValue = "1") int currPage
							, @RequestParam(required = false, defaultValue = "1") int boardno
							, Model model) {
		
		int totalcount = service.totalCount2(boardno); // 전체 자료수
		int pagesize=10;
		int blocksize=5;
		
		PageBlock page = new PageBlock(currPage, totalcount, pagesize, blocksize);
		
		List<ReviewDTO> allreview = service.allReview(page.getStartRow(), page.getEndRow());
		
		model.addAttribute("movieCd", movieCd);
		model.addAttribute("allreview", allreview);
		model.addAttribute("page", page);
		
		return "/view.jsp?page=board/reviewall";		
	}
	
	// 리뷰 삭제
//	@RequestMapping("/reviewdelete/{contentno}")
	@RequestMapping("/moviedetail/{movieCd}/reviewdelete/{contentno}")
	public String reviewdelete(@PathVariable String movieCd ,@PathVariable(name = "contentno") int no, Model model) {
		
		service.reviewdelete(no);
//		model.addAttribute("result", result);
		
		return "redirect:/moviedetail/{movieCd}";
	}
	
	
	
	// 리뷰 디테일 페이지
//	@RequestMapping(value = "/moviedetail/{movieCd}/reviewdetail/{contentno}", method = RequestMethod.GET)
//	@RequestMapping(value = "/reviewdetail", method = RequestMethod.GET)
//	public String reviewDetail(@PathVariable int contentno, Model model) {
//		
//		ReviewDTO dto = service.reviewdetail(contentno);
//		model.addAttribute("revdetail", dto);
//		
//		
//		return "/view.jsp?page=board/reviewdetail";		
//	}
	
	
	
	// 참여 게시판 메인 페이지
//	@RequestMapping("/moviedetail/{movieCd}/bestscenemain")
	@RequestMapping("/bestscenemain")
	public String bestSceneMain(Model model) {		
		
		// 명대사 4개
		List<ReviewDTO> famouslinelist = service.famousLineList();
		model.addAttribute("famouslinelist", famouslinelist);
		
		return "/view.jsp?page=board/bestscenemain";
	}
	
	// 최고장면,최악장면 리스트
	@RequestMapping("/bestscenelist")
	public String bestSceneList() {
		
		
		return "/view.jsp?page=board/bestscenelist";
	}
	
	// 최고장면,최악장면 디테일
//	@RequestMapping("/moviedetail/{movieCd}/bestscenedetail")
	@RequestMapping("/bestscenedetail")
	public String bestSceneDetail() {
		
		return "/view.jsp?page=board/bestscenedetail";
	}
	
	// 명대사 리스트
//	@RequestMapping("/moviedetail/{movieCd}/famouslinelist")
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
		System.out.println("!!!!!!!!!!!!!!!allfamousline"+allfamousline);
		
		
		model.addAttribute("page", page);
		model.addAttribute("allfamousline", allfamousline);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "/view.jsp?page=board/famouslinelist";
	}
	
	
	// 명대사 디테일
//	@RequestMapping("/moviedetail/{movieCd}/famouslinedetail")
	@RequestMapping("/famouslinedetail")
	public String famouslinedetail() {
		
		return "/view.jsp?page=board/famouslinedetail";
	}
	
	
	
	
	// 자유 게시판 리스트 페이지(메인)
//	@RequestMapping("/moviedetail/{movieCd}/userforumlist")
	@RequestMapping("/userforumlist")
	public String userForumList(@RequestParam(required = false, defaultValue = "1") int currPage
								, @RequestParam(required = false, defaultValue = "5") int boardno
								, Model model) {
		
		int totalcount = service.totalCount2(boardno);
		int pagesize=10;
		int blocksize=5;
		
		PageBlock page = new PageBlock(currPage, totalcount, pagesize, blocksize);
		
		List<ReviewDTO> alluserforum = service.allUserForum(page.getStartRow(), page.getEndRow());

		
		model.addAttribute("alluserforum", alluserforum);
		model.addAttribute("page", page);
						
		return "/view.jsp?page=board/userforumlist";
	}
	
	
	// 자유 게시판 디테일 페이지
//	@RequestMapping("/moviedetail/{movieCd}/userforumdetail")
	@RequestMapping("/userforumdetail/{contentno}")
	public String userForumDetail(@PathVariable int contentno, Model model) {
		
		ReviewDTO userforumdetail = service.userforumdetail(contentno);
//		System.out.println("@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!"+userforumdetail);	// 값받아짐.
		model.addAttribute("userforumdetail", userforumdetail);
		
		return "/view.jsp?page=board/userforumdetail";
	}
	
	
	// 자유게시판 글쓰기
	@RequestMapping("/userforuminsert")
	public String userforuminsert() {
		
		return "/view.jsp?page=board/userforuminsert";
	}
	
	
	// 자유게시판 글쓰기 result
	@RequestMapping("/userforuminsertresult")
	public String userforuminsertresult() {
				
		return "redirect:/userforumlist";
	}
	
		
	// 리뷰 좋아요
	@PostMapping("/like")
    @ResponseBody
    public Map<String, Object> likeAjax(ReviewDTO like){
        
        Map<String, Object> result = new HashMap<String, Object>();
        service.reviewLike(like.getContentno());
                
        System.out.println("숫자가 몇 나왔니?"+like.getContentno());

        // 응답 데이터 셋팅
        result.put("result", "좋아용~~~~~~~~~~~~~~~~~~~~");
        
        return result;       
    }
	
	
	// 리뷰 싫어요
	@PostMapping("/dislike")
    @ResponseBody
    public Map<String, Object> dislikeAjax(ReviewDTO dislike){
        
        Map<String, Object> result = new HashMap<String, Object>();
        service.reviewDisLike(dislike.getContentno());
        
        System.out.println("숫자가 몇 나왔니?"+dislike.getContentno());
        
        // 응답 데이터 셋팅
        result.put("result", "좋아용~~~~~~~~~~~~~~~~~~~~");
        
        return result;       
    }
	
	
	
}