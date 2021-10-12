package com.kosta.service;

import java.util.List;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;

public interface MypageService {

	public UserDTO getUserInfo();
	
	public List<KobisDTO> getMyCollection(String user_no);
	
	public List<ReviewDTO> getMyReview(String user_no);
	
	public List<RateDTO> getRates(String user_no);
	
	public RateDTO getRateStatistic(String user_no);
	
	public void getFavTag();
	
	public List<PersonInfoDTO> getFavActor(String user_no);
	
	public void getFavDirector();
	
	public void getFavGenre();
	
	public void getFavNation();




}
