package com.example.xProject.service.chart;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.example.xProject.model.shop.dto.GoodsCartDTO;
import com.example.xProject.service.shop.GoodsCartService;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Inject
	GoodsCartService goodscartService;

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getChartData1() {
		List<GoodsCartDTO> list = goodscartService.cartMoney();
		
		JSONObject data = new JSONObject();		
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONArray title = new JSONArray();		
		col1.put("label", "상품명");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");		
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(GoodsCartDTO dto : list) {
			JSONObject name = new JSONObject();
			name.put("v", dto.getGname());
			JSONObject money = new JSONObject();
			money.put("v", dto.getMoney());
			JSONArray row = new JSONArray();
			row.add(name);
			row.add(money);
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		
		return data;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getChartData2() {
		List<GoodsCartDTO> list = goodscartService.userMoney();
		JSONObject data = new JSONObject();		
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONArray title = new JSONArray();		
		col1.put("label", "회원명");
		col1.put("type", "string");
		col2.put("label", "총구매금액");
		col2.put("type", "number");		
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(GoodsCartDTO dto : list) {
			JSONObject name = new JSONObject();
			name.put("v", dto.getName());
			JSONObject money = new JSONObject();
			money.put("v", dto.getMoney());
			JSONArray row = new JSONArray();
			row.add(name);
			row.add(money);
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getChartData3(String userid) {
		List<GoodsCartDTO> list = goodscartService.myCartMoney(userid);
		JSONObject data = new JSONObject();		
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONArray title = new JSONArray();		
		col1.put("label", "상품명");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");		
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(GoodsCartDTO dto : list) {
			JSONObject name = new JSONObject();
			name.put("v", dto.getGname());
			JSONObject money = new JSONObject();
			money.put("v", dto.getMoney());
			JSONArray row = new JSONArray();
			row.add(name);
			row.add(money);
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}
}
