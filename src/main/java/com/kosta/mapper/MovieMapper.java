package com.kosta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.KobisDTO;
@Mapper
public interface MovieMapper {
	public List<KobisDTO> getmovielist(String keyword);
	public KobisDTO getmoviedetail(int movieCd);
	public void insertmovie(List<KobisDTO> list);
	public void insertrank(List<KobisDTO> list);
}
