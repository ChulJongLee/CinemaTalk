package com.kosta.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.UserforumDTO;

@Mapper
public interface ImageMapper {

	public int getimgnum(HashMap<String, Object> hm);

	public int insertimg(UserforumDTO dto);

	public UserforumDTO getimg(int content_no);

}
