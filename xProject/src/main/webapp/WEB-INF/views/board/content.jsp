<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<title>Insert title here</title>
<%@ include file="../include/menu.jsp" %>

<script>	
$(function(){	
$(document).on('click', '#btnList', function(){
location.href = "${pageContext.request.contextPath}/board/getBoardList";
});

$(document).on('click', '#btnUpdate', function(){
	var url = "${pageContext.request.contextPath}/board/updateBoard";
	url = url + "?bid="+${boardContent.bid};
	url = url + "&mode=edit";
	location.href = url;
});
//삭제 버튼 클릭 이벤트
$(document).on('click', '#btnDelete', function(){
	if(confirm("삭제하시겠습니까?")){
		var url = "${pageContext.request.contextPath}/board/deleteBoard";
		url = url + "?bid=" + ${boardContent.bid};
		location.href = url;
		alert("삭제되었습니다.");
	}
	});
});
</script>
</head>
<body>

<article>
		<div class="container" role="main" style="padding:3px;">
			<div class="info__img">
				<img src="${path}/img/공지사항.png" 
				style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
			</div>
			<div class="bg-white rounded shadow-sm">
				<div class="board_title" style="font-size:32px; text-align:center;">
					<c:out value="${boardContent.title}"/></div>
				<div class="board_info_box" style="letter-spacing:2px;" align="right">
					<span class="board_author"><c:out value="${boardContent.reg_id}"/></span>
					&nbsp;&nbsp;|&nbsp;&nbsp;<span class="board_date">
					<c:out value="${boardContent.reg_dt}"/></span>
				</div>
				<div class="board_content" style="height:300px;">${boardContent.content}</div>
				<div class="board_tag" style="letter-spacing:3px;">TAG : <c:out value="${boardContent.tag}"/></div>
			</div>
			<div style="margin-top:20px">
				<c:if test="${sessionScope.userid=='admin'}">
					<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</c:if>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>			
		</div>
	</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>