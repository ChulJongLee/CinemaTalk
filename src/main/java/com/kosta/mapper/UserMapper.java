package com.kosta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.UserDTO;

@Mapper
public interface UserMapper {
	 
	public List<UserDTO> getlist();
	
	public int insertUser(UserDTO dto);
	
	public UserDTO getUserDetail(int user_no);

	public int idCheck(String user_id);
	
	public UserDTO loginCheck(UserDTO dto);

	public int modifyProfile(UserDTO dto);
	
	public int deleteUser(int user_no);

}
