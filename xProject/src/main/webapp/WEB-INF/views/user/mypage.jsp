<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<%-- <%@ include file="../include/session_check.jsp" %> --%>
<script>
function checkpw() {
	if($("#passwd").val() != $("#pwcheck").val()) {
		$("#pwsame").html("비밀번호가 일치하지 않습니다.");
		return false;
	}else {
		$("#pwsame").html("");
		return false;
	}
}

$(function(){
	$("#update").click(function(){
		if($("#passwd").val()=="") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}		
		if($("#passwd").val() != $("#pwcheck").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwcheck").focus();
			return;
		}
		if(confirm("수정하시겠습니까?")) {			
			document.form1.action="${path}/user/update.do";
			document.form1.submit();
			alert("회원정보 수정이 완료되었습니다.");
		}
	});
	$("#dropout").click(function(){
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			document.form1.action="${path}/user/dropout.do";
			document.form1.submit();
			alert("탈퇴가 정상적으로 처리되었습니다.");
		}
	});
});

function goBack() {
	window.history.back();
}
</script>
<style>
td {padding: 5px;}
td:nth-of-type(1) {width: 25%;}
td:nth-of-type(2) > input {width: 100%;}

strong{width:60%; margin: auto;}
table{width:30%; margin:auto; padding-right:150px;}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<c:if test="${sessionScope.userid==null || sessionScope.userid!=dto.userid}">
	<script>
		alert("접근권한이 없습니다.");
		location.href="${path}/user/view.do?userid=${sessionScope.userid}";
	</script>
</c:if>
<br>
<div class="info__img">
	<img src="${path}/img/개인정보 수정.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:300px; height:55px;">
</div>
<form method="post" name="form1">
<table> <!-- style="width:450px;" -->
<tr>
<td colspan="2" align= "right"><a class="btn btn-sm btn-gray" href="#" id="dropout">회원탈퇴</a></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input class="form-control" name="userid" id="userid" value="${dto.userid}" readonly></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input class="form-control" name="name" id="name" value="${dto.name}"></td>
	</tr>	
	<tr>
		<td>새 비밀번호</td>
		<td><input class="form-control" type="password" 
				name="passwd" id="passwd" placeholder="새 비밀번호를 입력하세요."></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input class="form-control" type="password" id="pwcheck" 
				onkeyup="checkpw()" data-ajax="false" placeholder="비밀번호를 한 번 더 입력하세요.">
			<div id="pwsame" style="font-size:13px; color:red;"></div>
		</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input class="form-control" type="tel" name="hp" id="hp" value="${dto.hp}"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input class="form-control" type="email" name="email" id="email" value="${dto.email}"></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input class="form-control" type="date" name="birth" id="birth" value="${dto.birth}"></td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td><input class="form-control" name="zipcode" id="zipcode" value="${dto.zipcode}"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input class="form-control" name="address" id="address" value="${dto.address}"></td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td style="letter-spacing:2px;">
			<fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="padding:15px;">
			<button class="btn btn-success" id="update">수정</button>
			<input type="button" class="btn btn-danger" onclick="goBack()" value="취소">
		</td>
	</tr>
</table>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>