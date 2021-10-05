package com.kosta.cinematalk;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.Alert;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.dto.UserDTO;
import com.kosta.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor 
public class UserController {
	
	@Resource(name="userservice")
	private UserService service;
	
	//아이디 중복 체크
	@ResponseBody
	@PostMapping("/idcheck")
	public int idcheck(UserDTO dto) {
		return service.idcheck(dto);
	}
	
	//회원가입 페이지
	@GetMapping("/userjoin")
	public String goJoinForm() 
	{	
		return "userjoin";
	}
	
	//회원가입 기능
	@PostMapping("/userRegister")
	public String userRegister(UserDTO dto) 
	{	
			int result= service.idcheck(dto);
			try {
				if (result == 1) {
					return "userRegister";
				}else if(result == 0){
					service.insertuser(dto);
				}
			}catch(Exception e)
			{
				System.out.println(e);
			}
			return "redirect:./userlogin";
	}
	
//	//로그인 페이지
//	@RequestMapping("/userlogin")
//	public String userlogin() {
//		return "userlogin";
//	}
//	
//	//로그인 기능
//	@GetMapping("/logincheck")
//	public ModelAndView logincheck(@ModelAttribute UserDTO dto, HttpSession session) {
//		boolean result dto= service.userlogin(dto)
//	}
	
	

}
