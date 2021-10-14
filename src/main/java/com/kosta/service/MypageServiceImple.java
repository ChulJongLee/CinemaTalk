package com.kosta.service;

import java.util.Arrays;
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

	@Override
	public UserDTO getUserInfo(int user_no) {
		
		return mapper.getUserInfo(user_no);
	}

	@Override
	public double getTotalHour(int user_no) {
		
		double totalHour = mapper.getTotalHour(user_no) / 60.0d;
		double watchHour = Math.round(totalHour * 10)/10.0;
		
		return watchHour;
	}
	
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

	@Override
	public List<ReviewDTO> getMyReview(int user_no) {
		 
		return mapper.getMyReview(user_no);		
	}

	@Override
	public int[] getRates(int user_no) {
//		List<RateDTO> ratelist = mapper.getRates(user_no);
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

	@Override
	public RateDTO getRateStatistic(int user_no) {
		
		return mapper.getRateStatistic(user_no);
	}

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

	@Override
	public List<KobisDTO> getFavGenre(int user_no) {
		
		return mapper.getFavGenre(user_no);
	}

	@Override
	public List<KobisDTO> getFavNation(int user_no) {
		
		return mapper.getFavNation(user_no);
	}

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

	@Override
	public List<ReviewDTO> getEveryReview(int user_no, int startRow, int pageSize) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_no", user_no);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		
		return mapper.getEveryReview(hm);
	}

	@Override
	public int collectionCount(int user_no) {
		
		return mapper.collectionCount(user_no);
	}

	@Override
	public int reviewCount(int user_no) {
		
		return mapper.reviewCount(user_no);
	}


}
