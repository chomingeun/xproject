package com.example.xProject.model.shop.dao;

import java.util.List;

import com.example.xProject.model.shop.dto.GoodsCartDTO;

public interface GoodsCartDAO {

	public List<GoodsCartDTO> cartMoney();
	public void insert(GoodsCartDTO dto);
	public List<GoodsCartDTO> listGoodsCart(String userid);
	public void delete(int cart_id);
	public void deleteAll(String userid);	
	public int sumMoney(String userid);
	public void modifyGoodsCart(GoodsCartDTO dto);
	public void orderAll(String userid); //장바구니에 담긴 상품 모두 주문
	public void order(int cart_id); //장바구니에서 선택해서 주문
	public List<GoodsCartDTO> myPage(String userid);
	public List<GoodsCartDTO> userMoney(); //회원별 상품 구매동향(관리자만 볼 수 있음)
	public List<GoodsCartDTO> myCartMoney(String userid); //각 회원별 구매 통계(마이페이지)
}
