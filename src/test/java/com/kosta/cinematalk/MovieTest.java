package com.kosta.cinematalk;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.dto.RequestDTO;
import com.kosta.service.MovieServiceImple;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class MovieTest {
	@Resource(name="movieServiceImple")
	private MovieServiceImple movieService;
	
//	@Test
//	public void test2(){
//		
//		System.out.println(movieService.getMovieDetail("1").getMovieNm());
//	}
	@Test
	public void insertfrist() throws OpenAPIFault, Exception {
		RequestDTO rdto=new RequestDTO();
		rdto.setKeyword("스파이더맨");
		movieService.insertMovie(rdto);
	}
//	@Test
//	public void insertnext() throws OpenAPIFault, Exception {
//		RequestDTO rdto=new RequestDTO();
//		rdto.setMovieNm("어벤져스");
//		int pretotalcount=80000;
//		int nexttotalcount=movieService.requestMovieCount(rdto);
//		int totalcount=nexttotalcount-pretotalcount;
//		for(int i=0;i<totalcount/100;i++) {
//			
//		}
//		
////		totalcount/100;
////		rdto.setCurPage(curPage);
//		rdto.setItemPerPage(String.valueOf(totalcount));
//		
//		movieService.insertMovie(rdto);
//	}
//	
//	@Test
//	public void getall() {
//		RequestDTO rdto=new RequestDTO();
//		
//		
//	}
//	
//	@Test
//	public void test() {
//		System.out.println(199/100);
//	}
}
