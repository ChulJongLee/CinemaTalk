package com.kosta.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;
import com.kosta.mapper.MypageMapper;

@Service
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mapper;

	//회원정보 출력
	@Override
	public UserDTO getUserInfo(int user_no) {
		
		return mapper.getUserInfo(user_no);
	}

	//영화 총 감상시간
	@Override
	public double getTotalHour(int user_no) {
		
		Integer result = mapper.getTotalHour(user_no);
		if(result == null) {
			return 0;
		} else {
			double totalHour = result / 60.0d;
			double watchHour = Math.round(totalHour * 10)/10.0;
			
			return watchHour;
		}
		
	}
	
	//나의 콜렉션
	@Override
	public List<KobisDTO> getMyCollection(int user_no) {
		
		List<KobisDTO> movielist = mapper.getMyCollection(user_no);
		for(int i = 0; i < movielist.size(); i++) {
			if(movielist.get(i).getPoster().equals("")) {
				movielist.get(i).setPoster("/resources/img/poster_noimg.png");
			}
		}
		return movielist;
	}

	//나의 리뷰
	@Override
	public List<ReviewDTO> getMyReview(int user_no) {
		 
		return mapper.getMyReview(user_no);		
	}

	//평점 개수 출력
	@Override
	public int[] getRates(int user_no) {
		Map<String, Object> hm = new HashMap<>();
		hm.put("user_no", user_no);
		
		int[] arr = new int[10];
		int cnt = 0;
		for(double i = 0.5; i <= 5; i +=0.5) {
			hm.put("rate", i);
			int result = mapper.getRate(hm);
			arr[cnt] = result;
			cnt++;
		}
		return arr;
	}

	//평점 평균
	@Override
	public RateDTO getRateStatistic(int user_no) {
		
		return mapper.getRateStatistic(user_no);
	}

	//선호 배우
	@Override
	public List<PersonInfoDTO> getFavActor(int user_no) {
		
		List<PersonInfoDTO> actorinfolist = mapper.getFavActor(user_no);
		for(int i = 0; i < actorinfolist.size(); i++) {
			if(actorinfolist.get(i).getPerson_pic().equals("")) {
				actorinfolist.get(i).setPerson_pic("/resources/img/person_noimg.png");
			}
		}
		return actorinfolist;
	}

	//선호 감독
	@Override
	public List<PersonInfoDTO> getFavDirector(int user_no) {
		
		List<PersonInfoDTO> directorinfolist = mapper.getFavDirector(user_no);
		for(int i = 0; i < directorinfolist.size(); i++) {
			if(directorinfolist.get(i).getPerson_pic().equals("")) {
				directorinfolist.get(i).setPerson_pic("/resources/img/person_noimg.png");
			}
		}
		return directorinfolist;
	}

	//선호 장르
	@Override
	public List<KobisDTO> getFavGenre(int user_no) {
		
		return mapper.getFavGenre(user_no);
	}

	//선호 국가
	@Override
	public List<KobisDTO> getFavNation(int user_no) {
		
		return mapper.getFavNation(user_no);
	}

	//마이 컬렉션 리스트
	@Override
	public List<KobisDTO> getEveryCollection(int user_no, int startRow, int pageSize) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_no", user_no);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		
		List<KobisDTO> collectionlist = mapper.getEveryCollection(hm);
		for(int i = 0; i < collectionlist.size(); i++) {
			if(collectionlist.get(i).getPoster().equals("")) {
				collectionlist.get(i).setPoster("/resources/img/poster_noimg.png");
			}
		}
		return collectionlist;
	}

	//마이 리뷰 리스트
	@Override
	public List<ReviewDTO> getEveryReview(int user_no, int startRow, int pageSize) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_no", user_no);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		
		return mapper.getEveryReview(hm);
	}

	//마이 컬렉션 수 
	@Override
	public int collectionCount(int user_no) {
		
		return mapper.collectionCount(user_no);
	}

	//마이 리뷰 수
	@Override
	public int reviewCount(int user_no) {
		
		return mapper.reviewCount(user_no);
	}


}
