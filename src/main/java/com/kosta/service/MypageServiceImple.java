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
	public UserDTO getUserInfo() {
		
		return mapper.getUserInfo();
	}

	@Override
	public List<KobisDTO> getMyCollection(String user_no) {
		
		return mapper.getMyCollection(user_no);
	}

	@Override
	public List<ReviewDTO> getMyReview(String user_no) {
		 
		return mapper.getMyReview(user_no);		
	}

	@Override
	public List<RateDTO> getRates(String user_no) {
		
		return mapper.getRates(user_no);
	}

	@Override
	public RateDTO getRateStatistic(String user_no) {
		
		return mapper.getRateStatistic(user_no);
	}

	@Override
	public void getFavTag() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PersonInfoDTO> getFavActor(String user_no) {
		
		return mapper.getFavActor(user_no);
	}

	@Override
	public void getFavDirector() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getFavGenre() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getFavNation() {
		// TODO Auto-generated method stub
		
	}
	


}
