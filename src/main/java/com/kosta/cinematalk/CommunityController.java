package com.kosta.cinematalk;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PageBlock;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.ReportDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;
import com.kosta.dto.UserforumDTO;
import com.kosta.service.CommunityService;
import com.kosta.service.ImageService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommunityController {
	private final CommunityService service;
	private final ImageService imageService;

	
	// 영화 정보 메인 페이지                   
	@RequestMapping("/movieinfomain")
	public String movieInfoMain() {
		
		return "/view.jsp?page=board/movieinfomain";
	}	
	
	
	// 리뷰 쓰기
	@RequestMapping("/moviedetail/{movieCd}/reviewinsertresult")
	public String insertResult(@RequestParam HashMap<String, Object> hm) {
		
		service.reviewinsert(hm);
			
		return "redirect:/moviedetail/{movieCd}";
	}
	
	// 리뷰 수정
	@RequestMapping("/moviedetail/{movieCd}/reviewmodify")
	public String reviewmodify(@RequestParam HashMap<String, Object> hm) {		
		
		service.reviewmodify(hm);	
		
		return "redirect:/moviedetail/{movieCd}";
	}
	
	// 마이페이지 리뷰 수정
	@RequestMapping("/mypage/reviewmodify/{movieCd}")
	public String mypagereviewmodify(@RequestParam HashMap<String, Object> hm) {
		
		service.reviewmodify(hm);
		
		return "redirect:/mypage/myreview";
	}
	
	
	// 리뷰 신고
	@RequestMapping("/moviedetail/{movieCd}/reviewreport")
	public String reviewreport(@PathVariable String movieCd, @RequestParam HashMap<String, Object> hm) {

		List<ReportDTO> reportlist = service.reportsearch(hm);
		
		if(reportlist.isEmpty()) {
			service.reviewreport(hm);
		}else{
			service.reviewreportupdate(hm);		
		}	
		return "redirect:/moviedetail/{movieCd}";
	}
	
	// 마이페지리뷰 신고
	@RequestMapping("/mypage/reviewreport/{movieCd}")
	public String mypagereviewreport(@PathVariable String movieCd, @RequestParam HashMap<String, Object> hm) {

		List<ReportDTO> reportlist = service.reportsearch(hm);
		
		if(reportlist.isEmpty()) {
			service.reviewreport(hm);
		}else{
			service.reviewreportupdate(hm);		
		}	
		return "redirect:/mypage/myreview";
	}
	
	// 리뷰 전체 리스트
	@RequestMapping("/moviedetail/{movieCd}/reviewall")
	public String reviewAll(@PathVariable String movieCd
							, @RequestParam(required = false, defaultValue = "1") int currPage
							, @RequestParam(required = false, defaultValue = "1") int boardno
							, Model model) {
		
		int totalcount = service.totalCount2(movieCd, boardno); // 전체 자료수
		int pagesize=10;
		int blocksize=5;
		
		PageBlock page = new PageBlock(currPage, totalcount, pagesize, blocksize);
		
		List<ReviewDTO> allreview = service.allReview(movieCd, page.getStartRow() - 1, pagesize);
		
		model.addAttribute("movieCd", movieCd);
		model.addAttribute("allreview", allreview);
		model.addAttribute("page", page);
		
		return "/view.jsp?page=board/reviewall";		
	}
	
	// 리뷰 삭제
	@RequestMapping("/moviedetail/{movieCd}/reviewdelete/{contentno}")
	public String reviewdelete(@PathVariable String movieCd 
								,@PathVariable(name = "contentno") int no, Model model) {
		
		service.reviewdelete(no);
		
		return "redirect:/moviedetail/{movieCd}";
	}


	// 마이페이지 리뷰 삭제
	@RequestMapping("/mypage/reviewdelete/{contentno}")
	public String mypagereviewdelete(@PathVariable(name = "contentno") int no, Model model) {
		
		service.reviewdelete(no);
		
		return "redirect:/mypage/myreview";
	}
	
	
	// 자유 게시판 리스트 페이지(메인)
	@RequestMapping("/moviedetail/{movieCd}/userforumlist")
	public String userForumList(@PathVariable String movieCd
								, @RequestParam(required = false, defaultValue = "1") int currPage
								, @RequestParam(required = false, defaultValue = "5") int boardno
								, @RequestParam(required = false, defaultValue = "") String search
								, @RequestParam(required = false, defaultValue = "") String searchtxt
								, Model model) {
		Pattern p=Pattern.compile("(^[0-9]*$)");	//0~9으로 이루어진 값을 사용 가능, ^는 시작, $는 끝이라는 뜻, option에서 id를 선택했을때 숫자만 받아야하므로
		if(search=="employee_id"||search.equals("employee_id")
				||search=="department_id"||search.equals("department_id")) {
			Matcher m=p.matcher(searchtxt);
			if(m.find()) {	//위의 패턴을 만족하면 true값이 나옴
				
			}else {
				searchtxt="";
			}
		}
		int totalcount = service.getTotalCount(movieCd, boardno, search, searchtxt);
		int pageSize=10;
		int blockSize=5;
		
		PageBlock page = new PageBlock(currPage, totalcount, pageSize, blockSize);
		
		
		List<UserforumDTO> userforumList = service.userforumList(movieCd, boardno, search, searchtxt, page.getStartRow() - 1, pageSize);
		model.addAttribute("userforumList", userforumList);
		model.addAttribute("movieCd", movieCd);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
						
		return "/view.jsp?page=board/userforumlist";
	}
	
	
	// 자유 게시판 디테일 페이지
	@RequestMapping("/moviedetail/{movieCd}/userforumdetail/{contentno}")
	public String userForumDetail(@PathVariable String movieCd, @PathVariable int contentno, Model model) {
		
		UserforumDTO userforumdetail = service.userforumdetail(contentno);
		model.addAttribute("movieCd", movieCd);
		model.addAttribute("userforumdetail", userforumdetail);
		
		return "/view.jsp?page=board/userforumdetail";
	}
	
	
	// 자유게시판 글쓰기
		@RequestMapping("/moviedetail/{movieCd}/userforuminsert")
		public String userforuminsert() {
			
			return "/view.jsp?page=board/userforuminsert";
		}
	
	
	// 자유게시판 글쓰기 result
	@RequestMapping("/moviedetail/{movieCd}/userforuminsertresult")
	public String userforuminsertresult(@PathVariable String movieCd
			, Model model
			, HttpSession session
			, HttpServletRequest request, HttpServletResponse response) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		if(user==null){
			return "/view.jsp?page=user/userlogin";
		}
		else {

			String imagePath = "";
			String imageName = "";
			@SuppressWarnings("deprecation")
			String uploadPath = request.getRealPath("/resources/upload");
			UserforumDTO dto = new UserforumDTO();
			try {
				MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
						request, uploadPath, // 파일을 저장할 디렉토리 지정
						10 * 1024 * 1024, // 첨부파일 최대 용량 설정(bite)
						"utf-8", // 인코딩 방식 지정
						new DefaultFileRenamePolicy()); // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
	
				imagePath = multi.getFilesystemName("file1"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
				imageName = multi.getOriginalFileName("file1"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
			
				String content_title = multi.getParameter("content_title");
				String content_content = multi.getParameter("content_content");
				dto.setUser_no(user.getUser_no());
				dto.setUser_id(user.getUser_id());
				dto.setMovieCd(movieCd);
				dto.setContent_title(content_title);
				dto.setContent_content(content_content);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			service.userforumInsert(dto);
			dto.setImageName("");
			if(imageName!=null && !imageName.equals("")) { //사진 넣었을 경우
				dto.setImageName(imageName);
				dto.setImagePath(imagePath);
				imageService.insertImg(dto);
			}
			model.addAttribute("userforumdetail", dto);
		
		return "/view.jsp?page=board/userforumdetail";
		}
	}
	
	//자유게시판 삭제
	@RequestMapping("/moviedetail/{movieCd}/userforumdelete/{contentno}")
	public String userforumDelete(@PathVariable String movieCd ,@PathVariable(name = "contentno") int no, Model model) {
		service.reviewdelete(no);
//		model.addAttribute("result", result);
		
		return "redirect:/moviedetail/{movieCd}";
	}
	
	//자유게시판 수정
	@RequestMapping("/moviedetail/{movieCd}/userforummodify/{contentno}")
	public String userforumModify(@PathVariable String movieCd ,@PathVariable int contentno, Model model
			, HttpSession session) {
		String result="";
		try {
			UserDTO user = (UserDTO) session.getAttribute("user");
			int user_no=user.getUser_no();
			
			UserforumDTO userforumdetail = service.userforumdetail(contentno);
			if(user_no==userforumdetail.getUser_no()) {
				model.addAttribute("movieCd", movieCd);
				model.addAttribute("userforumdetail", userforumdetail);
				result="/view.jsp?page=board/userforumModify";
			}else
				result="/view.jsp?page=user/userlogin";
			
		}catch(NullPointerException e){
			result="/view.jsp?page=user/userlogin";
		}
		
		return result;
	}
	
	//자유게시판 수정 Result
	@RequestMapping("/moviedetail/{movieCd}/userforummodifyresult/{contentno}")
	public String userforumModifyResult(@PathVariable String movieCd, @PathVariable int contentno
			, Model model
			, HttpSession session
			, HttpServletRequest request, HttpServletResponse response) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		if(user==null){
			return "/view.jsp?page=user/userlogin";
		}
		else {
			String imagePath = "";
			String imageName = "";
			@SuppressWarnings("deprecation")
			String uploadPath = request.getRealPath("/resources/upload");
			UserforumDTO dto = service.userforumdetail(contentno);
			try {
				MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
						request, uploadPath, // 파일을 저장할 디렉토리 지정
						10 * 1024 * 1024, // 첨부파일 최대 용량 설정(bite)
						"utf-8", // 인코딩 방식 지정
						new DefaultFileRenamePolicy()); // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
	
				imagePath = multi.getFilesystemName("file1"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
				imageName = multi.getOriginalFileName("file1"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
			
				String content_title = multi.getParameter("content_title");
				String content_content = multi.getParameter("content_content");
				dto.setUser_no(user.getUser_no());
				dto.setUser_id(user.getUser_id());
				dto.setMovieCd(movieCd);
				dto.setContent_title(content_title);
				dto.setContent_content(content_content);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			service.userforumModify(dto);
			if(imageName!=null && !imageName.equals("")) { //사진 넣었을 경우
				dto.setImageName(imageName);
				dto.setImagePath(imagePath);
				imageService.modifyImg(dto);
			}
			model.addAttribute("userforumdetail", dto);
		
		return "/view.jsp?page=board/userforumdetail";
		}
	}
		
		
		
	// 리뷰 좋아요
	@PostMapping("/like")
    @ResponseBody
    public Map<String, Object> likeAjax(ReviewDTO like){
        
        Map<String, Object> result = new HashMap<String, Object>();
        service.reviewLike(like.getContentno());

        return result;       
    }
	
	
	// 리뷰 싫어요
	@PostMapping("/dislike")
    @ResponseBody
    public Map<String, Object> dislikeAjax(ReviewDTO dislike){
        
        Map<String, Object> result = new HashMap<String, Object>();
        service.reviewDisLike(dislike.getContentno());

        
        return result;       
    }
	
	// 자유게시판 좋아요
		@PostMapping("/forumlike")
	    @ResponseBody
	    public Map<String, Object> forumlikeAjax(UserforumDTO dto, HttpSession session){
			Map<String, Object> result = new HashMap<String, Object>();
			try {
				UserDTO user = (UserDTO) session.getAttribute("user");
				user.getUser_no();
				service.reviewLike(dto.getContent_no());
				result.put("result", "좋아요 완료");
			}catch(NullPointerException e){
				result.put("result", "로그인이 필요한 서비스입니다.");
			}
			
			return result;      
			
	        
	    }
		
		
		// 자유게시판 싫어요
		@PostMapping("/forumdislike")
	    @ResponseBody
	    public Map<String, Object> forumdislikeAjax(UserforumDTO dto, HttpSession session){
			Map<String, Object> result = new HashMap<String, Object>();
			try {
				UserDTO user = (UserDTO) session.getAttribute("user");
				user.getUser_no();
				service.reviewDisLike(dto.getContent_no());
				result.put("result", "싫어요 완료");
			}catch(NullPointerException e){
				result.put("result", "로그인이 필요한 서비스입니다.");
			}
			
			return result;      
			  
	    }
		// 자유게시판 신고
		@RequestMapping("/moviedetail/{movieCd}/forumreport")
		public String forumreport(@PathVariable String movieCd, @RequestParam HashMap<String, Object> hm, HttpSession session) {
			List<ReportDTO> reportlist = service.reportsearch(hm);
			if(reportlist.isEmpty()) {
				service.reviewreport(hm);
			}else{
				service.reviewreportupdate(hm);		
			}	
			return "redirect:/moviedetail/{movieCd}";
		}
		
		//신고게시판 조회
		@RequestMapping ("/report")
		public String ReportList(@RequestParam(required = false, defaultValue = "1") int currPage, 
				Model model, HttpSession session) {
			UserDTO user = (UserDTO) session.getAttribute("user");
			if(user!=null && user.getUser_no()==1) {
				int totalCount=service.getReportCount();
				int pageSize = 10;
				int blockSize = 5;
				PageBlock page = new PageBlock(currPage, totalCount, pageSize, blockSize);
				
				List<ReportDTO> reportList = service.getReportList(page.getStartRow() - 1, pageSize);
				model.addAttribute("page", page);
				model.addAttribute("reportList", reportList);
				return "/view.jsp?page=board/reportlist";
			}else {
				return "redirect:/";
			}
					
			
		}
}