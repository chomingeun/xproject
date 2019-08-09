package com.example.xProject.service.shop;

import java.util.List;

import com.example.xProject.model.shop.dto.GoodsCartDTO;

public interface GoodsCartService {

	public List<GoodsCartDTO> cartMoney();
	public void insert(GoodsCartDTO dto);
	public List<GoodsCartDTO> listGoodsCart(String userid);
	public void delete(int cart_id);
	public void deleteAll(String userid);
	public int sumMoney(String userid);
	public void modifyGoodsCart(GoodsCartDTO dto);
	public void orderAll(String userid);
	public void order(int cart_id);
	public List<GoodsCartDTO> myPage(String userid);
	public List<GoodsCartDTO> userMoney();
	public List<GoodsCartDTO> myCartMoney(String userid);
}
