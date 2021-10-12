package com.kosta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserDTO;

@Mapper
public interface MypageMapper {

	UserDTO getUserInfo();

	List<KobisDTO> getMyCollection(String user_no);

	List<ReviewDTO> getMyReview(String user_no);

	List<PersonInfoDTO> getFavActor(String user_no);

	List<RateDTO> getRates(String user_no);

	RateDTO getRateStatistic(String user_no);
	

	
}
