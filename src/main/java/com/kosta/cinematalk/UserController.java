package com.kosta.cinematalk;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kosta.dto.UserDTO;
import com.kosta.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	
	@Resource(name="userservice")
	private UserService service;
	
	@GetMapping("/userjoin")
	public String goJoinForm() 
	{	
		return "userjoin";
	}
	
	@PostMapping("/userRegister")
	public String userRegister(UserDTO dto) 
	{	
		int result= service.insertuser(dto);
		return "userlogin";
	}

}
