package com.kosta.service;

import java.util.List;

import org.jsoup.Connection;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kosta.dto.KobisDTO;
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
	public List<PersonInfoDTO> personDetail() throws OpenAPIFault, Exception {

		List<PersonInfoDTO> list = getKobisPersonList();

		String url = "https://www.kobis.or.kr/kobis/business/mast/peop/searchPeopleList.do";
		Connection conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", actor);
		Document doc = conn.post();	
		int totalCount = Integer.parseInt(doc.select("em.fwb").get(0).text());

		try {

			//totalCount로 페이지 수 계산
			for(int i = 1 ; i <= (totalCount / 10) + 1 ; i++) {

				//반복 될 때 마다 호출을 새로 해줘서 ddos로 느껴지지 않게
				conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", actor);
				doc = conn.data("curPage", String.valueOf(i)).post();

				Elements menu =  doc.select(".tbl_comm>tbody>tr");

				//한 페이지에 보여지는 데이터의 양
				int su;
				if(totalCount <= 10) {

					su = totalCount;
				} else {

					if(i == (totalCount / 10) + 1) {

						su = totalCount % 10;
					} else {

						su = 10;
					}
				}

				//해당 페이지 데이터 수 만큼 반복
				for(int j = 0 ; j < su ; j++) {

					//list의 peopleCd와 일치할 때 까지 반복
					for(int k = 0 ; k < list.size() ; k++) {

						if(list.get(k).getPeopleCd().equals(menu.select("td").get(2).text())) {

							list.get(k).setPerson_bdate(menu.select("td").get(5).text());
							list.get(k).setNationality(menu.select("td").get(6).text());
							break;
						}//if

					}//for(k)
					menu = menu.next();
				}//for(j)
			}//for(i)
		} catch (HttpStatusException e){
			System.out.println(e);
		} finally {

			//			for(int i = 0 ; i < list.size(); i++) {
			//
			//				System.out.println("사람코드는....." + list.get(i).getPeopleCd());
			//				System.out.println("이름은 ..." + list.get(i).getPeopleNm());
			//				System.out.println("영어 이름은...." + list.get(i).getPeopleNmEn());
			//				System.out.println("직업은...." + list.get(i).getRepRoleNm());
			//				System.out.println("국적은...." + list.get(i).getCountry_no());
			//				System.out.println("생년월일은....." + list.get(i).getPerson_bdate());
			//				System.out.println("=============================");
			//			}
		}

		return list;
	}


	@Override
	public void getPersonPic() throws OpenAPIFault, Exception {

		List<PersonInfoDTO> list = personDetail();

		//인물을 검색하기 위해서 인물 코드 가져오고 이거를 가지로 인물의 필모를 가져옴. 인물 필모의 첫번째 자료의 제목을 가져온다
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		for(int i = 0 ; i < list.size() ; i++) {

			String srcresult = service.getPeopleInfo(true, list.get(i).getPeopleCd());

			Gson gson = new Gson();
			JsonObject obj = gson.fromJson(srcresult, JsonObject.class);
			PersonResponseDTO dto = gson.fromJson(obj.getAsJsonObject("peopleInfoResult").toString(), PersonResponseDTO.class);

			String peopleInfo = dto.getPeopleInfo().toString();

			JsonObject obj2 = gson.fromJson(peopleInfo, JsonObject.class);
			PersonInfoDTO dto2 = gson.fromJson(obj2.toString(), PersonInfoDTO.class);
			List<KobisDTO> filmolist = dto2.getFilmos();

			String movieTitle = filmolist.get(0).getMovieNm();

			String url = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bkEw&pkid=68&os=&qvt=0&query=" + movieTitle + "%20%EC%B6%9C%EC%97%B0%EC%A7%84";

			Document doc = Jsoup.connect(url).get();
			Elements menu = doc.select("div.title_box>strong.name._ellpisis>span._text");

			String imglink = "";
			for(int j = 0 ; j < menu.size() ; j++) {

				String name = menu.get(j).text();

				if(list.get(i).getPeopleNm().equals(name)) {

					imglink = doc.select(".thumb>img").get(j).attr("src");
					list.get(i).setPerson_pic(imglink);
					break;
				}//if
			}//for(j)
		}//for(i)

		for(int i = 0 ; i < list.size() ; i++) {
			System.out.println("사람코드는....." + list.get(i).getPeopleCd());
			System.out.println("이름은 ..." + list.get(i).getPeopleNm());
			System.out.println("영어 이름은...." + list.get(i).getPeopleNmEn());
			System.out.println("직업은...." + list.get(i).getRepRoleNm());
			System.out.println("국적은...." + list.get(i).getNationality());
			System.out.println("생년월일은....." + list.get(i).getPerson_bdate());
			System.out.println("사진....." + list.get(i).getPerson_pic());
			System.out.println("=============================");
		}
	}

}




