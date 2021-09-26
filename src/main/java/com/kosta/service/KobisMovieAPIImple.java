package com.kosta.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kosta.dto.KobisResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KobisMovieAPIImple implements KobisMovieAPI {
	private static String key;

	@Value("${key}")
	public void setKey(String value) {
		key = value;
	}
	@Override
	public KobisResponseDTO requestMovieList(String keyword) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
//		service.getMovieList(isJson, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr)
		String listResponse = service.getMovieList(true, "1", "30", keyword, "", "", "", "", "", "", new String[0]);
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(listResponse, JsonObject.class);
		System.out.println("서비스에서 리스트의 obj"+obj);
		return gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisResponseDTO.class);
	}

	@Override
	public KobisResponseDTO requestMovieDetail(String movieCdList) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		String detailResponse = "";
//		String[] movieCdListTest= {"20183782"};

//		for (int i = 0; i < movieCdList.length; i++) {
			KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

			detailResponse = service.getMovieInfo(true, movieCdList);
//		}
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(detailResponse, JsonObject.class);
//		System.out.println("서비스에서 디테일의 obj"+obj);
		return gson.fromJson(obj.getAsJsonObject("movieInfoResult").toString(), KobisResponseDTO.class);

//	}

//	public KobisResponseDTO requestMovieDetail(String moviecd) {
//		
//	}

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
}
