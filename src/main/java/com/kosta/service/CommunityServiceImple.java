package com.kosta.service;

import java.util.HashMap;
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
	public List<ReviewDTO> allReview(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		

		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
	
		return mapper.list(hm);
	}


	@Override
	public List<ReviewDTO> famousLineList() {
		
		return mapper.getfamousline();
	}

	
	@Override
	public int totalCount2(int boardno) {
		
		int result = boardno;
		return mapper.totalCount2(result);
	}


	@Override
	public List<ReviewDTO> allFamousLine(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);	
		
		return mapper.getallfamousline(hm);
	}


	@Override
	public List<ReviewDTO> allUserForum() {
		
		return mapper.getalluserforum();
	}


//	@Override
//	public ReviewDTO reviewdetail(int contentno) {
//
//		return mapper.reviewdetail(contentno);
//	}


	@Override
	public List<ReviewDTO> allUserForum(int startRow, int endRow) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return mapper.allUserForum(hm);
	}


	@Override
	public void reviewLike(int contentno) {
		mapper.reviewlike(contentno);	
	}
	@Override
	public void reviewDisLike(int contentno) {
		mapper.reviewdislike(contentno);	
	}
	
	

	@Override
	public void reviewinsert(HashMap<String, Object> hm) {

		int result = mapper.reviewinsert(hm);
	}

	@Override
	public int reviewdelete(int no) {
		
		
		return mapper.reviewdelete(no);
	}

	@Override
	public ReviewDTO userforumdetail(int contentno) {
		
		
		return mapper.userforumdetail(contentno);
	}

	@Override
	public void reviewmodify(HashMap<String, Object> hm) {
		
		int result = mapper.reviewmodify(hm);
		
	}






	
}
