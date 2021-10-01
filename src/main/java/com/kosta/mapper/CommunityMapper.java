package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.ReviewDTO;

@Mapper
public interface CommunityMapper {
	
	public int totalCount(HashMap<String, Object> hm);
	
	public List<ReviewDTO> list(HashMap<String, Object> hm);	
	
	public List<ReviewDTO> getgeneralreview();

	public List<ReviewDTO> getreview();

	public List<ReviewDTO> getallreview();



	
	
	
}
