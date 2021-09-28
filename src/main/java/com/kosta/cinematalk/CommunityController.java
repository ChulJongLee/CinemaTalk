package com.kosta.cinematalk;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.dto.ReviewDTO;
import com.kosta.service.CommunityService;
import com.kosta.service.CommunityServiceImple;

@Controller
public class CommunityController {

	@Resource(name = "reviewservice")
	private CommunityService service;
	
	@RequestMapping("/reviewlist")
	public String reviewBoard(Model model) {
		
		List<ReviewDTO> reviewlist = service.reviewList();
		model.addAttribute("reviewlist", reviewlist);
		
		return "reviewlist";
	}

}
