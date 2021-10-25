package com.kosta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RateDTO;
import com.kosta.dto.RequestDTO;
import com.kosta.mapper.MovieMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieServiceImple implements MovieService {
	private static String kobiskey;
	private static String kmdbkey;

	@Value("${kobiskey}")
	public void setKobiskey(String value) {
		kobiskey = value;
	}

	@Value("${kmdbkey}")
	public void setKmdbkey(String value) {
		kmdbkey = value;
	}

	@Autowired
	private MovieMapper mapper;

	@Override
	public void insertMovie(RequestDTO rdto) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		rdto.setKobiskey(kobiskey);
		rdto.setKmdbkey(kmdbkey);
		KobisAPI kobisAPI = new KobisAPIImple();
		List<KobisDTO> list = kobisAPI.requestMovieList(rdto);
		if (list.size() != 0) {
//			System.out.println("size...." + list.size());
			mapper.insertmovie(list);
		} else {
//			System.out.println("에러발생");
		}
	}

	@Override
	public KobisDTO getMovieDetail(String movieCd) {
		// TODO Auto-generated method stub
		KobisDTO dto=mapper.getmoviedetail(movieCd);
		return dto;
	}

	@Override
	public List<KobisDTO> getMovieList(String keyword, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("keyword", keyword);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		return mapper.getmovielist(hm);
	}
	
	@Override
	public List<KobisDTO> getMovieGenreList(String keyword, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("keyword", keyword);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		return mapper.getmoviegenrelist(hm);
	}

	@Override
	public List<KobisDTO> getRandomList(){
		// TODO Auto-generated method stub
		return mapper.getrandomlist();
	}

	@Override
	public void insertRank(RequestDTO rdto) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		rdto.setKobiskey(kobiskey);
		KobisAPI kobisAPI = new KobisAPIImple();
		List<KobisDTO> list = kobisAPI.requestRank(rdto);
//		System.out.println(list.size());
		mapper.insertrank(list);
	}

	@Override
	public List<KobisDTO> getMovieRank() {
		// TODO Auto-generated method stub
		return mapper.getmoviedailyrank();
	}

	@Override
	public void movieRate(RateDTO movieRateData) {
		// TODO Auto-generated method stub
		mapper.movierate(movieRateData);
	}

	@Override
	public List<PersonInfoDTO> getPersonInfo(String movieCd) {
		// TODO Auto-generated method stub
		return mapper.personinfo(movieCd);
	}

	@Override
	public List<KobisDTO> getMovieRate() {
		// TODO Auto-generated method stub
		List<KobisDTO> list=mapper.getmovierate();
		for(int i=0;i<list.size();i++) {
			list.get(i).setRank(i+1+"");
		}
		return list;
	}

	@Override
	public List<KobisDTO> getMovieOpen() {
		// TODO Auto-generated method stub
		return mapper.getmovieopen();
	}

	@Override
	public float getMovieRateOne(String movieCd, int user_no) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("movieCd", movieCd);
		hm.put("user_no", user_no);
		
		float result=mapper.getmovierateone(hm);
		return result;
	}

	@Override
	public int getTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.gettotalcount(keyword);
	}

	@Override
	public int getGenreCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.getgenrecount(keyword);
	}

	@Override
	public float getMovieRateOne(String movieCd) {
		// TODO Auto-generated method stub
		return mapper.getmovierateajax(movieCd);
	}

	
}
