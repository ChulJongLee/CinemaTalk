package com.kosta.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kosta.dto.KmdbResponseDTO;
import com.kosta.dto.KobisDTO;
import com.kosta.dto.KobisResponseDTO;
import com.kosta.dto.KmdbDTO.KmdbDTO2;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieServiceImple implements MovieService {
	private static String kobiskey;
	private static String kmdbkey;
	private final SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");

	@Value("${kobiskey}")
	public void setKobiskey(String value) {
		kobiskey = value;
	}
	@Value("${kmdbkey}")
	public void setKmdbkey(String value) {
		kmdbkey = value;
	}
	
	@Override
	public List<KobisDTO> requestMovieList(String keyword) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(kobiskey);
//		service.getMovieList(isJson, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr)
		String listResponse = service.getMovieList(true, "1", "100", keyword, "", "", "", "", "", "", new String[0]);
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(listResponse, JsonObject.class);
		System.out.println("서비스에서 리스트의 obj"+obj);
		KobisResponseDTO dto=gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisResponseDTO.class);
		String totalcount=dto.getTotCnt();
		System.out.println("총 갯수 : "+totalcount);
		List<KobisDTO> list = dto.getMovieList();
		for (Iterator<KobisDTO> it = list.iterator(); it.hasNext();) {
			KobisDTO str = it.next();
			if (str.getMovieNmEn().equals("Package Screening"))
				it.remove();
			if (str.getOpenDt().equals(""))
				it.remove();
		}
		for (int i = 0; i < list.size(); i++) {
			String director = "";
			KobisDTO detail = requestMovieDetail(list.get(i).getMovieCd());
			if (detail.getDirectors().size() != 0)
				director = detail.getDirectors().get(0).getPeopleNm();
			if (requestMoviePoster(detail.getMovieNm(), director) != "")
				list.get(i).setPoster(requestMoviePoster(detail.getMovieNm(), director));
			list.get(i).setShowTm(detail.getShowTm());
			list.get(i).setActors(detail.getActors());
			list.get(i).setPlotText(detail.getPlotText());
			list.get(i).setKeywordlist(detail.getKeywordlist());
			list.get(i).setWatchGradeNm(detail.getAudits().get(0).getWatchGradeNm());
		}
		
		return list;
	}

	@Override
	public KobisDTO requestMovieDetail(String movieCdList) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		String detailResponse = "";
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(kobiskey);
		
		detailResponse = service.getMovieInfo(true, movieCdList);
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(detailResponse, JsonObject.class);
		System.out.println("서비스에서 디테일의 obj"+obj);
		KobisDTO detail = gson.fromJson(obj.getAsJsonObject("movieInfoResult").toString(), KobisResponseDTO.class).getMovieInfo();
		
		String movieNm = detail.getMovieNm();
		String director = "";
		if (detail.getDirectors().size() != 0)
			director = detail.getDirectors().get(0).getPeopleNm();
		
		KmdbResponseDTO dto = requestMovieDetail("", movieNm, "", director);
		if (dto != null) {
			// 줄거리 받아오기
			List<KmdbDTO2> kmdblist = dto.getData().get(0).getResult();
			detail.setPlotText(kmdblist.get(0).getPlots().getPlot().get(0).getPlotText());

			// 포스터 받아오기
			detail.setPoster(requestMoviePoster(movieNm, director));

			// 키워드 받아오기
			String keywords = kmdblist.get(0).getKeywords();
			String[] keywordlist = keywords.split(",");
			detail.setKeywordlist(keywordlist);
		}
		
		
		
		return detail;



	}

//		JSONObject responseBody = new JSONObject(movieResponse);
//		System.out.println(responseBody);
//		
//		JSONObject movieListResult = responseBody.getJSONObject("movieListResult");
//		JSONArray movieList = movieListResult.getJSONArray("movieList");
//		Iterator<Object> iter = movieList.iterator();
//		ArrayList<KobisMovieDTO> list = new ArrayList<KobisMovieDTO>();
//		while (iter.hasNext()) {
//			JSONObject movielist = (JSONObject) iter.next();
//			KobisMovieDTO dto = new KobisMovieDTO(movielist.get("movieCd").toString()
//					, movielist.get("movieNm").toString()
//					, movielist.get("movieNmEn").toString()
//					, movielist.get("prdtYear").toString()
//					, movielist.get("openDt").toString()
//					, movielist.get("typeNm").toString()
//					, movielist.get("repNationNm").toString()
//					, movielist.get("repGenreNm").toString()
//					, movielist.get("directors").toString()
//					, movielist.get("companys").toString());
//			list.add(dto);
//		}
//		return list;
//	}

//	public static void main(String[] args) throws OpenAPIFault, Exception {
//		KobisMovieAPIImple api=new KobisMovieAPIImple();
//		String[] movieCdList= {"", ""};
////		api.requestMovieCode("");
//		api.requestMovieDetail(movieCdList);
//	}
	@Override
	public KmdbResponseDTO requestMovieDetail(String movieCd, String movieNm, String showTm, String director)
			throws IOException {
		// TODO Auto-generated method stub
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		movieNm = movieNm.replaceAll(match, "^").replace(" ", "").replace("3D", "");
		director = director.replaceAll(match, "").replace(" ", "^");

		String urladdr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey="
				+ kmdbkey + "&detail=Y&query=" + movieNm + "&director=" + director;

		URL url = new URL(urladdr);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
//		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader br;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		br.close();
		conn.disconnect();
//		System.out.println("sb......" + sb.toString());

		Gson gson = new Gson();
		KmdbResponseDTO result = gson.fromJson(sb.toString(), KmdbResponseDTO.class);
		if (result.getTotalCount() != 0)
			return result;
		else
			return null;

	}

	@Override
	public String requestMoviePoster(String movieNm, String director) throws MalformedURLException, IOException {
		// TODO Auto-generated method stub
		String poster = "";
		if (requestMovieDetail("", movieNm, "", director) != null) {
			if (requestMovieDetail("", movieNm, "", director).getData().get(0).getResult().size() != 0) {
				String posters = requestMovieDetail("", movieNm, "", director).getData().get(0).getResult().get(0)
						.getPosters();
				String posterlist[] = posters.replace("|", ",").split(",");
				poster = posterlist[0];
			}
		}
		return poster;
	}
	@Override
	public List<KobisDTO> requestRank() throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -1);
		String yesterday = DATE_FMT.format(cal.getTime());

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(kobiskey);
		String dailyResponse = service.getDailyBoxOffice(true, yesterday, "", "", "", "");

		Gson gson = new Gson();		
		JsonObject obj = gson.fromJson(dailyResponse, JsonObject.class);
		List<KobisDTO> list=gson.fromJson(obj.getAsJsonObject("boxOfficeResult").toString(), KobisResponseDTO.class).getDailyBoxOfficeList();
		return list;
		
	}
}
