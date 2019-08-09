<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<style>
tr:nth-of-type(1) {background-color:#384aec; border:1px solid white;}
tr:nth-of-type(1) > th {color:white; text-align:center; border:1px solid white;}
</style>
<script>
$(function(){
	$("#btnList").click(function(){
		//장바구니 목록으로 이동
		location.href="${path}/shop/goods/list.do";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${path}/shop/goodscart/deleteAll.do";
		}
	});
	$("#btnOrderAll").click(function(){
		if(confirm("주문하시겠습니까?")){
			location.href="${path}/shop/goodscart/orderAll.do";
			alert("주문이 완료되었습니다.");
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="info__img">
	<img src="${path}/img/장바구니.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div><br>
<table style="text-align:center;">
<c:choose>
	<c:when test="${map.count==0 || map.sumMoney==0}">
			<h3 style="text-align:center; font-weight:400; font-size:28px;">장바구니가 비었습니다.</h3>
			<br>
			<div style="text-align:center;">
				<button class="btn" type="button" id="btnList" 
					style="background-color:#384aec; color:white;">상품목록</button>
			</div>
	</c:when>
	<c:otherwise>
		<div class="table-responsive">
		<form name="form1" method="post" action="${path}/shop/goodscart/update.do">
			<table class="table table-hover" style="width:600px; margin:0 auto;">
				<tr align="center">
					<th style="width:30%;">상품명</th>
					<th>단가</th>
					<th style="width:20%;">수량</th>
					<th>금액</th>
					<th>&nbsp;</th>
				</tr>
			<c:forEach var="row" items="${map.list}">
				<input type="hidden" name="delivered" value="${row.delivered}">
				<c:choose>				
				<c:when test="${row.delivered=='y'}">				
				</c:when>
				<c:otherwise>
				<tr>
					<td style="width:30%;">${row.gname}</td>
					<td>${row.price}</td>
					<td style="width:20%;">
						<input type="number" name="amount" value="${row.amount}">
						<input type="hidden" name="cart_id"	value="${row.cart_id}">
					</td>
					<td>${row.money}</td>
					<td align="center">
						<c:if test="${sessionScope.userid != null}">
							<a class="btn btn-sm btn-success" onclick="alert('주문이 완료되었습니다.');"
								href="${path}/shop/goodscart/order.do?cart_id=${row.cart_id}">주문</a>
							<a class="btn btn-sm btn-danger"
								href="${path}/shop/goodscart/delete.do?cart_id=${row.cart_id}">삭제</a>
						</c:if>					
					</td> 
				</tr> 
				</c:otherwise>
				</c:choose>
			</c:forEach>
				<tr>
					<td colspan="5" align="right">
						장바구니 금액 합계 : ${map.sumMoney}원<br>
						배송료 : ${map.fee}원<br>
						총합계 : ${map.sum}원
					</td>
				</tr>
			
			</table>
			<div style="text-align: center;">
			<button id="btnUpdate" class="btn btn-info">수정</button>
			<button type="button" class="btn btn-info" id="btnDelete">비우기</button>
			<input type="button" class ="btn" style="background-color:#384aec; color:white;" id="btnOrderAll" value="주문하기">
<button class="btn" type="button" id="btnList" style="background-color:#384aec; color:white;">상품목록</button>
			</div>
		</form>
		</div>
	</c:otherwise>
</c:choose>
</table>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
