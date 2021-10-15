package com.kosta.cinematalk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.dto.KobisDTO;
import com.kosta.dto.PageBlock;
import com.kosta.dto.PersonInfoDTO;
import com.kosta.service.PersonService;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PersonInfoController {
	
	private final PersonService personService;
	
	@GetMapping("/personsrc")
	public String srcPerson() {
		return "/view.jsp?page=personsearch";
	}
	
	@GetMapping("/personsrcresult")
	public String srcPersonResult() throws OpenAPIFault, Exception {

		String keyword = "";
		personService.insertPersonInfo(keyword);

		return "/view.jsp?page=personsearchresult";
	}
	
	@GetMapping("/personinfo/{peopleCd}")
	public String getpersonInfo(@PathVariable String peopleCd, @RequestParam(required = false, defaultValue = "1") int currPage, Model model) {
		
		//인물 정보
		PersonInfoDTO pidto = personService.getPersonInfo(peopleCd);
		
		//인물 필모그래피
		int totalCount = personService.getFilmoNum(peopleCd);
		int pageSize = 20;
		int blockSize = 5;
		PageBlock page = new PageBlock(currPage, totalCount, pageSize, blockSize);
		
		List<KobisDTO> list = personService.getFilmoList(peopleCd, page.getStartRow() - 1, pageSize);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPoster().equals("")) {
				list.get(i).setPoster("/resources/img/poster_noimg.png");
			}
		}
		
		//관련 인물
		String[] movieCd = personService.getPersonFilmo(peopleCd);
		ArrayList<PersonInfoDTO> list2 = new ArrayList<>();
		for(String item : movieCd) {
			Map<String, String> hm = new HashMap<String, String>();
			hm.put("peopleCd", peopleCd);
			hm.put("movieCd", item);
			String[] personresult = personService.getRealatedPerson(hm);

			for(int i = 0; i < personresult.length; i++) {
				PersonInfoDTO pidto2 = personService.getPersonInfo(personresult[i]);
				list2.add(pidto2);
			}			
		}
		
		for(int i = 0; i < list2.size(); i++) {
			for(int j = i + 1; j < list2.size(); j++) {
				if(list2.get(i).getPeopleCd().equals(list2.get(j).getPeopleCd())) {
					list2.remove(j);
					j--;
				}
			}
		}

		model.addAttribute("dto", pidto);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("page", page);
		return "/view.jsp?page=personinfo";
	}
}
