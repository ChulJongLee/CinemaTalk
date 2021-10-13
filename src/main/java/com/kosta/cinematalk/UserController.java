package com.kosta.cinematalk;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			return "redirect:./login";
	}
	
	//로그인 페이지
	@RequestMapping("/login")
	public String userlogin() {
		
		return "userlogin";
	}


	//로그인 기능
	@PostMapping("/logincheck")
	public String loginCheck(@RequestParam String user_id, @RequestParam String user_pwd, HttpServletRequest request) { 
		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd);
		UserDTO userdto = service.loginCheck(dto);
		
		HttpSession session = request.getSession();
		if(userdto != null) {
			session.setAttribute("user", userdto);
		} else {
			session.setAttribute("user", null);
		}
		
		return "redirect:./cinematalk";
	}
 	
	@GetMapping("/logout")
	public String logOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:./cinematalk";
	}
	
	@PostMapping("/mypage/editprofile")
	public String editUserInfo(Model model, UserDTO dto) {
		
		model.addAttribute("dto", dto);
		
		return "edituserinfo";
	}

}
