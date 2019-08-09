<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
th {font-weight:400; text-align:center;}
</style>
<script>
function list(page){
	location.href="${path}/user/list.do?curPage="+page;
} 
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="info__img">
	<img src="${path}/img/회원관리.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div><br>
<div style="width: 1200px; margin: 0 auto;">
<form name="form1" method="post" action="${path}/user/list.do">
	<select name="search_option">
		<option value="name" <c:if test="${map.search_option=='name'}">selected</c:if>>이름</option>
		<option value="userid" <c:if test="${map.search_option=='userid'}">selected</c:if>>아이디</option>
		<option value="email" <c:if test="${map.search_option=='email'}">selected</c:if>>이메일</option>
		<option value="address" <c:if test="${map.search_option=='address'}">selected</c:if>>주소</option>
	</select>&nbsp;
	<input name="keyword" value="${map.keyword}">
	<input type="submit" class="btn" style="background-color:#384aec; color:white;" value="조회">
</form>
<br>
<%-- 총 회원 수: ${map.count}(명)
<br> --%>
<div class="table-responsive">
<table class="table table-hover table-bordered" style="width:1200px;" >
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>우편번호</th>		
		<th>주소</th>
		<th>생년월일</th>
		<th>가입일자</th>
		<th>&nbsp;</th>
	</tr>
<c:forEach var="list" items="${map.list}">
	<tr>
		<td>${list.userid}</td>
		<td>${list.name}</td>
		<td>${list.hp}</td>
		<td>${list.email}</td>
		<td align="center">${list.zipcode}</td>		
		<td>${list.address}</td>
		<td>${list.birth}</td>
		<td><fmt:formatDate value="${list.join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td align="center">
			<c:if test="${list.userid != sessionScope.userid}">
				<a href="${path}/user/delete.do?userid=${list.userid}" class="btn btn-sm btn-scarlet">삭제</a>
			</c:if>
		</td>		
	</tr>
</c:forEach>
	<tr>
		<td colspan="9" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#"	onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#"	onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>