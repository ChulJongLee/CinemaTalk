package com.kosta.service;

import java.util.HashMap;
import java.util.List;

import com.kosta.dto.LikeDTO;
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
	
	
	// 리뷰 좋아요 
	public LikeDTO reviewLike(int content_no, int user_no);
	
	// 리뷰 좋아요 추가
	public void insertlike(int content_no, int user_no);
	// 리뷰 좋아요 수정
	public void updatelike(LikeDTO likeresult);
	// 좋아요 토탈
	public int getlike(int content_no);
	
	// 리뷰 싫어요 추가
	public void insertdislike(int content_no, int user_no);
	// 리뷰 싫어요 수정
	public void updatedislike(LikeDTO likeresult);
	// 리뷰 싫어요 토탈
	public int getdislike(int content_no);
	

	
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
	public UserforumDTO userforumdetail(int contentno);
	public int userforumInsert(UserforumDTO dto);

	public void userforumModify(UserforumDTO dto);

	public int getReportCount();

	public int getTotalCount(String movieCd, int boardno, String search, String searchtxt);

	public List<UserforumDTO> userforumList(String movieCd, int board_distinct_no, String search, String searchtxt, int i, int pageSize);








	







}
