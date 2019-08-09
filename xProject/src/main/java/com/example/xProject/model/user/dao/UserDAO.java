package com.example.xProject.model.user.dao;

import java.util.List;

import com.example.xProject.model.user.dto.UserDTO;

public interface UserDAO {
	public void join(UserDTO dto);
	public String idCheck(String userid);
	public UserDTO login(String userid);
	public List<UserDTO> userList(String search_option, String keyword, int start, int end);
	public UserDTO viewUser(String userid);
	public void update(UserDTO dto);
	public void dropout(String userid);
	public void deleteUser(String userid);
	public int countUsers(String search_option, String keyword);
}
