package com.kosta.service;

import com.kosta.dto.UserforumDTO;

public interface ImageService {
	public int getImgNum(String imageName,String imagePath);
	public UserforumDTO getImg(int content_no);
	public int insertImg(UserforumDTO dto);
	public void modify(UserforumDTO dto);
	public void delete(int imgNum);
	public void modifyImg(UserforumDTO dto);
	
}
