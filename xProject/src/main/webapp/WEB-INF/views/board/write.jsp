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

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script>
$(function(){
	$("#content").summernote({
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
	
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
		alert("등록이 완료되었습니다.");
	});
	
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/board/getBoardList";
	});
	
$(document).ready(function(){
var mode = '<c:out value="${mode}"/>';
if ( mode == 'edit'){
//입력 폼 셋팅
$("#reg_id").prop('readonly', true);
$("input:hidden[name='bid']").val(<c:out value="${boardContent.bid}"/>);
$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
$("#title").val('<c:out value="${boardContent.title}"/>');
$("#content").val('<c:out value="${boardContent.content}"/>');
$("#tag").val('<c:out value="${boardContent.tag}"/>');
	}
});

</script>

<article>
<div class="container" role="main">
<div class="info__img">
	<img src="${path}/img/글쓰기.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div>
			
<form name="form" id="form" role="form" method="post" 
action="${pageContext.request.contextPath}/board/getInsertBoard">
			
			
				
<div class="mb-3">
<label for="title" style="letter-spacing:3px; font-weight:600; font-size:18px;">제목</label>
<input id="title" name="title" class="form-control" placeholder="제목을 입력해 주세요" />
</div>		

<div class="mb-3">
<label for="content" style="letter-spacing:3px; font-weight:600; font-size:18px;">내용</label>
<textarea id="content" name ="content" class="form-control" placeholder="내용을 입력해 주세요" rows="10"></textarea>
</div>

<div class="mb-3">
<label for="tag" style="letter-spacing:3px; font-weight:600; font-size:18px;">TAG</label>
<input id="tag" name = "tag" class="form-control" placeholder="태그를 입력해 주세요" />
</div>
</form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>