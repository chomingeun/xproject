package com.example.xProject.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.xProject.model.shop.dao.GoodsCartDAO;
import com.example.xProject.model.shop.dto.GoodsCartDTO;

@Service
public class GoodsCartServiceImpl implements GoodsCartService {

	@Inject
	GoodsCartDAO goodscartDao;
	
	@Override
	public List<GoodsCartDTO> cartMoney() {
		 return goodscartDao.cartMoney(); 
	}

	@Override
	public void insert(GoodsCartDTO dto) {
		 goodscartDao.insert(dto); 

	}

	@Override
	public List<GoodsCartDTO> listGoodsCart(String userid) {
		return goodscartDao.listGoodsCart(userid);
	}

	@Override
	public void delete(int cart_id) {
		 goodscartDao.delete(cart_id); 

	}

	@Override
	public void deleteAll(String userid) {
		goodscartDao.deleteAll(userid);

	}

	@Override
	public void modifyGoodsCart(GoodsCartDTO dto) {
		goodscartDao.modifyGoodsCart(dto);

	}

	@Override
	public void orderAll(String userid) {
		goodscartDao.orderAll(userid);
	}

	@Override
	public void order(int cart_id) {
		goodscartDao.order(cart_id);
	}

	@Override
	public int sumMoney(String userid) {
		return goodscartDao.sumMoney(userid);
	}

	@Override
	public List<GoodsCartDTO> myPage(String userid) {
		return goodscartDao.myPage(userid);
	}

	@Override
	public List<GoodsCartDTO> userMoney() {
		return goodscartDao.userMoney();
	}

	@Override
	public List<GoodsCartDTO> myCartMoney(String userid) {
		return goodscartDao.myCartMoney(userid);
	}
}
