package com.kosta.service;

import java.util.List;

import org.openqa.selenium.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kosta.dto.UserDTO;
import com.kosta.mapper.UserMapper;


@Service("userservice")
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
	public int deleteuser(int user_no) {
		// TODO Auto-generated method stub
		return mapper.deleteuser(user_no);
	}

	@Override
	public UserDTO userdetail(int user_no) {
		// TODO Auto-generated method stub
		return mapper.userdetail(user_no);
	}

	@Override
	public void updateuser(UserDTO dto) {
		// TODO Auto-generated method stub
		mapper.updateuser(dto);

	}

	@Override
	public int idcheck(UserDTO dto) {
		// TODO Auto-generated method stub
		return mapper.idcheck(dto);
	}

	@Override
	public UserDTO userlogin(UserDTO dto) {
		// TODO Auto-generated method stub
		return mapper.userlogin(dto);
	}

}
