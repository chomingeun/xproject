package com.example.xProject.model.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.xProject.model.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void join(UserDTO dto) {
		sqlSession.insert("user.join", dto);
	}

	@Override
	public UserDTO login(String userid) {
		return sqlSession.selectOne("user.login", userid);
	}
	
	@Override
	public List<UserDTO> userList(String search_option, String keyword, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		List<UserDTO> list = sqlSession.selectList("user.userList", map);
		for(UserDTO dto : list) {
			String name = dto.getName();
			String userid = dto.getUserid();
			String email = dto.getEmail();
			String address = dto.getAddress();
			if(search_option.equals("name")) {
				if(name.indexOf(keyword) != -1) {
					name = name.replace(keyword, "<strong style='color:#33cc00;'>"+keyword+"</strong>");
				}
			}
			if(search_option.equals("userid")) {
				if(userid.indexOf(keyword) != -1) {
					userid = userid.replace(keyword, "<strong style='color:#33cc00;'>"+keyword+"</strong>");
				}
			}
			if(search_option.equals("email")) {
				if(email.indexOf(keyword) != -1) {
					email = email.replace(keyword, "<strong style='color:#33cc00;'>"+keyword+"</strong>");
				}
			}
			if(search_option.equals("address")) {
				if(address.indexOf(keyword) != -1) {
					address = address.replace(keyword, "<strong style='color:#33cc00;'>"+keyword+"</strong>");
				}
			}
			dto.setName(name);
			dto.setUserid(userid);
			dto.setEmail(email);
			dto.setAddress(address);
		}
		return list;
	}

	@Override
	public UserDTO viewUser(String userid) {
		return sqlSession.selectOne("user.view", userid);
	}

	@Override
	public void update(UserDTO dto) {
		sqlSession.update("user.update", dto);
	}

	@Override
	public void dropout(String userid) {
		sqlSession.delete("user.dropout", userid);
	}

	@Override
	public String idCheck(String userid) {
		return sqlSession.selectOne("user.id_check", userid);
	}

	@Override
	public void deleteUser(String userid) {
		sqlSession.delete("user.deleteUser", userid);
	}

	@Override
	public int countUsers(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("user.countUsers", map);
	}	
}
