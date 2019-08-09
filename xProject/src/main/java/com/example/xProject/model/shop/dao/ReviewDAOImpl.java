package com.example.xProject.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.xProject.model.shop.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReviewDTO> reviewList(String good_id) {
		return sqlSession.selectList("review.list", good_id);
	}

	@Override
	public void writeReview(ReviewDTO dto) {
		sqlSession.insert("review.insert", dto);
	}
}
