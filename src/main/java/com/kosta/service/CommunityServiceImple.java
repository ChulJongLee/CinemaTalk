package com.kosta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kosta.dto.ReviewDTO;
import com.kosta.mapper.CommunityMapper;

@Service("reviewservice")
public class CommunityServiceImple implements CommunityService {

	
	@Autowired // @Qualifier("communityMapper")
	private CommunityMapper mapper;
	
	
	@Override
	public List<ReviewDTO> reviewList() {
		
		return mapper.getreview();
	}


	@Override
	public List<ReviewDTO> generalReviewList() {
		
		return mapper.getgeneralreview();
	}


	@Override
	public List<ReviewDTO> allReview() {

		return mapper.getallreview();
	}

	
	
}
