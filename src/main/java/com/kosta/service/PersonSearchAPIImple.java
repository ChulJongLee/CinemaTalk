package com.kosta.service;

import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.PersonResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonSearchAPIImple implements PersonSearchAPI {

	private static String key;

	@Value("${kobiskey}")
	public void setKey(String value) {
		key = value;
	}
	
	String actor = "현빈";
	
	@Override
	public List<PersonInfoDTO> getKobisPersonList() throws OpenAPIFault, Exception {
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		String peoplelistresult = service.getPeopleList(true, "1", "100", actor, "");
//		System.out.println(peoplelistresult);
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(peoplelistresult, JsonObject.class);
		PersonResponseDTO dto = gson.fromJson(obj.getAsJsonObject("peopleListResult").toString(), PersonResponseDTO.class);
//		System.out.println("인물 자료 총 개수 : " + dto.getTotCnt());
		List<PersonInfoDTO> list = dto.getPeopleList();
//		System.out.println("처음 개수 : " + list.size());
		
		for(int i = 0 ; i < list.size() ; i++) {
			if(!list.get(i).getRepRoleNm().contains("배우") && !list.get(i).getRepRoleNm().contains("감독")) {
				list.remove(i);
				i--;
			}			
		}	
//		System.out.println("거른 다음의 개수 : " + list.size());	
		
		return list;
	}
	
	@Override
	public void personDetail() throws OpenAPIFault, Exception {
		List<PersonInfoDTO> list = getKobisPersonList();
		
		String url = "https://www.kobis.or.kr/kobis/business/mast/peop/searchPeopleList.do";
		Connection conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", actor);
		Document doc = conn.post();	
		int totalCount = Integer.parseInt(doc.select("em.fwb").get(0).text());
//		for(int j = 1 ; j <= (totalCount / 10) + 1 ; j++) {

//		doc.select("form#pagingForm>input[name=curPage]").removeAttr("value").attr("value", String.valueOf(2));
		Elements menu =  doc.select(".tbl_comm>tbody>tr");
//		conn.data("curPage", String.valueOf(j)).post();
		for(int i = 0 ; i < list.size() ; i ++) {

			while(list.get(i).getPeopleCd().equals(menu.select("td").get(2).text())) {
				
				list.get(i).setPerson_bdate(menu.select("td").get(5).text());
				list.get(i).setCountry_no(menu.select("td").get(6).text());

				menu = menu.next();
			
			}

			// 페이지를 넘겨서 값을 받는 거 다시 고려
//			if(i == 0) {
//				list.get(i).setPerson_bdate(menu.get(4).text());
//				list.get(i).setCountry_no(menu.get(5).text());
//			} else {
//				list.get(i).setPerson_bdate(menu.get(5).text());
//				System.out.println("====d=d===d=d==d=d==");
//				System.out.println(menu.get(5).text());
//				list.get(i).setCountry_no(menu.get(6).text());
//				System.out.println(menu.get(6).text());
//				System.out.println("ddffdffs===========");
//			}
//			for(int j = 0 ; j < totalCount ; j++) {
//				if(list.get(i).getPeopleCd().equals(menu.get(2).text())) {
//					list.get(i).setPerson_bdate(menu.get(5).text());
//					list.get(i).setCountry_no(menu.get(6).text());
//					System.out.println("if문 안에.....");
//				} else {
//					menu = menu.next();
//				}
//			}

				
			System.out.println("검색했을때 totalcount..." + totalCount);
			System.out.println("사람코드는....." + list.get(i).getPeopleCd());
			System.out.println("이름은 ..." + list.get(i).getPeopleNm());
			System.out.println("영어 이름은...." + list.get(i).getPeopleNmEn());
			System.out.println("직업은...." + list.get(i).getRepRoleNm());
			System.out.println("국적은...." + list.get(i).getCountry_no());
			System.out.println("생년월일은....." + list.get(i).getPerson_bdate());
			System.out.println("=============================================");
		}
//		}

	}
}




