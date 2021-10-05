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
//System.out.println("getMovieList obj" + obj);
		KobisResponseDTO dto = gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisResponseDTO.class);
		List<KobisDTO> list = dto.getMovieList();
		return list;
	}

	public void deleteMovieList(List<KobisDTO> list) {
		for (int j = 0; j < list.size(); j++) {
			if (list.get(j).getMovieNmEn()
					.equals("Package Screening")/* ||list.get(j).getMovieNm().contains("작은영화영화제") */) {
				list.remove(j);
//				System.out.println(list.get(j).getOpenDt());
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
//System.out.println("detail..." + detail);
			if (detail == null) {
				return result;		//추가된 detail까지 result로 리턴
			}
			if (detail.getDirectors().size() != 0) {
				director = getKor(detail.getDirectors().get(0).getPeopleNm());
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
//System.out.println(poster);
			kobis.setPoster(poster);
			if (detail.getAudits().size() != 0) {
				String watchGrade = detail.getAudits().get(0).getWatchGradeNm();
				if (watchGrade.contains("전체관람가") || watchGrade.contains("모든") || watchGrade.contains("연소자관람가")
						|| watchGrade.contains("미성년자관람가"))
					kobis.setWatchGradeNm("0");
				else if (watchGrade.contains("12") || watchGrade.contains("중학생") || watchGrade.contains("국민학생"))
					kobis.setWatchGradeNm("12");
				else if (watchGrade.contains("15") || watchGrade.contains("고등"))
					kobis.setWatchGradeNm("15");
				else
					kobis.setWatchGradeNm("19");
			} else
				kobis.setWatchGradeNm("19");
			result.add(kobis);

		}
		return result;

	}

	public int getMovieCount(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());
//		service.getMovieList(isJson, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr)
		String listResponse = kobisService.getMovieList(true, rdto.getCurPage(), rdto.getItemPerPage(),
				rdto.getMovieNm(), rdto.getDirectorNm(), rdto.getOpenStartDt(), rdto.getOpenEndDt(),
				rdto.getPrdtStartYear(), rdto.getPrdtEndYear(), rdto.getRepNationCd(), rdto.getMovieTypeCdArr());
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(listResponse, JsonObject.class);
//		System.out.println("getMovieCount의 obj"+obj);
		KobisResponseDTO dto = gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisResponseDTO.class);
		String totalcount = dto.getTotCnt();

		return Integer.parseInt(totalcount);
	}

	public KobisDTO getMovieDetail(RequestDTO rdto) throws OpenAPIFault, Exception {
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(rdto.getKobiskey());
		KmdbAPI kmdbAPI = new KmdbAPIImple();
		String detailResponse = "";
		detailResponse = kobisService.getMovieInfo(true, rdto.getMovieCd());
//System.out.println("detailResponse...." + detailResponse);
		if (detailResponse.contains("errorCode")) {
			return null;
		}
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(detailResponse, JsonObject.class);
//		System.out.println("서비스에서 디테일의 obj"+obj);
		KobisDTO detail = gson.fromJson(obj.getAsJsonObject("movieInfoResult").toString(), KobisResponseDTO.class)
				.getMovieInfo();
		String movieNm = detail.getMovieNm();
//		System.out.println(movieNm);
		movieNm = getKor(movieNm);
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
//			System.out.println(keywords);
			detail.setKeywords(keywords);
//			String[] keywordlist = keywords.split(",");
//			detail.setKeywordlist(keywordlist);
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
		List<KobisDTO> result = new ArrayList<KobisDTO>();

		rdto.setMovieNm(rdto.getKeyword());
//		int totalcount = getMovieCount(rdto);		//이거 풀면 totalcount받아올때도 에러체크 해야함
		// 일 3000회 제한
		int a = 266; // 237 할 차례
//		for (int i = a; i <= a; i++) {
//		for (int i = a; i <= a + 1; i++) {
		for (int i = a; i <= a+28; i++) {
//		for (int i = 1; i <= (totalcount / 100) + 1; i++) {
			rdto.setMovieNm(rdto.getKeyword());
			rdto.setCurPage(String.valueOf(i));
			List<KobisDTO> list = getMovieList(rdto);
			if (list.size() == 0) {
				System.out.println(i + "번째 페이지에서 에러발생");
				return result;
			}
			deleteMovieList(list);
			getMovieListPlus(list, rdto);
			if (list.size() == 0) {
				System.out.println(i + "번째 페이지에서 에러발생");
				return result;
			}
			for (KobisDTO item : list) {
				result.add(item);
			}
			System.out.println(i + "번째-------결과값------------" + result.size());

		}
		return result;

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

}
