package com.kosta.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RequestDTO;
import com.kosta.mapper.PersonMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonServiceImple implements PersonService {

	private static String kobiskey;

	@Value("${kobiskey}")
	public void setKey(String value) {
		kobiskey = value;
	}

	@Autowired
	private PersonMapper mapper;

//	@Override
//	public List<PersonInfoDTO> getKobisPersonList() throws OpenAPIFault, Exception {
//
//		KobisOpenAPIRestService service = new KobisOpenAPIRestService(kobiskey);
//		String peoplelistresult = service.getPeopleList(true, "1", "100", actor, "");
//
//		Gson gson = new Gson();
//		JsonObject obj = gson.fromJson(peoplelistresult, JsonObject.class);
//		PersonResponseDTO dto = gson.fromJson(obj.getAsJsonObject("peopleListResult").toString(), PersonResponseDTO.class);
//		
//		List<PersonInfoDTO> list = dto.getPeopleList();
//		
//		for(int i = 0 ; i < list.size() ; i++) {
//			if(!list.get(i).getRepRoleNm().contains("배우") && !list.get(i).getRepRoleNm().contains("감독")) {
//				list.remove(i);
//				i--;
//			}			
//		}	
//
//		return list;
//	}

//	@Override
//	public List<PersonInfoDTO> addPersonDetail() throws OpenAPIFault, Exception {
//
//		List<PersonInfoDTO> list = getKobisPersonList();
//
//		String url = "https://www.kobis.or.kr/kobis/business/mast/peop/searchPeopleList.do";
//		Connection conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", actor);
//		Document doc = conn.post();	
//		int totalCount = Integer.parseInt(doc.select("em.fwb").get(0).text());
//
//		try {
//
//			//totalCount로 페이지 수 계산
//			for(int i = 1 ; i <= (totalCount / 10) + 1 ; i++) {
//
//				//반복 될 때 마다 호출을 새로 해줌
//				conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", actor);
//				doc = conn.data("curPage", String.valueOf(i)).post();
//
//				Elements menu =  doc.select(".tbl_comm>tbody>tr");
//
//				//한 페이지에 보여지는 데이터의 양
//				int num;
//				if(totalCount <= 10) {
//
//					num = totalCount;
//				} else {
//
//					if(i == (totalCount / 10) + 1) {
//
//						num = totalCount % 10;
//					} else {
//
//						num = 10;
//					}
//				}
//
//				//해당 페이지 데이터 수 만큼 반복
//				for(int j = 0 ; j < num ; j++) {
//
//					//list의 peopleCd와 일치할 때 까지 반복
//					for(int k = 0 ; k < list.size() ; k++) {
//
//						if(list.get(k).getPeopleCd().equals(menu.select("td").get(2).text())) {
//
//							list.get(k).setPerson_bdate(menu.select("td").get(5).text());
//							list.get(k).setNationality(menu.select("td").get(6).text());
//							break;
//						}//if
//
//					}//for(k)
//					menu = menu.next();
//				}//for(j)
//			}//for(i)
//		} catch (HttpStatusException e){
//			System.out.println(e);
//		} finally {
//
//			//			for(int i = 0 ; i < list.size(); i++) {
//			//
//			//				System.out.println("사람코드는....." + list.get(i).getPeopleCd());
//			//				System.out.println("이름은 ..." + list.get(i).getPeopleNm());
//			//				System.out.println("영어 이름은...." + list.get(i).getPeopleNmEn());
//			//				System.out.println("직업은...." + list.get(i).getRepRoleNm());
//			//				System.out.println("국적은...." + list.get(i).getCountry_no());
//			//				System.out.println("생년월일은....." + list.get(i).getPerson_bdate());
//			//				System.out.println("=============================");
//			//			}
//		}
//
//		return list;
//	}
//
//
//	@Override
//	public List<PersonInfoDTO> addPersonPic() throws OpenAPIFault, Exception {
//
//		List<PersonInfoDTO> list = addPersonDetail();
//
//		//인물을 검색하기 위해서 인물 코드 가져오고 이거를 가지로 인물의 필모를 가져옴. 인물 필모의 첫번째 자료의 제목을 가져온다
//		KobisOpenAPIRestService service = new KobisOpenAPIRestService(kobiskey);
//		for(int i = 0 ; i < list.size() ; i++) {
//
//			String srcresult = service.getPeopleInfo(true, list.get(i).getPeopleCd());
//
//			Gson gson = new Gson();
//			JsonObject obj = gson.fromJson(srcresult, JsonObject.class);
//			PersonResponseDTO dto = gson.fromJson(obj.getAsJsonObject("peopleInfoResult").toString(), PersonResponseDTO.class);
//
//			String peopleInfo = dto.getPeopleInfo().toString();
//
//			JsonObject obj2 = gson.fromJson(peopleInfo, JsonObject.class);
//			PersonInfoDTO dto2 = gson.fromJson(obj2.toString(), PersonInfoDTO.class);
//			List<KobisDTO> filmolist = dto2.getFilmos();
//
//			String movieTitle = filmolist.get(0).getMovieNm();
//
//			String url = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bkEw&pkid=68&os=&qvt=0&query=" + movieTitle + "%20%EC%B6%9C%EC%97%B0%EC%A7%84";
//			
//			Document doc = Jsoup.connect(url).get();
//			Elements menu = doc.select("div.title_box>strong.name._ellpisis>span._text");
//
//			String imglink = "";
//			for(int j = 0 ; j < menu.size() ; j++) {
//
//				//영문으로 시작하는 이름인 경우 대비 처리
//				String name = menu.get(j).text();
//				String[] words = list.get(i).getPeopleNm().split("");
//				String word = "";
//				for(String item : words) {
//					word += getType(item);
//				}
//				
//				if(name.contains(word)) {
//
//					imglink = doc.select(".thumb>img").get(j).attr("src");
//					
//					if(imglink.equals("https://ssl.pstatic.net/sstatic/keypage/outside/scui/weboriginal_new/im/no_img2.png") || imglink.equals("https://ssl.pstatic.net/sstatic/keypage/outside/scui/weboriginal_new/im/no_img.png")) {
//						imglink = "";
//					}//if
//					break;
//				}//if(contains)			
//			}//for(j)
//			list.get(i).setPerson_pic(imglink);
//		}//for(i)
//
////		for(int i = 0 ; i < list.size() ; i++) {
////			System.out.println(list.get(i).getPeopleCd().equals("")+"사람코드는....." + list.get(i).getPeopleCd());
////			System.out.println(list.get(i).getPeopleNm().equals("")+"이름은 ..." + list.get(i).getPeopleNm());
////			System.out.println(list.get(i).getPeopleNmEn().equals("")+"영어 이름은...." + list.get(i).getPeopleNmEn());
////			System.out.println(list.get(i).getRepRoleNm().equals("")+"직업은...." + list.get(i).getRepRoleNm());
////			System.out.println(list.get(i).getNationality().equals("")+"국적은...." + list.get(i).getNationality());
////			System.out.println(list.get(i).getPerson_bdate().equals("")+"생년월일은....." + list.get(i).getPerson_bdate());
////			System.out.println(list.get(i).getPerson_pic().equals("")+"사진....." + list.get(i).getPerson_pic());
////			System.out.println("=============================");
////		}
//		
//		return list;
//	}
//	
//	//이름에서 한글만 찾아서 반환하는 메소드
//	public String getType(String word) {
//		
//		String word2 = "";
//		for(int i = 0 ; i < word.length() ; i++) {
//			int index = word.charAt(i);
//			
//			if(index > 122) {
//				word2 += word.substring(i);
//			}//if
//		}//for
//		return word2;
//	}

	
	@Override
	public void insertPersonInfo(String keyword) throws OpenAPIFault, Exception {
		RequestDTO rdto = new RequestDTO();
		rdto.setKobiskey(kobiskey);
		rdto.setPeopleNm(keyword);
		KobisAPI kobisAPI=new KobisAPIImple();
		List<PersonInfoDTO> list = kobisAPI.addPersonInfo(rdto);
		mapper.insertPersonInfo(list);
		mapper.insertPersonDistinct(list);

		
	}



}




