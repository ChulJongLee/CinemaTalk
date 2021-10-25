package com.kosta.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kosta.dto.KmdbDTO.KmdbDTO2;
import com.kosta.dto.KmdbResponseDTO;
import com.kosta.dto.KobisDTO;
import com.kosta.dto.KobisResponseDTO;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.dto.PersonResponseDTO;
import com.kosta.dto.RequestDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class KobisAPIImple implements KobisAPI {
	private final SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");

	public List<KobisDTO> getMovieList(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());
		String listResponse = kobisService.getMovieList(true, rdto.getCurPage(), rdto.getItemPerPage(),
				rdto.getMovieNm(), "", "", "", "", "", "", new String[0]);
		if (listResponse.contains("errorCode")) {
			return new ArrayList<KobisDTO>();
		}
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(listResponse, JsonObject.class);
		KobisResponseDTO dto = gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisResponseDTO.class);
		List<KobisDTO> list = dto.getMovieList();
		return list;
	}

	public void deleteMovieList(List<KobisDTO> list) {
		for (int j = 0; j < list.size(); j++) {
			if (list.get(j).getMovieNmEn()
					.equals("Package Screening")) {
				list.remove(j);
				j--;
			}
		}
	}

	public List<KobisDTO> getMovieListPlus(List<KobisDTO> list, RequestDTO rdto) throws OpenAPIFault, Exception {
		List<KobisDTO> result = new ArrayList<KobisDTO>();
		KmdbAPI kmdbAPI = new KmdbAPIImple();

		for (int j = 0; j < list.size(); j++) {
			String director = "";
			KobisDTO kobis = list.get(j);
			rdto.setMovieCd(kobis.getMovieCd());
			KobisDTO detail = getMovieDetail(rdto);
			if (detail == null) {
				break;
			}else {
				if (detail.getDirectors().size() != 0) {
					String getname=detail.getDirectors().get(0).getPeopleNm();
					//감독명이 영문만 있을 경우 그대로 사용
					if(!getType(getname)) {
						director = getKor(getname);
					}else {
						director = getname;
					}
					String[] directornames = director.split(" ");
					director = directornames[0];

				}
				rdto.setMovieNm(detail.getMovieNm());
				rdto.setDirectorNm(director);

				kobis.setShowTm(detail.getShowTm());
				kobis.setActors(detail.getActors());
				kobis.setKeywordlist(detail.getKeywordlist());

				String openDt = "";
				if (detail.getOpenDt() != "")
					openDt = detail.getOpenDt();
				kobis.setOpenDt(openDt);
				String keywords = "";
				if (detail.getKeywords() != null)
					keywords = detail.getKeywords();
				kobis.setKeywords(keywords);
				String plotText = "";
				if (detail.getPlotText() != null)
					plotText = detail.getPlotText();
				kobis.setPlotText(plotText);
				String poster = "";
				if (kmdbAPI.requestMoviePoster(rdto) != null)
					poster = kmdbAPI.requestMoviePoster(rdto);
				kobis.setPoster(poster);
				String age="";
				String watchGrade = "19";
				if (detail.getAudits().size() != 0) {
					watchGrade = detail.getAudits().get(0).getWatchGradeNm();
					if (watchGrade.contains("전체관람가") || watchGrade.contains("모든") || watchGrade.contains("연소자관람가")
							|| watchGrade.contains("미성년자관람가"))
						age="0";
					else if (watchGrade.contains("12") || watchGrade.contains("중학생") || watchGrade.contains("국민학생"))
						age="12";
					else if (watchGrade.contains("15") || watchGrade.contains("고등"))
						age="15";
					else
						age="19";
				}else
					age="19";
				kobis.setWatchGradeNm(age);
				result.add(kobis);
			}
		}
		return result;

	}

	public int getMovieCount(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());
		String listResponse = kobisService.getMovieList(true, rdto.getCurPage(), rdto.getItemPerPage(),
				rdto.getMovieNm(), rdto.getDirectorNm(), rdto.getOpenStartDt(), rdto.getOpenEndDt(),
				rdto.getPrdtStartYear(), rdto.getPrdtEndYear(), rdto.getRepNationCd(), rdto.getMovieTypeCdArr());
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(listResponse, JsonObject.class);
		KobisResponseDTO dto = gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisResponseDTO.class);
		String totalcount = dto.getTotCnt();

		return Integer.parseInt(totalcount);
	}

	public KobisDTO getMovieDetail(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());
		KmdbAPI kmdbAPI = new KmdbAPIImple();
		String detailResponse = "";
		detailResponse = kobisService.getMovieInfo(true, rdto.getMovieCd());
		if (detailResponse.contains("errorCode")) {
			System.out.println("errorCode 발생");
			return null;
		}
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(detailResponse, JsonObject.class);
		KobisDTO detail = gson.fromJson(obj.getAsJsonObject("movieInfoResult").toString(), KobisResponseDTO.class)
				.getMovieInfo();
		String movieNm = detail.getMovieNm();
		String director = "";
		if (detail.getDirectors().size() != 0)
			director = detail.getDirectors().get(0).getPeopleNm();
		rdto.setMovieNm(movieNm);
		rdto.setDirectorNm(director);
		KmdbResponseDTO dto = kmdbAPI.requestMovieDetail(rdto);
		if (dto != null) {
			List<KmdbDTO2> kmdblist = dto.getData().get(0).getResult();
			detail.setPlotText(kmdblist.get(0).getPlots().getPlot().get(0).getPlotText());
			detail.setPoster(kmdbAPI.requestMoviePoster(rdto));
			String keywords = kmdblist.get(0).getKeywords();
			detail.setKeywords(keywords);
		}
		return detail;
	}

	@Override
	public List<KobisDTO> requestRank(RequestDTO rdto) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -1);
		String yesterday = DATE_FMT.format(cal.getTime());

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(rdto.getKobiskey());
		String dailyResponse = service.getDailyBoxOffice(true, yesterday, "", "", "", "");

		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(dailyResponse, JsonObject.class);
		List<KobisDTO> list = gson.fromJson(obj.getAsJsonObject("boxOfficeResult").toString(), KobisResponseDTO.class)
				.getDailyBoxOfficeList();
		return list;

	}

	@Override
	public List<KobisDTO> requestMovieList(RequestDTO rdto) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		List<KobisDTO> results = new ArrayList<KobisDTO>();

		rdto.setMovieNm(rdto.getKeyword());
				int totalcount = getMovieCount(rdto);		//이거 풀면 totalcount받아올때도 에러체크 해야함
				int lasttotalcount = 84192;
				
				// 일 3000회 제한
		//마지막 토탈 카운트 84192
