package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.ReviewDTO;

@Mapper
public interface CommunityMapper {
	
	public int totalCount(HashMap<String, Object> hm);
	
	public int totalCount2(int result);
	
	public List<ReviewDTO> list(HashMap<String, Object> hm);	
	
	public List<ReviewDTO> getgeneralreview();

	public List<ReviewDTO> getreview();

//	public List<ReviewDTO> getallreview();

	public List<ReviewDTO> getfamousline();

	public List<ReviewDTO> getallfamousline();

	public List<ReviewDTO> getallfamousline(HashMap<String, Object> hm);

	public List<ReviewDTO> getalluserforum();

//	public ReviewDTO reviewdetail(int contentno);

	public List<ReviewDTO> allUserForum(HashMap<String, Object> hm);


	public void reviewlike(int contentno);
	public void reviewdislike(int contentno);

	public int reviewinsert(HashMap<String, Object> hm);

	public int reviewdelete(int no);

	public ReviewDTO userforumdetail(int contentno);

	

	

	









	
	
	
}
