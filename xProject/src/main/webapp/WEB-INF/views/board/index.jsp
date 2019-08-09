<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<style>
td {vertical-align: middle;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous">
</script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">
<script>
$(document).on('click', '#btnWriteForm', function(e){
e.preventDefault();
location.href = "${pageContext.request.contextPath}/board/write";
});

function fn_contentView(bid){
	var url = "${pageContext.request.contextPath}/board/getBoardContent";
	url = url + "?bid="+bid;
	location.href = url;
}
function list(page){
	location.href="${path}/board/getBoardList?curPage="+page;
} 

</script>
	<article>
<div class="container">
<div class="info__img">
	<img src="${path}/img/공지사항.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div>
<br>
<div class="table-responsive">
<table class="table table-striped table-sm">
		<colgroup>
			<col style="width:5%;" />
			<col style="width:auto;" />
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
		</colgroup>
		<thead>
			<tr>
				<th style="text-align:center;">NO</th>
				<th style="text-align:center;">제목</th>
				<th style="text-align:center;">작성자</th>
				<th style="text-align:center;">조회수</th>
				<th style="text-align:center;">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${map.count == 0}" >
					<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:otherwise>
					<c:forEach var="list" items="${map.list}">
						<tr>
							<td align="center"><c:out value="${list.bid}"/></td>
							
							<td><a href="#" onClick="fn_contentView(<c:out value="${list.bid}"/>)">
								<c:out value="${list.title}"/></a></td>
							
							<td align="center"><c:out value="${list.reg_id}"/></td>
							<td align="center"><c:out value="${list.view_cnt}"/></td>
							<td align="center"><c:out value="${list.reg_dt}"/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
<c:if test="${sessionScope.userid=='admin'}">	
	<div align="right">
		<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm"
				style="text-align: right;">글쓰기</button>
	</div>
</c:if>
	
<table style="margin:0 auto; text-align:center;">
	<tr>
		<td colspan="5" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
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
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>	
</table>
<form name="form1" method="post" action="${path}/board/getBoardList" style="text-align:center;">
	<select name="search_option">
		<option value="title"
<c:if test="${map.search_option == 'title'}">selected</c:if>
		>제목</option>
	</select>
	<input name="keyword" value="${map.keyword}">
	<input class="btn btn-sm btn-primary" type="submit" value="조회">
</form>
	</div>
	</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>