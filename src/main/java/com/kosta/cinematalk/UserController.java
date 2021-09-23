package com.kosta.cinematalk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	
	@GetMapping("/userjoin")
	public String goJoinForm() {
		return "userjoin";
	}
	
	@GetMapping("/userRegister")
	public String userRegister(UserDTO dto) {
		System.out.println("user"+dto);
		return "userLogin";
	}

}
