package com.example.xProject.controller.chart;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.xProject.service.chart.ChartService;

@RestController
@RequestMapping("userchart/*")
public class UserChartController {
	
	@Inject
	ChartService chartService;
	
	@RequestMapping("my_cart_money")
	public JSONObject my_cart_money(HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		return chartService.getChartData3(userid);
	}
}
