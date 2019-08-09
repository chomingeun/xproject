<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<script>
$(function(){
	$("#description").summernote({
	    tabsize: 2,
	    height: 200,
	    lang: "ko-KR",
	    toolbar: [
	      ["style", ["style"]],
	      ["font", ["bold", "underline", "clear"]],
	      ["color", ["color"]],
	      ["para", ["ul", "ol", "paragraph"]],
	      ["insert", ["link"]]
	    ]
	});
});
</script>

<h2>상품 정보 편집</h2>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품명</td>
				<td><input name="gname" id="gname" value="${dto.gname}"></td>
			</tr>
			<tr>
				<td>할인</td>
				<td>
					<select name="on_discount" id="on_discount">
						<c:forEach begin="0" end="100" var="i" step="5">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price" id="price" value="${dto.price}"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="description"
						id="description">${dto.description}</textarea></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><img src = "${path}/img/${dto.img_path}" width="300px" height="300px"><br> 
					<input type="file" name="file1"	id="file1">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">					
					<input type="hidden" name="good_id" value="${dto.good_id}">
					<input class="btn btn-success" type="button" value="수정" onclick="goods_update()"> 
					<input class="btn btn-scarlet" type="button" value="삭제" 
							style="color:white;" onclick="goods_delete()"> 
					<input class="btn" type="button" value="목록"
							onclick="location.href='${path}/shop/goods/list.do'"
							style="background-color:#384aec; color:white;">
				</td>
			</tr>
		</table>
	</form>

<script>
function goods_delete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/shop/goods/delete.do";
		document.form1.submit();
	}
}

function goods_update() {
	var gname = $("#gname").val();
	var description = $("#description").val();
	if(gname == "") {
		alert("상품이름을 입력하세요.");
		$("#gname").focus();
		return;
	}
	if($("#price").val() == "") {
		alert("가격을 입력하세요.");
		$("#price").focus();
		return;
	}
	if(description == "") {
		alert("상품 설명을 입력하세요.");
		$("#description").focus();
		return;
	}
	document.form1.action = "${path}/shop/goods/update.do";
	document.form1.submit();
	alert("정보 수정이 완료되었습니다.");
}
</script>			
</body>
</html>