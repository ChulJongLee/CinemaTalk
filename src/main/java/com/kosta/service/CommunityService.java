package com.kosta.service;

import java.util.HashMap;
import java.util.List;

import com.kosta.dto.ReportDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserforumDTO;

public interface CommunityService {
	
	public int totalCount(String search, String searchtxt);
	
	public int totalCount2(String movieCd, int boardno);
	
	public List<ReviewDTO> review();
	
	public List<ReviewDTO> reviewList(String movieCd);

	public List<ReviewDTO> generalReviewList(String movieCd);

	public List<ReviewDTO> allReview(String movieCd, int startRow, int pageSize);
	
	public List<ReviewDTO> famousLineList();
	public List<ReviewDTO> allFamousLine(String search, String searchtxt, int startRow, int endRow);
	
	
	public void reviewLike(int contentno);
	public void reviewDisLike(int contentno);

	// 리뷰 쓰기 service
	public void reviewinsert(HashMap<String, Object> hm);
	
	// 리뷰 삭제 service
	public int reviewdelete(int no);

	// 리뷰 수정 service
	public void reviewmodify(HashMap<String, Object> hm);

	// 리뷰 신고(최초신고)
	public void reviewreport(HashMap<String, Object> hm);
	
	// 신고 리뷰 체크 service
	public List<ReportDTO> reportsearch(HashMap<String, Object> hm);
	public List<ReportDTO> getReportList(int startRow, int pageSize);

	// 리뷰 신고(중복)
	public void reviewreportupdate(HashMap<String, Object> hm);

	public List<UserforumDTO> getWorstUserforms(String movieCd);
	public List<UserforumDTO> getBestUserforms(String movieCd);
	public List<UserforumDTO> allUserForum(String movieCd, int startRow, int pageSize);
	public UserforumDTO userforumdetail(int contentno);
	public int userforumInsert(UserforumDTO dto);

	public void userforumModify(UserforumDTO dto);

	public int getReportCount();


	

}
