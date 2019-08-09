package com.example.xProject.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.xProject.model.shop.dao.ReviewDAO;
import com.example.xProject.model.shop.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	ReviewDAO reviewDao;

	@Override
	public List<ReviewDTO> reviewList(String good_id) {
		return reviewDao.reviewList(good_id);
	}

	@Override
	public void writeReview(ReviewDTO dto) {
		reviewDao.writeReview(dto);
	}
}
