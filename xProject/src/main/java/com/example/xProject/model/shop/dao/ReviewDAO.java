package com.example.xProject.model.shop.dao;

import java.util.List;

import com.example.xProject.model.shop.dto.ReviewDTO;

public interface ReviewDAO {
	public List<ReviewDTO> reviewList(String good_id);
	public void writeReview(ReviewDTO dto);
}
