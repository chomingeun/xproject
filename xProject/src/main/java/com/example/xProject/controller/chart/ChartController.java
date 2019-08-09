package com.example.xProject.controller.chart;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.xProject.service.chart.ChartService;

@RestController
@RequestMapping("chart/*")
public class ChartController {
	
	@Inject
	ChartService chartService;
	
	@RequestMapping("google_chart")
	public ModelAndView chart1() {
		return new ModelAndView("chart/sales_chart");
	}
	
	/*
	 * @RequestMapping("google_chart2") public ModelAndView chart2() { return new
	 * ModelAndView("chart/sales_chart2"); }
	 */
	
	@RequestMapping("cart_money_list")
	public JSONObject cart_money_list() {
		return chartService.getChartData1();
	}
	
	@RequestMapping("user_money_list")
	public JSONObject user_money_list() {
		return chartService.getChartData2();
	}	
}
