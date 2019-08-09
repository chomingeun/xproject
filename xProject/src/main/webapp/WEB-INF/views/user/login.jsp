<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 슈퍼마켙!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnLogin").click(function(){
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}		
		document.form1.action="${path}/user/login_check.do";
		document.form1.submit();
	});
});
</script>
<style>
td {padding: 10px;}
*{ margin:0; padding: 0; }
body{
         font-family: "맑은 고딕";
         color: #333;
         margin-bottom: center;
         
}
form{
         width:305px;
         margin:0 auto;
         border: 1px solid gray;
         border-radius: 5px;
         /* padding-top: 80px auto; */
}
h2{
text-align: center;
margin-top: 50px;
}
#form input, #login-form label{
         display:block;
}

#form input[type='image']{
         margin: 10px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %><br>
<div class="info__img">
	<img src="${path}/img/로그인.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div><br>
<form name="form1" method="post">
<table style="width:300px;">
	<tr>
		<td><input class="form-control" name="userid" id="userid" placeholder="ID"></td>
	</tr>
	<tr>
		<td><input class="form-control" type="password" name="passwd" id="passwd" placeholder="Password"></td>
	</tr>
	<tr>
		<td align="center">
			<button class="button button-login w-100" id="btnLogin">로그인</button>
					
			<c:if test="${message=='error'}">
				<div style="color:red; font-size:14px;">
					아이디나 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>			
			<c:if test="${message=='logout'}">
				<script>
					alert("로그아웃되었습니다.");
				</script>
			</c:if>			
		</td>
	</tr>
</table>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>