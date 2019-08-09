package com.example.xProject.model.shop.dao;

import java.util.List;

import com.example.xProject.model.shop.dto.GoodsDTO;

public interface GoodsDAO {
	List<GoodsDTO> listGoods(String search_option, String keyword, int start, int end);
	List<GoodsDTO> listGoods2(String search_option, String keyword, int start, int end);
	List<GoodsDTO> listGoods3(String search_option, String keyword, int start, int end);
	List<GoodsDTO> listGoods4(String search_option, String keyword, int start, int end);
	GoodsDTO detailGoods(String good_id);
	void updateGoods(GoodsDTO dto);
	void deleteGoods(String good_id);
	void insertGoods(GoodsDTO dto);
	String fileInfo(String good_id);
	int countGoods(String search_option, String keyword);
	List<GoodsDTO> listOnSale();
}
