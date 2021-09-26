package com.kosta.cinematalk;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KmdbDTO.KmdbDTO2;
import com.kosta.service.KmdbAPI;

import lombok.RequiredArgsConstructor; 

@Controller
@RequiredArgsConstructor
public class KmdbMovieController { 
	private final KmdbAPI kmdbAPI;
	
	
	@GetMapping("/searchposter")
	public String searchposter() {
		return "searchposter";
	}
	
	
	@PostMapping("/searchposterresult")
	public String main(@RequestParam String keyword, Model model) throws IOException { 
		List<KmdbDTO2> list=kmdbAPI.requestMovieDetail("", keyword, "", "첸 카이거").getData().get(0).getResult();
		model.addAttribute("list", list);
		
		String posters=kmdbAPI.requestMovieDetail("", keyword, "", "첸 카이거").getData().get(0).getResult().get(0).getPosters();
		String[] posterlist=posters.replace("|", ",").split(",");
		model.addAttribute("poster", posterlist[0]);
		return "searchposterresult";
	} 
}