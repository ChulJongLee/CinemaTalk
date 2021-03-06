package com.kosta.cinematalk;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@Resource(name="userService")
	private UserService service;

	//회원가입 페이지
	@GetMapping("/userjoin")
	public String goJoinForm() {	
		return "/view.jsp?page=user/userjoin";
	}

	//id중복체크
	@ResponseBody
	@PostMapping("/idCheck")
	public Map<String, Object> findId(@RequestParam String user_id) {
		
		Map<String, Object> hm = new HashMap<>();
		int count = service.idCheck(user_id);
		hm.put("cnt", count);
		return hm;
	}
	
	//회원가입 기능
	@PostMapping("/userregister")
	public String userRegister(@ModelAttribute UserDTO dto) {	

		int result = service.insertUser(dto);

		if(result > 0) {
			return "/view.jsp?page=user/userregistered";
		} else {
			return "/";
		}
	}

	//로그인 페이지
	@RequestMapping("/login")
	public String userlogin() {

		return "/view.jsp?page=user/userlogin";
	}


	//로그인 기능
	@PostMapping("/logincheck")
	public String loginCheck(@RequestParam String user_id, @RequestParam String user_pwd, HttpSession session) { 
		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd);
		UserDTO userdto = service.loginCheck(dto);

		session.removeAttribute("user");

		if(userdto != null) {
			session.setAttribute("user", userdto);
			session.setMaxInactiveInterval(300);
			return "redirect:/";
		} else {
			return "/view.jsp?page=user/userloginfail";
		}
		
	}

	//로그아웃기능
	@GetMapping("/logout")
	public String logOut(HttpSession session) {	
		session.invalidate();

		return "redirect:/";
	}

	//회원 정보
	@GetMapping("/mypage/userinfo")
	public String getUserDetail(HttpSession session) {
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		if(dto == null)
		{
			return "redirect:/login";
			
		} else {
			UserDTO dto2 = service.getUserDetail(dto.getUser_no());
			
			if(dto2 != null) {
				session.removeAttribute("user");
				session.setAttribute("user", dto2);
			}
			
			return "/view.jsp?page=user/userdetail";
		}

	}

	//회원 탈퇴
	@GetMapping("/mypage/deleteuser")
	public String deleteUser(HttpSession session, Model model) {
		
		UserDTO dto = (UserDTO)session.getAttribute("user");
		int user_no = dto.getUser_no();
		
		service.deleteCommBoard(user_no);
		service.deleteMovieRating(user_no);
		service.deleteCommLikeHate(user_no);
		int result = service.deleteUser(user_no);

		model.addAttribute("result", result);
		session.invalidate();

		return "/view.jsp?page=user/userdelete";
	}

	//회원 정보 수정
	@GetMapping("/mypage/modifyprofileform")
	public String editUserInfoForm(HttpSession session) {
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		if(dto != null) {
			return "/view.jsp?page=user/usermodifyform";
		} else {
			return "redirect:/login";
		}
		
	}

	//회원 정보 수정 결과
	@PostMapping("/modifyprofileresult")
	public String modifyProfileResult(HttpSession session, @ModelAttribute UserDTO dto, Model model) {
		UserDTO userdto = (UserDTO)session.getAttribute("user");
		
		if(userdto != null) {
			int result = service.modifyProfile(dto);
			model.addAttribute("result", result);

			return "/view.jsp?page=user/usermodifyresult";
		} else {
			return "redirect:/login";
		}
	}

}
