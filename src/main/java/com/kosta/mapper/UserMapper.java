package com.kosta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.dto.UserDTO;

@Mapper
public interface UserMapper {
	 
	public List<UserDTO> getlist();
	
	public int insertuser(UserDTO dto);
	
	public int deleteuser(int userNo);
	
	public UserDTO userdetail(int userNo);
	
	public void updateuser(UserDTO dto);
	
	public int idcheck(UserDTO dto);

}
