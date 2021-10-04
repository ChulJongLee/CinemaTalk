package com.kosta.service;

import java.util.List;

import com.kosta.dto.ReviewDTO;

public interface CommunityService {
	
	public int totalCount(String search, String searchtxt);
	public int totalCount();
	
	public List<ReviewDTO> review();
	
	public List<ReviewDTO> reviewList();

	public List<ReviewDTO> generalReviewList();

	public List<ReviewDTO> allReview();
	public List<ReviewDTO> allReview(String search, String searchtxt, int startRow, int endRow);
	
	public List<ReviewDTO> famousLineList();
//	public List<ReviewDTO> allFamousLine();
	public List<ReviewDTO> allFamousLine(String search, String searchtxt, int startRow, int endRow);
	
	
	public List<ReviewDTO> allUserForum();

}
