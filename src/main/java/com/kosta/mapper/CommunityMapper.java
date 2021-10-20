package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosta.dto.ReportDTO;
import com.kosta.dto.ReviewDTO;
import com.kosta.dto.UserforumDTO;

@Mapper
public interface CommunityMapper {
	
	public int totalCount(HashMap<String, Object> hm);
	
	public int totalCount2(@Param("movieCd") String movieCd, @Param("boardno") int boardno);
	
	public List<ReviewDTO> list(HashMap<String, Object> hm);	
	
	public List<ReviewDTO> getgeneralreview(String movieCd);

	public List<ReviewDTO> getreview(String movieCd);

	public List<ReviewDTO> getfamousline();

	public List<ReviewDTO> getallfamousline();

	public List<ReviewDTO> getallfamousline(HashMap<String, Object> hm);

	public void reviewlike(int contentno);
	public void reviewdislike(int contentno);

	// 리뷰쓰기 mapper
	public int reviewinsert(HashMap<String, Object> hm);

	// 리뷰 삭제 mapper
	public int reviewdelete(int no);

	// 리뷰 수정 mapper
	public int reviewmodify(HashMap<String, Object> hm);

	// 리뷰 신고(최초신고)
	public int reviewreport(HashMap<String, Object> hm);
	
	// 신고 리뷰 체크 mapper
	public List<ReportDTO> reportsearch(HashMap<String, Object> hm);
	public List<ReportDTO> getreportlist(HashMap<String, Object> hm);

	// 리뷰 신고(중복)
	public int reviewreportupdate(HashMap<String, Object> hm);

	
	public List<UserforumDTO> getworstuserforms(String movieCd);
	public List<UserforumDTO> getbestuserforms(String movieCd);
	public List<UserforumDTO> allUserForum(HashMap<String, Object> hm);
	public UserforumDTO userforumdetail(int contentno);
	public int userforuminsert(UserforumDTO dto);

	public void userforummodify(UserforumDTO dto);

	public int getreportcount();

	

	

	









	
	
	
}
