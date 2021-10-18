package com.kosta.service;

import java.util.List;

import com.kosta.dto.UserDTO;
 
public interface UserService {
	
	//회원가입
	public int insertUser(UserDTO dto);
	//회원정보
	public UserDTO getUserDetail(int user_no);
	//아이디 중복체크
	public int idCheck(String user_id);
	//로그인
	public UserDTO loginCheck(UserDTO dto);
	//회원 정보 수정
	public int modifyProfile(UserDTO dto);
	//회원삭제
	public int deleteUser(int userNo);
}
