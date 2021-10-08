package com.kosta.service;

import java.util.List;

import com.kosta.dto.ReviewDTO;

public interface CommunityService {
	
	public int totalCount(String search, String searchtxt);
	
	public int totalCount2(int boardno);
	
	public List<ReviewDTO> review();
	
	public List<ReviewDTO> reviewList();

	public List<ReviewDTO> generalReviewList();

	public List<ReviewDTO> allReview();
	public List<ReviewDTO> allReview(int startRow, int endRow);
	
	public List<ReviewDTO> famousLineList();
	public List<ReviewDTO> allFamousLine(String search, String searchtxt, int startRow, int endRow);
	
	public ReviewDTO reviewdetail(int contentno);
	
	public List<ReviewDTO> allUserForum();
	public List<ReviewDTO> allUserForum(int startRow, int endRow);

	
	public void reviewLike(int contentno);
	

}
