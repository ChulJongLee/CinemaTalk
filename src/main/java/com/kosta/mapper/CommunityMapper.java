package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.ReportDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserforumDTO;

@Mapper
public interface CommunityMapper {
	
	public int totalCount(HashMap<String, Object> hm);
	
	public int totalCount2(int result);
	
	public List<ReviewDTO> list(HashMap<String, Object> hm);	
	
	public List<ReviewDTO> getgeneralreview(String movieCd);

	public List<ReviewDTO> getreview(String movieCd);

//	public List<ReviewDTO> getallreview();

	public List<ReviewDTO> getfamousline();

	public List<ReviewDTO> getallfamousline();

	public List<ReviewDTO> getallfamousline(HashMap<String, Object> hm);

//	public ReviewDTO reviewdetail(int contentno);

	public void reviewlike(int contentno);
	public void reviewdislike(int contentno);

	public int reviewinsert(HashMap<String, Object> hm);

	public int reviewdelete(int no);


	public int reviewmodify(HashMap<String, Object> hm);

	public int reviewreport(HashMap<String, Object> hm);

	public List<ReportDTO> reportsearch(HashMap<String, Object> hm);

	public int reviewreportupdate(HashMap<String, Object> hm);

	
	public List<UserforumDTO> getalluserforum();
	public List<UserforumDTO> allUserForum(HashMap<String, Object> hm);
	public UserforumDTO userforumdetail(int contentno);
	public int userforuminsert(UserforumDTO dto);

	public void userforummodify(UserforumDTO dto);
	

	

	









	
	
	
}
