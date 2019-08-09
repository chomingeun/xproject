<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<link href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>
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
	      ["para", ["ul", "ol", "paragraph"]]
	      //["insert", ["link"]]
	    ]
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="info__img">
	<img src="${path}/img/상품등록.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div><br>
<form name="form1" method="post" enctype="multipart/form-data">
<table style="width:800px; margin: 0 auto;">
	<tr>
		<td>품목번호</td>
		<td><input class="form-control" name="code" id="code"></td>
	</tr>
	<tr>
		<td>상품번호</td>
		<td><input class="form-control" name="good_id" id="good_id"></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input class="form-control" name="gname" id="gname"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input class="form-control" name="price" id="price"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>
			<textarea rows="5" cols="60" name="description" id="description"></textarea>	
		</td>
	</tr>
	<tr>
		<td>상품이미지</td>
		<td>
			<input type="file" name="file1" id="file1"> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input class="btn btn-success" type="button" value="등록" onclick="goods_write()">
			<input class="btn" type="button" value="목록" style="background-color:#384aec; color:white;"
				onclick="location.href='${path}/shop/goods/list.do'">
		</td>
	</tr>
</table>	
</form>

<script>
function goods_write() {
	var gname=$("#gname").val();
	var price=$("#price").val();
	//var description=$("#description").val();
	
	if($("#code").val()=="") {
		alert("품목번호를 입력하세요.");
		$("#code").focus();
		return;
	}	
	if($("#good_id").val()=="") {
		alert("상품번호를 입력하세요.");
		$("#good_id").focus();
		return;
	}
	if(gname=="") {
		alert("상품이름을 입력하세요.");
		$("#gname").focus();
		return;
	}
	if(price=="") {
		alert("가격을 입력하세요.");
		$("#price").focus();
		return;
	}
	document.form1.action="${path}/shop/goods/insert.do";
	document.form1.submit();
	alert("등록이 완료되었습니다.");
}
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>