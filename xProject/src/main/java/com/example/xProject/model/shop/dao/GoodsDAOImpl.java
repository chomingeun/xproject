package com.example.xProject.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.xProject.model.shop.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<GoodsDTO> listGoods(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		List<GoodsDTO> list = sqlSession.selectList("goods.goods_list",map);
		for(GoodsDTO dto : list) {
			String gname = dto.getGname();
			if(search_option.equals("gname")) {
				if(gname.indexOf(keyword)!=-1) {
					gname = gname.replace(keyword, "<strong style='color:#384aec;'>"+keyword+"</strong>");
				}
			}
			dto.setGname(gname);
		}
		return list;
	}
	
	@Override
	public List<GoodsDTO> listGoods2(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		List<GoodsDTO> list = sqlSession.selectList("goods.goods_list2",map);
		for(GoodsDTO dto : list) {
			String gname = dto.getGname();
			if(search_option.equals("gname")) {
				if(gname.indexOf(keyword)!=-1) {
					gname = gname.replace(keyword, "<strong style='color:#384aec;'>"+keyword+"</strong>");
				}
			}
			dto.setGname(gname);
		}
		return list;
	}
	
	@Override
	public List<GoodsDTO> listGoods3(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		List<GoodsDTO> list = sqlSession.selectList("goods.goods_list3",map);
		for(GoodsDTO dto : list) {
			String gname = dto.getGname();
			if(search_option.equals("gname")) {
				if(gname.indexOf(keyword)!=-1) {
					gname = gname.replace(keyword, "<strong style='color:#384aec;'>"+keyword+"</strong>");
				}
			}
			dto.setGname(gname);
		}
		return list;
	}
	
	@Override
	public List<GoodsDTO> listGoods4(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		List<GoodsDTO> list = sqlSession.selectList("goods.goods_list4",map);
		for(GoodsDTO dto : list) {
			String gname = dto.getGname();
			if(search_option.equals("gname")) {
				if(gname.indexOf(keyword)!=-1) {
					gname = gname.replace(keyword, "<strong style='color:#384aec;'>"+keyword+"</strong>");
				}
			}
			dto.setGname(gname);
		}
		return list;
	}
	
	@Override
	public GoodsDTO detailGoods(String good_id) {
		return sqlSession.selectOne("goods.goods_detail",good_id);
	}

	@Override
	public void updateGoods(GoodsDTO dto) {
		sqlSession.update("goods.goods_update", dto);
	}

	@Override
	public void deleteGoods(String good_id) {
		sqlSession.delete("goods.goods_delete",good_id);
	}

	@Override
	public void insertGoods(GoodsDTO dto) {
		sqlSession.insert("goods.goods_insert", dto);
	}

	@Override
	public String fileInfo(String good_id) {
		return sqlSession.selectOne("goods.goods_fileInfo", good_id);
	}

	@Override
	public int countGoods(String search_option, String keyword) {
		Map<String,String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("goods.countGoods", map);
	}

	@Override
	public List<GoodsDTO> listOnSale() {
		return sqlSession.selectList("goods.list_on_sale");
	}
}
