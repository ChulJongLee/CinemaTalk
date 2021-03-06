package com.kosta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
@Mapper
public interface MovieMapper {
	public List<KobisDTO> getmovielist(HashMap<String, Object> hm);
	public KobisDTO getmoviedetail(String movieCd);
	public void insertmovie(List<KobisDTO> list);
	public void insertrank(List<KobisDTO> list);
	public List<KobisDTO> getmoviedailyrank();
	public List<KobisDTO> getrandomlist();
	public void movierate(RateDTO movieRateData);
	public List<PersonInfoDTO> personinfo(String movieCd);
	public List<KobisDTO> getmovierate();
	public List<KobisDTO> getmovieopen();
	public float getmovierateone(HashMap<String, Object> hm);
	public int gettotalcount(String keyword);
	public List<KobisDTO> getmoviegenrelist(HashMap<String, Object> hm);
	public int getgenrecount(String keyword);
	public float getmovierateajax(String movieCd);
}
