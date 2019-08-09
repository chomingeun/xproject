<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매동향 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<script src="https://www.google.com/jsapi"></script>
<style>
div {margin: 0 auto;}
</style>
<script>	
	google.load("visualization","1", {
		"packages":["corechart"]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart(){		
		var jsonData = $.ajax({
			url: "${path}/chart/cart_money_list",
			dataType: "json",
			async: false 
		}).responseText;
		console.log(jsonData);
		var data=new google.visualization.DataTable(jsonData);
 		var chart=new google.visualization.PieChart(
				document.getElementById("chart_div"));
		/* var chart=new google.visualization.LineChart(
				document.getElementById("chart_div"));  */
		/* var chart=new google.visualization.ColumnChart(
				document.getElementById("chart_div")); */	
		chart.draw(data, {
			//title: "상품별 구매동향",
			//curveType: "function", //곡선 처리		
			width: 700,
			height: 450
		});
	}
	google.setOnLoadCallback(drawChart2);
	function drawChart2(){		
		var jsonData = $.ajax({
			url: "${path}/chart/user_money_list",
			dataType: "json",
			async: false 
		}).responseText;
		console.log(jsonData);
		var data=new google.visualization.DataTable(jsonData);
 		/* var chart=new google.visualization.PieChart(
				document.getElementById("chart_div2")); */
		/* var chart=new google.visualization.LineChart(
				document.getElementById("chart_div2")); */
		var chart=new google.visualization.ColumnChart(
				document.getElementById("chart_div2")); 
		chart.draw(data, {
			//title: "회원별 구매동향",
			//curveType: "function", //곡선 처리		
			width: 700,
			height: 450
		});
	}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="table-responsive">
<table class="table" style="margin:0 auto; width:1400px;">
<tr>
	<td>
	<div class="info__img">
	<img src="${path}/img/상품별 구매동향.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:310px; height:55px;">
	</div>	
	<div id="chart_div"></div>
	<div style="text-align:center;">
		<input class="btn" type="button" onclick="drawChart()" 
			style="background-color:#384aec; color:white;" value="refresh">
	</div>
	</td>
	<td>
	<div class="info__img">
	<img src="${path}/img/회원별 구매동향.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:310px; height:55px;">
	</div>
	<div id="chart_div2"></div>
	<div style="text-align:center;">
		<input class="btn" id="btn" type="button" onclick="drawChart2()" 
			style="background-color:#384aec; color:white;" value="refresh">
	</div>
	</td>
</tr>
</table>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>