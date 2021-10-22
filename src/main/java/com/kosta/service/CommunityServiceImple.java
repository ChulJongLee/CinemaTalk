package com.kosta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dto.LikeDTO;
import com.kosta.dto.ReportDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserforumDTO;
import com.kosta.mapper.CommunityMapper;

@Service
public class CommunityServiceImple implements CommunityService {

	
	@Autowired
	private CommunityMapper mapper;
	
	
	@Override
	public List<ReviewDTO> reviewList(String movieCd) {
		
		return mapper.getreview(movieCd);
	}

	@Override
	public List<ReviewDTO> generalReviewList(String movieCd) {
		
		return mapper.getgeneralreview(movieCd);
	}


	@Override
	public int totalCount(String search, String searchtxt) {		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		int result = mapper.totalCount(hm);
		
		return result;
	}
	
	@Override
	public List<ReviewDTO> review() {
		return null;
	}


	@Override
	public List<ReviewDTO> allReview(String movieCd, int startRow, int pageSize) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		

		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		hm.put("movieCd", movieCd);
	
		return mapper.list(hm);
	}


	@Override
	public int totalCount2(String movieCd, int boardno) {
		
		return mapper.totalCount2(movieCd, boardno);
	}
	
	

	@Override
	public List<UserforumDTO> getBestUserforms(String movieCd) {
		
		return mapper.getbestuserforms(movieCd);
	}
	@Override
	public List<UserforumDTO> getWorstUserforms(String movieCd) {
		
		return mapper.getworstuserforms(movieCd);
	}
	
	// 리뷰 좋아요.
	@Override
	public LikeDTO reviewLike(int content_no, int user_no) {

		return mapper.reviewlike(content_no, user_no);	
	}
	
	// 리뷰 좋아요 추가
	@Override
	public void insertlike(int content_no, int user_no) {
		
		mapper.insertlike(content_no, user_no);
	}	
	// 리뷰 좋아요 취소
	@Override
	public void updatelike(LikeDTO likeresult) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("content_no", likeresult.getContent_no());
		hm.put("user_no", likeresult.getUser_no());
		hm.put("likecheck", likeresult.getLikecheck());
		hm.put("hatecheck", likeresult.getHatecheck());
			
		mapper.updatelike(hm);
	}
	// 리뷰 좋아요 전체
	@Override
	public int getlike(int content_no) {
		
		return mapper.likeresult(content_no);
	}
	

	@Override
	public void insertdislike(int content_no, int user_no) {
		
		mapper.insertdislike(content_no, user_no);
	}

	@Override
	public void updatedislike(LikeDTO likeresult) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("content_no", likeresult.getContent_no());
		hm.put("user_no", likeresult.getUser_no());
		hm.put("likecheck", likeresult.getLikecheck());
		hm.put("hatecheck", likeresult.getHatecheck());
			
		mapper.updatedislike(hm);
	}
	
	@Override
	public int getdislike(int content_no) {
		
		return mapper.dislikeresult(content_no);
	}
	

	@Override
	public UserforumDTO userforumdetail(int contentno) {
		
		
		return mapper.userforumdetail(contentno);
	}

	@Override
	public int userforumInsert(UserforumDTO dto) {

		return mapper.userforuminsert(dto);
	}

	@Override
	public void reviewinsert(HashMap<String, Object> hm) {
		
		if(hm.get("spoiler")==null) {
			hm.put("spoiler", 0);
		}else {
			hm.put("spoiler",1);
		}

		mapper.reviewinsert(hm);
	}

	// 리뷰 삭제 serviceimple
	@Override
	public int reviewdelete(int no) {
		return mapper.reviewdelete(no);
	}

	
	// 리뷰 수정 serviceimple
	@Override
	public void reviewmodify(HashMap<String, Object> hm) {
		
		mapper.reviewmodify(hm);	
	}

	// 리뷰 신고(최초신고)
	@Override
	public void reviewreport(HashMap<String, Object> hm) {
		
		mapper.reviewreport(hm);
	}

	@Override
	public List<ReportDTO> reportsearch(HashMap<String, Object> hm) {
		
		return mapper.reportsearch(hm);
	}
	
	@Override
	public List<ReportDTO> getReportList(int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		return mapper.getreportlist(hm);
	}
	
	// 리뷰 신고(중복)
	@Override
	public void reviewreportupdate(HashMap<String, Object> hm) {
		
		mapper.reviewreportupdate(hm);
	}

	@Override
	public void userforumModify(UserforumDTO dto) {

		mapper.userforummodify(dto);
	}

	@Override
	public int getReportCount() {
		// TODO Auto-generated method stub
		return mapper.getreportcount();
	}

	@Override
	public int getTotalCount(String movieCd, int boardno, String search, String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("movieCd", movieCd);
		hm.put("boardno", boardno);
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.gettotalcount(hm);
	}

	@Override
	public List<UserforumDTO> userforumList(String movieCd, int board_distinct_no, String search, String searchtxt, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("movieCd", movieCd);
		hm.put("board_distinct_no", board_distinct_no);
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		
		return mapper.userforumlist(hm);
	}

}
