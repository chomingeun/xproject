<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#idCheck").click(function(){
		$.ajax({
			type: "post",
			url: "${path}/user/idCheck",
			data: {
				"userid": $("#userid").val()
			},
			success: function(result) {
				if(result==1) {
					$("#id_check").css("color","red");
					$("#id_check").html("이미 존재하는 아이디입니다.");
					$("#userid").focus();
					return;
				}else if($("#userid").val()=="") {
					$("#id_check").css("color","red");
					$("#id_check").html("아이디를 입력하세요.");
					$("#userid").focus();
					return;
				}else {
					$("#id_check").css("color","#33cc00");
					$("#id_check").html("사용 가능한 아이디입니다.");
					$("#passwd").focus();
				}
			}
		});	
	});
});

function checkpw() {
	if($("#passwd").val() != $("#pwcheck").val()) {
		$("#pwsame").html("비밀번호가 일치하지 않습니다.");
		return false;
	}else {
		$("#pwsame").html("");
		return false;
	}
}

function check() {
	if($("#userid").val()=="") {
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return;
	}
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
	if($("#name").val()=="") {
		alert("이름을 입력하세요.");
		$("#name").focus();
		return;
	}
	if($("#hp").val()=="") {
		alert("연락처를 입력하세요.");
		$("#hp").focus();
		return;
	}
	if($("#id_check").html()=="" || $("#id_check").html()=="이미 존재하는 아이디입니다."
			|| $("#id_check").html()=="아이디를 입력하세요.") {
		alert("아이디 중복확인을 완료해주세요.");
		$("#idCheck").focus();
		return;
	}
	document.form1.action="${path}/user/join.do";
	document.form1.submit();
	alert("회원가입이 완료되었습니다.");
}

function goBack() {
	window.history.back();
}
</script>
<style>
td {padding: 5px;}
td:nth-of-type(1) {width: 30%;}
td:nth-of-type(2) > input:nth-of-type(1) {width: 90%;}

body{font-family: "맑은 고딕"; color: #333;}

h2{text-align: center;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<div class="info__img">
	<img src="${path}/img/회원가입.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div><br>
<form name="form1" method="post">
<table style="width:500px; margin:0 auto;">
<tr>
	<td colspan="2">
		&nbsp;&nbsp;&nbsp;
		<small style="color:red;">*&nbsp;</small><small>표시는 필수 입력 사항입니다.</small>
	</td>
</tr>
	<tr>
		<td valign="top"><small style="color:red;">*&nbsp;</small>아이디</td>
		<td>
			<input class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요.">
			<input class="btn btn-sm btn-success" type="button" id="idCheck" value="중복확인">
			<small id="id_check" style="font-size:13px;"></small>
			
		</td>		
	</tr>
	<tr>
		<td><small style="color:red;">*&nbsp;</small>비밀번호</td>
		<td><input class="form-control" type="password" 
				name="passwd" id="passwd" placeholder="비밀번호를 입력하세요."></td>
	</tr>
	<tr>
		<td valign="top">&nbsp;&nbsp;비밀번호 확인</td>
		<td><input class="form-control" type="password" id="pwcheck" placeholder="비밀번호를 한 번 더 입력하세요."
					onkeyup="checkpw()" data-ajax="false">
			<div id="pwsame" style="font-size:13px; color:red;"></div>
		</td>
	</tr>
	<tr>
		<td><small style="color:red;">*&nbsp;</small>이름</td>
		<td><input class="form-control" name="name" id="name" placeholder="이름을 입력하세요."></td>
	</tr>
	<tr>
		<td><small style="color:red;">*&nbsp;</small>연락처</td>
		<td><input class="form-control" type="tel" name="hp" id="hp" placeholder="연락처를 입력하세요."></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;이메일</td>
		<td><input class="form-control" type="email" name="email" id="email" placeholder="이메일을 입력하세요."></td>
	</tr>
	<tr>
		<td><small style="color:red;">*&nbsp;</small>우편번호</td>
		<td><input class="form-control" name="zipcode" id="zipcode" placeholder="우편번호를 입력하세요."></td>
	</tr>
	<tr>
		<td><small style="color:red;">*&nbsp;</small>주소</td>
		<td><input class="form-control" name="address" id="address" placeholder="주소를 입력하세요."></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;생년월일</td>
		<td><input class="form-control" type="date" name="birth" id="birth"></td>		
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input class="btn btn-primary" type="button" value="확인" onclick="check()">
			<input type="button" class="btn btn-scarlet" style="color:white;" 
					onclick="goBack()" value="취소">
		</td>
	</tr>
</table>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>