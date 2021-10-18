package com.kosta.service;

import java.util.HashMap;
import java.util.List;

import com.kosta.dto.ReportDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserforumDTO;

public interface CommunityService {
	
	public int totalCount(String search, String searchtxt);
	
	public int totalCount2(int boardno);
	
	public List<ReviewDTO> review();
	
	public List<ReviewDTO> reviewList(String movieCd);

	public List<ReviewDTO> generalReviewList(String movieCd);

	public List<ReviewDTO> allReview(String movieCd, int startRow, int endRow);
	
	public List<ReviewDTO> famousLineList();
	public List<ReviewDTO> allFamousLine(String search, String searchtxt, int startRow, int endRow);
	
	
	public void reviewLike(int contentno);
	public void reviewDisLike(int contentno);

	public void reviewinsert(HashMap<String, Object> hm);

	public int reviewdelete(int no);


	public void reviewmodify(HashMap<String, Object> hm);

	public void reviewreport(HashMap<String, Object> hm);

	public List<ReportDTO> reportsearch(HashMap<String, Object> hm);

	public void reviewreportupdate(HashMap<String, Object> hm);

	public List<UserforumDTO> allUserForum();
	public List<UserforumDTO> allUserForum(String movieCd, int startRow, int pageSize);
	public UserforumDTO userforumdetail(int contentno);
	public int userforumInsert(UserforumDTO dto);

	public void userforumModify(UserforumDTO dto);

	

}
