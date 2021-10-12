package com.kosta.cinematalk;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RequestDTO;
import com.kosta.service.MovieServiceImple;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class MovieTest {
	@Resource(name="movieServiceImple")
	private MovieServiceImple movieService;
	
	@Test
	public void insertfrist() throws OpenAPIFault, Exception {
		RequestDTO rdto=new RequestDTO();
		rdto.setKeyword("");
		movieService.insertMovie(rdto);
	}
	
	@Test
	public void insertRank() throws OpenAPIFault, Exception {
		RequestDTO rdto=new RequestDTO();
		movieService.insertRank(rdto);
	}
	@Test
	public void getMovieList() {
		String keyword="가나다";
		List<KobisDTO> list=movieService.getMovieList(keyword);
		System.out.println(list.size());
		
	}
	@Test
	public void getMovieRank() {
		List<KobisDTO> list=movieService.getMovieRank();
		for(KobisDTO item:list)
			System.out.println(item.getRank()+" : "+item.getMovieCd());
	}
	
	@Test
	public void getMovieDetail() {
		String movieCd="19720031";
		KobisDTO dto=movieService.getMovieDetail(movieCd);
		System.out.println(dto.getMovieCd()+", "+dto.getMovieNm());
	}
	
	@Test
	public void getRandList() {
		List<KobisDTO> list=movieService.getRandomList();
		System.out.println(list.size());
	}
	
	@Test
	public void getPerson() {
	List<PersonInfoDTO> personInfo=movieService.getPersonInfo("20217742");
	System.out.println(personInfo.size());
	for(PersonInfoDTO item:personInfo) {
		System.out.println(item.getPeopleNm());
		System.out.println(item.getPerson_pic());
	}
	}
}
