package com.kosta.service;

import java.util.List;

import org.jsoup.Connection;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.RequestDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class CrawlPersonInfoImple implements CrawlPersonInfo {

	@Override
	public List<PersonInfoDTO> addPersonDetail(RequestDTO rdto) throws OpenAPIFault, Exception {

		KobisAPI kobisAPI = new KobisAPIImple();
		List<PersonInfoDTO> list = kobisAPI.requestPersonList(rdto);

		String url = "https://www.kobis.or.kr/kobis/business/mast/peop/searchPeopleList.do";
		Connection conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", rdto.getPeopleNm());
		Document doc = conn.post();	

		int totalCount = Integer.parseInt(doc.select("em.fwb").get(0).text().replace(",", ""));
		System.out.println("totalcount...."+totalCount);
		try {

			//totalCount로 페이지 수 계산(totalCount / 10) + 1
			for(int i = 1; i <= (totalCount / 10) + 1; i++) {

				//반복 될 때 마다 호출을 새로 해줌
				conn = Jsoup.connect(url).data("sRoleCd", "320401").data("sRoleCd", "320301").data("sPeopleNm", rdto.getPeopleNm());
				doc = conn.data("curPage", String.valueOf(i)).post();

				Elements menu =  doc.select(".tbl_comm>tbody>tr");

				//한 페이지에 보여지는 데이터의 양
				int num;
				if(totalCount <= 10) {

					num = totalCount;
				} else {

					if(i == (totalCount / 10) + 1) {

						num = totalCount % 10;
					} else {

						num = 10;
					}
				}

				//해당 페이지 데이터 수 만큼 반복
				for(int j = 0; j < num; j++) {

					//list의 peopleCd와 일치할 때 까지 반복
					for(int k = 0; k < list.size(); k++) {
						
						String person_bdate = "";
						String nationality = "";
						
						if(list.get(k).getPeopleCd().equals(menu.select("td").get(2).text())) {
							
							if(menu.select("td").get(5).text() != null) {
								person_bdate = menu.select("td").get(5).text();
							} else {
								person_bdate = "";
							}
							
							if(menu.select("td").get(6).text() != null) {
								nationality = menu.select("td").get(6).text();
							} else {
								nationality = "";
							}
							
							list.get(k).setPerson_bdate(person_bdate);
							list.get(k).setNationality(nationality);
							break;
						}//if
					}//for(k)
					menu = menu.next();
				}//for(j)
			}//for(i)
		} catch (HttpStatusException e){
			System.out.println(e);
		} 

		return list;
	}

	@Override
	public String addPersonPic(String peopleNm, String movieTitle) throws OpenAPIFault, Exception {

		//특수문자 지우기
		String[] wordarr = movieTitle.split("");
		String title = "";
		for(String item : wordarr) {
			title += getWord(item);
		}

		String url = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bkEw&pkid=68&os=&qvt=0&query=%EC%98%81%ED%99%94%20" + title + "%20%EC%B6%9C%EC%97%B0%EC%A7%84";

		Document doc = Jsoup.connect(url).get();
		Elements menu = doc.select("div.title_box>strong.name._ellpisis>span._text");

		String imglink = "";

		for(int i = 0; i < menu.size(); i++) {

			//영문으로 시작하는 이름인 경우 대비 처리
			String name = menu.get(i).text();
			String[] words = peopleNm.split("");
			String word = "";
			for(String item : words) {
				word += getType(item);
			}

			if(name.contains(word)) {

				imglink = doc.select(".thumb>img").get(i).attr("src");

				if(imglink.equals("https://ssl.pstatic.net/sstatic/keypage/outside/scui/weboriginal_new/im/no_img2.png") || imglink.equals("https://ssl.pstatic.net/sstatic/keypage/outside/scui/weboriginal_new/im/no_img.png")) {
					imglink = "";
				}//if
				break;
			}//if(contains)			
		}//for(i)

		return imglink;
	}

	public String getWord(String word) {
		
		String word2 = "";
		for(int i = 0; i < word.length(); i++) {
			int index = word.charAt(i);

			if(index >= 65) {
				word2 += word.substring(i);
			}//if
		}//for
		return word2;
	}
	
	
	//이름에서 한글만 찾아서 반환
	public String getType(String word) {

		String word2 = "";
		for(int i = 0; i < word.length(); i++) {
			int index = word.charAt(i);

			if(index > 122) {
				word2 += word.substring(i);
			}//if
		}//for
		return word2;
	}





}
