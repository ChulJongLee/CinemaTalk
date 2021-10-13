package com.kosta.service;

import java.util.List;

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
	public List<KobisDTO> getMyCollection(int user_no) {
		
		return mapper.getMyCollection(user_no);
	}

	@Override
	public List<ReviewDTO> getMyReview(int user_no) {
		 
		return mapper.getMyReview(user_no);		
	}

	@Override
	public List<RateDTO> getRates(int user_no) {
		
		return mapper.getRates(user_no);
	}

	@Override
	public RateDTO getRateStatistic(int user_no) {
		
		return mapper.getRateStatistic(user_no);
	}

	@Override
	public void getFavTag() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PersonInfoDTO> getFavActor(int user_no) {
		
		return mapper.getFavActor(user_no);
	}

	@Override
	public List<PersonInfoDTO> getFavDirector(int user_no) {
		
		return mapper.getFavDirector(user_no);
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
	public List<KobisDTO> getEveryCollection(int user_no) {
		
		return mapper.getEveryCollection(user_no);
	}

	@Override
	public List<ReviewDTO> getEveryReview(int user_no) {
		
		return mapper.getEveryReview(user_no);
	}
	


}
