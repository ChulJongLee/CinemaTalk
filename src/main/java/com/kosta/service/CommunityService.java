package com.kosta.service;

import java.util.List;

import com.kosta.dto.ReviewDTO;

public interface CommunityService {
	
	
	public List<ReviewDTO> reviewList();

	public List<ReviewDTO> generalReviewList();

	public List<ReviewDTO> allReview();

}
