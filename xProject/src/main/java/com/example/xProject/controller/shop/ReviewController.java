package com.example.xProject.controller.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.xProject.model.shop.dto.ReviewDTO;
import com.example.xProject.service.shop.ReviewService;

@RestController
@RequestMapping("shop/review/*")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@RequestMapping("insert.do")
	public void writeReview(@ModelAttribute ReviewDTO dto, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		dto.setUserid(userid);
		reviewService.writeReview(dto);
		//return "redirect:/shop/goods/list.do";
	}
	
	@RequestMapping("list.do")
	public ModelAndView listReview(@RequestParam String good_id, ModelAndView mav) {
		List<ReviewDTO> list = reviewService.reviewList(good_id);
		mav.setViewName("shop/review_list");
		mav.addObject("list", list);
		return mav;
	}
}
