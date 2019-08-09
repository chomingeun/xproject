package com.example.xProject.model.shop.dto;

import java.util.Date;

public class ReviewDTO {
	private int rno;
	private String good_id;
	private String userid;
	private String name;
	private String review;
	private Date post_date;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getGood_id() {
		return good_id;
	}
	public void setGood_id(String good_id) {
		this.good_id = good_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
	@Override
	public String toString() {
		return "ReviewDTO [rno=" + rno + ", good_id=" + good_id + ", userid=" + userid 
				+ ", name=" + name + ", review="
				+ review + ", post_date=" + post_date + "]";
	}
}
