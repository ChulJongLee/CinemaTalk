package com.kosta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kosta.dto.UserDTO;
import com.kosta.mapper.UserMapper;


@Service("userService")
public class UserServiceImple implements UserService {

	@Autowired @Qualifier("userMapper")
	private UserMapper mapper;

	@Override
	public int insertUser(UserDTO dto) {

		int result = mapper.insertUser(dto);

		return result;
	}

	@Override
	public UserDTO getUserDetail(int user_no) {
		
		return mapper.getUserDetail(user_no);
	}

	@Override
	public int idCheck(String user_id) {
		
		return mapper.idCheck(user_id);
	}

	@Override
	public UserDTO loginCheck(UserDTO dto) {

		return mapper.loginCheck(dto);
	}

	@Override
	public int modifyProfile(UserDTO dto) {

		return mapper.modifyProfile(dto);
	}

	@Override
	public int deleteUser(int user_no) {
		
		return mapper.deleteUser(user_no);
	}
}
