package com.kosta.service;

import java.util.List;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;

public interface MypageService {

	public UserDTO getUserInfo(int user_no);
	
	public List<KobisDTO> getMyCollection(int user_no);
	
	public List<ReviewDTO> getMyReview(int user_no);
	
	public int[] getRates(int user_no);
	
	public RateDTO getRateStatistic(int user_no);
	
	public List<PersonInfoDTO> getFavActor(int user_no);
	
	public List<PersonInfoDTO> getFavDirector(int user_no);
	
	public List<KobisDTO> getFavGenre(int user_no);
	
	public List<KobisDTO> getFavNation(int user_no);

	public List<KobisDTO> getEveryCollection(int user_no);

	public List<ReviewDTO> getEveryReview(int user_no);

	public double getTotalHour(int user_no);




}
