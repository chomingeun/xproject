package com.example.xProject.model.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class GoodsDTO {
	private int code; //상품 카테고리 코드(번호)
    private String gname; //상품 이름
	private String good_id; //상품 고유 일련번호
	private int price; //가격
	private String description; //내용
	private String img_path;
	private MultipartFile file1; //첨부파일
	private int on_discount;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGood_id() {
		return good_id;
	}
	public void setGood_id(String good_id) {
		this.good_id = good_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public int getOn_discount() {
		return on_discount;
	}
	public void setOn_discount(int on_discount) {
		this.on_discount = on_discount;
	}
	
	@Override
	public String toString() {
		return "GoodsDTO [code=" + code + ", gname=" + gname + ", good_id=" + good_id + ", price=" + price
				+ ", description=" + description + ", img_path=" + img_path + ", file1=" + file1 + ", on_discount="
				+ on_discount + "]";
	}
}
