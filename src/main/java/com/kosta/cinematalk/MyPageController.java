package com.kosta.cinematalk;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyPageController {
	
	private final MypageService mypageService;
	
	@GetMapping("/mypage")
	public String mypage(Model model) {
		String user_no = "1";
		//개인정보
//		mypageService.getUserInfo();
		
		//컬렉션
		List<KobisDTO> movielist = mypageService.getMyCollection(user_no);
		for(int i = 0; i < movielist.size(); i++) {
			if(movielist.get(i).getPoster().equals("")) {
				movielist.get(i).setPoster("/resources/img/poster_noimg.png");
			}
		}
		model.addAttribute("movielist", movielist);
//		for(KobisDTO item : movielist) {
//		System.out.println(item.getMovieNm());
//		System.out.println(item.getPoster());
//		System.out.println(item.getRank());
//		System.out.println("====");
//		}
		
		//나의리뷰
		List<ReviewDTO> reviewlist = mypageService.getMyReview(user_no);
		model.addAttribute("reviewlist", reviewlist);
//		for(ReviewDTO item : reviewlist) {
//			System.out.println(item.getTitle());
//			System.out.println(item.getContents());
//			System.out.println("====");
//		}
		//별점분포
		List<RateDTO> ratelist = mypageService.getRates(user_no);
//		for(RateDTO item : ratelist) {
//			System.out.println(item.getRate());
//			System.out.println(item.getUser_no());
//			System.out.println("==============");
//		}
		RateDTO ratedto = mypageService.getRateStatistic(user_no);
		model.addAttribute("ratedto", ratedto);
//		//평균평점
//		System.out.println(ratedto.getRate());
//		//평점 총 개수
//		System.out.println(ratedto.getUser_no());
//		System.out.println("==============");

		
		//영화선호태그
//		mypageService.getFavTag();
		
		//선호배우
		List<PersonInfoDTO> personinfolist = mypageService.getFavActor(user_no);
		for(int i = 0; i < personinfolist.size(); i++) {
			if(personinfolist.get(i).getPerson_pic().equals("")) {
				personinfolist.get(i).setPerson_pic("/resources/img/person_noimg.png");
			}
		}
		model.addAttribute("personinfolist", personinfolist);
		
		//선호 감독
//		mypageService.getFavDirector();
		
		//선호 장르
//		mypageService.getFavGenre();
		
		//선호 국가
//		mypageService.getFavNation();
		
		
		return "mypagemain";
	}
	
	
}
