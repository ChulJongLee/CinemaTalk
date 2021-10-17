package com.kosta.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dto.UserforumDTO;
import com.kosta.mapper.ImageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageServiceImple implements ImageService {
	@Autowired
	private ImageMapper mapper;
	@Override
	public int getImgNum(String imageName, String imagePath) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("imageName", imageName);
		hm.put("imagePath", imagePath);
		
		return mapper.getimgnum(hm);
	}

	@Override
	public UserforumDTO getImg(int content_no) {
		// TODO Auto-generated method stub
		return mapper.getimg(content_no);
	}

	@Override
	public int insertImg(UserforumDTO dto) {
		// TODO Auto-generated method stub
		return mapper.insertimg(dto);
	}

	@Override
	public void modify(UserforumDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int imgNum) {
		// TODO Auto-generated method stub

	}

}
