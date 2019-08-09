<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<link href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<table style="width:700px">
<c:forEach var="row" items="${list}">   
	<%-- <c:set var="str" value="${fn:replace(row.review,'<','&lt;') }" />
	<c:set var="str" value="${fn:replace(str,'>','&gt;') }" />	 --%>
	<c:set var="str" value="${fn:replace(row.review,'  ','&nbsp;&nbsp;')}" />
	<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
	<tr>
		<td>
			${row.name}
			(<fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd a HH:mm:ss" />)
			<br>
			${str}
		</td>
	</tr>
</c:forEach>	
</table>
</body>
</html>