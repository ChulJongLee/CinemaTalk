package com.kosta.service;

import java.util.List;

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
	public List<UserDTO> getlist() {
		// TODO Auto-generated method stub
		return mapper.getlist();
	}

	@Override
	public int insertuser(UserDTO dto) {
		// TODO Auto-generated method stub
		int result=mapper.insertuser(dto);

		return result;
	}

	@Override
	public UserDTO getUserDetail(int user_no) {
		// TODO Auto-generated method stub
		return mapper.getUserDetail(user_no);
	}

	@Override
	public int idcheck(UserDTO dto) {
		// TODO Auto-generated method stub
		return mapper.idcheck(dto);
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