//		int a = 1;
//			for (int i = a; i <= a; i++) {
//			for (int i = a; i <= a + 9; i++) {
//			for (int i = a; i <= a+28; i++) {
		for (int i = 1; i <= (totalcount-lasttotalcount / 100) + 1; i++) {
			rdto.setMovieNm(rdto.getKeyword());
			rdto.setCurPage(String.valueOf(i));
			List<KobisDTO> list = getMovieList(rdto);
			if (list.size() == 0) {
				System.out.println(i-1 + "번째 페이지에서 에러발생");
				return results;
			}
			deleteMovieList(list);
			List<KobisDTO> result=getMovieListPlus(list, rdto);

			if (list.size() == 0) {
				System.out.println(i-1 + "번째 페이지에서 에러발생");
				return results;
			}
			for (KobisDTO item : result) {
				results.add(item);
			}
			System.out.println(i + "번째-------결과값------------" + results.size());

		}
		return results;

	}

	public String getKor(String word) {
		String[] wordlist = word.split("");
		word = "";
		for (String item : wordlist) {
			if (item.charAt(0) > 122 || item.charAt(0) == 32 || (item.charAt(0) >= 48) && item.charAt(0) <= 57) {
				word += item;
			}
		}

		return word;
	}

	public boolean getType(String word) {
		//모두 영어이면 true 리턴하게 코드 짜야함
		boolean result=true;
		for(int i=0;i<word.length();i++) {
			int index = word.charAt(i);
			//영어와 띄어쓰기로만 이루어져있지 않으면 false
			if(!(index<=122&&index>=65)&&index!=32&&index!=45) {
				result=false;
				return result;
			}
		}
		return result;
	}


	@Override
	public List<PersonInfoDTO> requestPersonList(RequestDTO rdto) throws OpenAPIFault, Exception {
		List<PersonInfoDTO> result = new ArrayList<>();
		//입력 구간
		int a = 780;
		for(int i = 751 ; i < a+1 ; i++) {
			rdto.setCurPage(String.valueOf(i));
			List<PersonInfoDTO> list = getKobisPersonList(rdto);

			for(PersonInfoDTO item : list) {
				result.add(item);
			}
//			System.out.println("result...."+result.size());
		}

		return result;
	}

	@Override
	public List<PersonInfoDTO> getKobisPersonList(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());
		String peoplelistresult = kobisService.getPeopleList(true, rdto.getCurPage(), rdto.getItemPerPage(), rdto.getPeopleNm(), "");
		
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(peoplelistresult, JsonObject.class);
		PersonResponseDTO dto = gson.fromJson(obj.getAsJsonObject("peopleListResult").toString(), PersonResponseDTO.class);

		List<PersonInfoDTO> list = dto.getPeopleList();
		
		for(int i = 0 ; i < list.size() ; i++) {
			if(!list.get(i).getRepRoleNm().equals("배우") && !list.get(i).getRepRoleNm().equals("감독")) {
				list.remove(i);
				i--;
			}		
		}
		
		return list;
	}

	@Override
	public List<PersonInfoDTO> addPersonInfo(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());

		CrawlPersonInfo crawlPersonInfo = new CrawlPersonInfoImple();
		List<PersonInfoDTO> list = crawlPersonInfo.addPersonDetail(rdto);

		for(int i = 0 ; i < list.size() ; i++) {
			String srcresult = kobisService.getPeopleInfo(true, list.get(i).getPeopleCd());

			Gson gson = new Gson();
			JsonObject obj = gson.fromJson(srcresult, JsonObject.class);
			PersonResponseDTO prdto = gson.fromJson(obj.getAsJsonObject("peopleInfoResult").toString(), PersonResponseDTO.class);

			String peopleInfo = prdto.getPeopleInfo().toString();
			JsonObject obj2 = gson.fromJson(peopleInfo, JsonObject.class);
			PersonInfoDTO pidto = gson.fromJson(obj2.toString(), PersonInfoDTO.class);
			List<KobisDTO> filmolist = pidto.getFilmos();
			list.get(i).setFilmos(filmolist);

			String movieTitle = "";
			if(filmolist.size() != 0) {
				movieTitle = filmolist.get(0).getMovieNm();
			}

			String imglink = crawlPersonInfo.addPersonPic(list.get(i).getPeopleNm(), movieTitle);
			list.get(i).setPerson_pic(imglink);
		}
		return list;
	}
	
//	public void getTrailer(String movieNm) throws OpenAPIFault, Exception {
//		String url = "https://www.youtube.com/results?search_query="+movieNm+"+트레일러";
//		Connection conn = Jsoup.connect(url);
//		Document doc = conn.post();
//		Elements menu =  doc.select(".tbl_comm>tbody>tr");
//	}
}
