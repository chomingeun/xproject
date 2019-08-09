package com.example.xProject.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.xProject.model.shop.dao.GoodsDAO;
import com.example.xProject.model.shop.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	GoodsDAO goodsDao;

	@Override
	public List<GoodsDTO> listGoods(String search_option, String keyword, int start, int end) {
		return goodsDao.listGoods(search_option,keyword,start,end);
	}
	
	@Override
	public List<GoodsDTO> listGoods2(String search_option, String keyword, int start, int end) {
		return goodsDao.listGoods2(search_option,keyword,start,end);
	}
	
	@Override
	public List<GoodsDTO> listGoods3(String search_option, String keyword, int start, int end) {
		return goodsDao.listGoods3(search_option,keyword,start,end);
	}
	
	@Override
	public List<GoodsDTO> listGoods4(String search_option, String keyword, int start, int end) {
		return goodsDao.listGoods4(search_option,keyword,start,end);
	}
	
	@Override
	public GoodsDTO detailGoods(String good_id) {
		return goodsDao.detailGoods(good_id);
	}

	@Override
	public void updateGoods(GoodsDTO dto) {
		goodsDao.updateGoods(dto);
	}

	@Override
	public void deleteGoods(String good_id) {
		goodsDao.deleteGoods(good_id);
	}

	@Override
	public void insertGoods(GoodsDTO dto) {
		goodsDao.insertGoods(dto);
	}

	@Override
	public String fileInfo(String good_id) {
		return goodsDao.fileInfo(good_id);
	}

	@Override
	public int countGoods(String search_option, String keyword) {
		return goodsDao.countGoods(search_option,keyword);
	}

	@Override
	public List<GoodsDTO> listOnSale() {
		return goodsDao.listOnSale();
	}
}
