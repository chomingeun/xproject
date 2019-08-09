package com.example.xProject.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.xProject.model.user.dao.UserDAO;
import com.example.xProject.model.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserDAO userDao;

	@Override
	public void join(UserDTO dto) {
		userDao.join(dto);
	}

	@Override
	public UserDTO login(String userid) {
		return userDao.login(userid);
	}
	
	@Override
	public List<UserDTO> userList(String search_option, String keyword, int start, int end) {
		return userDao.userList(search_option, keyword, start, end);
	}

	@Override
	public UserDTO viewUser(String userid) {
		return userDao.viewUser(userid);
	}

	@Override
	public void update(UserDTO dto) {
		userDao.update(dto);
	}

	@Override
	public void dropout(String userid) {
		userDao.dropout(userid);
	}

	@Override
	public String idCheck(String userid) {
		return userDao.idCheck(userid);
	}

	@Override
	public void deleteUser(String userid) {
		userDao.deleteUser(userid);
	}

	@Override
	public int countUsers(String search_option, String keyword) {
		return userDao.countUsers(search_option,keyword);
	}
}
