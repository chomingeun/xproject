<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<script src="https://www.google.com/jsapi"></script>
<style>
td {padding: 5px;}
tr:nth-of-type(1) {background-color:#384aec; border:1px solid white;}
tr:nth-of-type(1) > td {color:white; text-align:center; border:1px solid white;}
</style>
<script>	
	google.load("visualization","1", {
		"packages":["corechart"]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart(){		
		var jsonData = $.ajax({
			url: "${path}/userchart/my_cart_money",
			dataType: "json",
			async: false 
		}).responseText;
		console.log(jsonData);
		var data=new google.visualization.DataTable(jsonData);
 		var chart=new google.visualization.PieChart(
				document.getElementById("chart_div"));
		/* var chart=new google.visualization.LineChart(
				document.getElementById("chart_div")); */
		/* var chart=new google.visualization.ColumnChart(
				document.getElementById("chart_div"));  */
		chart.draw(data, {
			title: "상품 구매현황",
			//curveType: "function", //곡선 처리		
			width: 800,
			height: 450
		});
	}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="info__img">
	<img src="${path}/img/구매내역.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div><p>
<table style="width:700px; margin:0 auto;" >
	<tr>
		<td>상품명</td>
		<td>수량</td>
		<td>수령인</td>
		<td>주소</td>
		<td>연락처</td>
		<td>주문현황</td>
	</tr>
<c:choose>
	<c:when test="${map.cnt==0}">
	<tr>
		<td colspan="5">주문내역이 존재하지 않습니다.</td>
	</tr>
	</c:when>
	<c:otherwise>
	<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.gname}</td>
		<td align="center">${row.amount}</td>
		<td>${row.name}</td>
		<td>${row.address}</td>
		<td align="center">${row.hp}</td>
		<td align="center">
			<c:if test="${row.delivered=='y'}">
				<div style="color:#0039e6;">주문완료</div>
			</c:if>
			<c:if test="${row.delivered=='n'}">
				<div style="color:#ff3300;">주문대기</div>
			</c:if>
		</td>
	</tr>
	</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<div style="text-align: center; margin-top: 10px;" >
<a class="btn btn-success" href="${path}/shop/goods/list.do">주문하러 가기</a>
<a class="btn btn-primary" href="${path}/shop/goodscart/list.do">장바구니</a>
<br>
<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
<div id="chart_div"style="margin-left: 660px;"></div>
<div>
	<input class="btn" id="btn" type="button" onclick="drawChart()" 
		style="background-color:#384aec; color:white;" value="refresh">
</div>
</div>
<br><br>
<%@ include file="../include/footer.jsp" %>
</body>
</html>