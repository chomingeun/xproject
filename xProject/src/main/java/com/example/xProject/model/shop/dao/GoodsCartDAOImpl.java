package com.example.xProject.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.xProject.model.shop.dto.GoodsCartDTO;

@Repository
public class GoodsCartDAOImpl implements GoodsCartDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<GoodsCartDTO> cartMoney() {
		 return sqlSession.selectList("goodscart.goodscart_money");
	}

	@Override
	public void insert(GoodsCartDTO dto) {
		 sqlSession.selectList("goodscart.goodscart_insert", dto);

	}

	@Override
	public List<GoodsCartDTO> listGoodsCart(String userid) {
		return sqlSession.selectList("goodscart.goodscart_list", userid);
	}

	@Override
	public void delete(int cart_id) {
		 sqlSession.delete("goodscart.goodscart_delete",cart_id); 

	}

	@Override
	public void deleteAll(String userid) {
		sqlSession.delete("goodscart.goodscart_deleteAll", userid);

	}

	@Override
	public void modifyGoodsCart(GoodsCartDTO dto) {
		sqlSession.update("goodscart.goodscart_modifyGoodsCart",dto);
	}

	@Override
	public void orderAll(String userid) {
		sqlSession.update("goodscart.orderAll", userid);
	}

	@Override
	public void order(int cart_id) {
		sqlSession.update("goodscart.order", cart_id);
	}

	@Override
	public int sumMoney(String userid) {
		return sqlSession.selectOne("goodscart.goodscart_sumMoney", userid);
	}

	@Override
	public List<GoodsCartDTO> myPage(String userid) {
		return sqlSession.selectList("goodscart.mypage", userid);
	}

	@Override
	public List<GoodsCartDTO> userMoney() {
		return sqlSession.selectList("goodscart.user_money");
	}

	@Override
	public List<GoodsCartDTO> myCartMoney(String userid) {
		return sqlSession.selectList("goodscart.myCartMoney", userid);
	}
}
