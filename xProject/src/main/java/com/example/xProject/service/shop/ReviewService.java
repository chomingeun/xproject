package com.example.xProject.service.shop;

import java.util.List;

import com.example.xProject.model.shop.dto.ReviewDTO;

public interface ReviewService {
	public List<ReviewDTO> reviewList(String good_id);
	public void writeReview(ReviewDTO dto);
}
