package com.kosta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.ReviewDTO;

@Mapper
public interface CommunityMapper {
	
	
	public List<ReviewDTO> getreview();
	
	
	
}
