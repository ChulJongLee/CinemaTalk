package com.kosta.cinematalk;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.dto.KobisDTO;
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
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		if(user == null) {
			return "redirect:./login";
		} else {
			int user_no = user.getUser_no();
			String name = "홍길동";
			session.setAttribute("user_no", name);
			//개인정보
			UserDTO userdto = mypageService.getUserInfo(user_no);
			model.addAttribute("userdto", userdto);

			//컬렉션
			List<KobisDTO> movielist = mypageService.getMyCollection(user_no);
			for(int i = 0; i < movielist.size(); i++) {
				if(movielist.get(i).getPoster().equals("")) {
					movielist.get(i).setPoster("/resources/img/poster_noimg.png");
				}
			}
			model.addAttribute("movielist", movielist);

			//나의리뷰
			List<ReviewDTO> reviewlist = mypageService.getMyReview(user_no);
			model.addAttribute("reviewlist", reviewlist);

			//별점분포
			List<RateDTO> ratelist = mypageService.getRates(user_no);
			model.addAttribute("ratelist", ratelist);
			RateDTO ratedto = mypageService.getRateStatistic(user_no);
			model.addAttribute("ratedto", ratedto);
			//최대값 찾는법 : Arrays.sort(arr);
			//arr[arr.length()-1]
			//이거써도됨
			//Arrays.stream(arr).max().getAsInt()

			//영화선호태그
			//mypageService.getFavTag();

			//선호배우
			List<PersonInfoDTO> actorinfolist = mypageService.getFavActor(user_no);
			for(int i = 0; i < actorinfolist.size(); i++) {
				if(actorinfolist.get(i).getPerson_pic().equals("")) {
					actorinfolist.get(i).setPerson_pic("/resources/img/person_noimg.png");
				}
			}
			model.addAttribute("actorinfolist", actorinfolist);

			//선호 감독
			List<PersonInfoDTO> directorinfolist = mypageService.getFavDirector(user_no);
			for(int i = 0; i < directorinfolist.size(); i++) {
				if(directorinfolist.get(i).getPerson_pic().equals("")) {
					directorinfolist.get(i).setPerson_pic("/resources/img/person_noimg.png");
				}
			}
			model.addAttribute("directorinfolist", directorinfolist);

			//선호 장르
			List<KobisDTO> genrelist = mypageService.getFavGenre(user_no);
			model.addAttribute("genrelist", genrelist);

			//선호 국가
			List<KobisDTO> nationlist = mypageService.getFavNation(user_no);
			model.addAttribute("nationlist", nationlist);

			return "mypage/mypagemain";
		}
	}

	@GetMapping("/mypage/mycollection")
	public String myCollection(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		int user_no = user.getUser_no();

		List<KobisDTO> collectionlist = mypageService.getEveryCollection(user_no);
		for(int i = 0; i < collectionlist.size(); i++) {
			if(collectionlist.get(i).getPoster().equals("")) {
				collectionlist.get(i).setPoster("/resources/img/poster_noimg.png");
			}
		}
		model.addAttribute("collectionlist", collectionlist);


		return "mypage/mycollection";
	}

	@GetMapping("/mypage/myreview")
	public String myReview(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		int user_no = user.getUser_no();

		List<ReviewDTO> reviewlist = mypageService.getEveryReview(user_no);
		model.addAttribute("reviewlist", reviewlist);

		return "mypage/myreview";
	}

}
