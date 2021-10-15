package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;

@Mapper
public interface MypageMapper {

	UserDTO getUserInfo(int user_no);

	List<KobisDTO> getMyCollection(int user_no);

	List<ReviewDTO> getMyReview(int user_no);

	List<PersonInfoDTO> getFavActor(int user_no);

	RateDTO getRateStatistic(int user_no);

	List<PersonInfoDTO> getFavDirector(int user_no);

	List<KobisDTO> getFavGenre(int user_no);

	List<KobisDTO> getFavNation(int user_no);

	List<KobisDTO> getEveryCollection(HashMap<String, Object> hm);

	List<ReviewDTO> getEveryReview(HashMap<String, Object> hm);

	int getRate(Map<String, Object> hm);

	Integer getTotalHour(int user_no);

	int collectionCount(int user_no);

	int reviewCount(int user_no);
	

	
}
