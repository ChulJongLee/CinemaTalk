package com.kosta.cinematalk;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PageBlock;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;
import com.kosta.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyPageController {

	private final MypageService mypageService;

	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:./login";
		} else {
			int user_no = user.getUser_no();
			
			//개인정보 이거는 회원등급?테이블이랑 조인해야될것같음
			UserDTO userdto = mypageService.getUserInfo(user_no);
			model.addAttribute("userdto", userdto);
			double watchHour = mypageService.getTotalHour(user_no);
			model.addAttribute("watchHour", watchHour);

			//컬렉션
			List<KobisDTO> movielist = mypageService.getMyCollection(user_no);
			model.addAttribute("movielist", movielist);

			//나의리뷰
			List<ReviewDTO> reviewlist = mypageService.getMyReview(user_no);
			model.addAttribute("reviewlist", reviewlist);

			//별점분포
			int[] arr = mypageService.getRates(user_no);
			model.addAttribute("arr", arr);
			RateDTO ratedto = mypageService.getRateStatistic(user_no);
			model.addAttribute("ratedto", ratedto);

			//선호배우
			List<PersonInfoDTO> actorinfolist = mypageService.getFavActor(user_no);
			model.addAttribute("actorinfolist", actorinfolist);

			//선호 감독
			List<PersonInfoDTO> directorinfolist = mypageService.getFavDirector(user_no);
			model.addAttribute("directorinfolist", directorinfolist);

			//선호 장르
			List<KobisDTO> genrelist = mypageService.getFavGenre(user_no);
			model.addAttribute("genrelist", genrelist);

			//선호 국가
			List<KobisDTO> nationlist = mypageService.getFavNation(user_no);
			model.addAttribute("nationlist", nationlist);

			return "/view.jsp?page=mypage/mypagemain";
		}
	}

	@GetMapping("/mypage/mycollection")
	public String myCollection(HttpSession session, @RequestParam(required = false, defaultValue = "1") int currPage, Model model) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		int user_no = user.getUser_no();

		int totalCount = mypageService.collectionCount(user_no); //전체 자료 수 확인
		int pageSize = 20;
		int blockSize = 5;
		
		PageBlock page = new PageBlock(currPage, totalCount, pageSize, blockSize);
		
		List<KobisDTO> collectionlist = mypageService.getEveryCollection(user_no, page.getStartRow() - 1, pageSize);
		model.addAttribute("collectionlist", collectionlist);
		model.addAttribute("page", page);

		return "/view.jsp?page=mypage/mycollection";
	}

	@GetMapping("/mypage/myreview")
	public String myReview(HttpSession session, @RequestParam(required = false, defaultValue = "1") int currPage, Model model) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		int user_no = user.getUser_no();
		
		int totalCount = mypageService.reviewCount(user_no); //전체 자료 수 확인
		int pageSize = 20;
		int blockSize = 5;

		PageBlock page = new PageBlock(currPage, totalCount, pageSize, blockSize);
		
		List<ReviewDTO> reviewlist = mypageService.getEveryReview(user_no, page.getStartRow() - 1, pageSize);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("page", page);
		
		return "/view.jsp?page=mypage/myreview";
	}

}
