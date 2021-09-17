package com.kosta.service;

import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kosta.dto.KobisMovieDTO;
import com.kosta.dto.KobisMovieResponseDTO;
import com.kosta.dto.RankResponseDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KobisMovieApi {	
//	private static String key;
//	
//	@Value("${key}")
//	public void setKey(String value) {
//		key = value;
//	}

	public KobisMovieResponseDTO requestMovie(String keyword) throws OpenAPIFault, Exception {
		// TODO Auto-generated method stub
		KobisOpenAPIRestService service = new KobisOpenAPIRestService("94b99a43bd6f0da35148917088a9dd62");
		
		String movieResponse = service.getMovieList(true, "1", "10", "", keyword, "", "", "", "", "", new String[0]);
		Gson gson = new Gson();		
		JsonObject obj = gson.fromJson(movieResponse, JsonObject.class);
		
		return gson.fromJson(obj.getAsJsonObject("movieListResult").toString(), KobisMovieResponseDTO.class);
	}
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
//		KobisMovieApi api=new KobisMovieApi();
//		api.requestMovie("");
//	}
//}
