<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝니다 소스류 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<script>
function list(page){
	location.href="${path}/shop/goods/list2.do?curPage="+page;
} 
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Sauce & <span class="section-intro__style">Spice</span></h2>
        </div>
        <div class="row">
        <c:forEach var="row" items="${map.list}">
        <input type = "hidden" value="${row.code}">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="${path}/img/goods/sauce/${row.img_path}">
                <c:if test="${sessionScope.userid != 'admin'}">
                <ul class="card-product__imgOverlay">
                  <form name="form1" method="post" action="${path}/shop/goodscart/insert.do">
                  <li><button type="submit"><i class="ti-shopping-cart">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1">
                  </i></button></li>
                  </form>
                </ul>
                </c:if>
              </div>              	
              <div class="card-body">
			<!-- 관리자에게만 편집 버튼 표시 -->
			<h4 class="card-product__title">
              <a href="${path}/shop/goods/detail/${row.good_id}"> ${row.gname}</a></h4>
               <c:choose>
               	<c:when test="${row.on_discount==0}">               	
                <p class="card-product__price">
                	<fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원
                </p>
               	</c:when>
               	<c:otherwise>
               	<p class="card-product__price">
                	(${row.on_discount}% 할인)<br>
                	<fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원
                </p>
               	</c:otherwise> 
               </c:choose>
			<c:if test="${sessionScope.userid=='admin'}"> <br>
			  <a class="btn btn-sm" style="background-color:#384aec; color:white;"
			 	href="${path}/shop/goods/edit/${row.good_id}">편집</a></c:if>
              </div>
            </div>
          </div>
          </c:forEach>
         </div>
    <form name="form1" method="post" action="${path}/shop/goods/list2.do" style="text-align: center;">
		<input name="keyword" value="${map.keyword}" style="width: 200px;" placeholder="상품명을 입력해주세요.">
		<input class="btn btn-sm" type="submit" value="검색" 
				style="background-color:#384aec; color:white;">
	</form>
         </div>         
    </section>

<table style="margin:0 auto;">
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
<br>
<%@ include file="../include/footer.jsp" %>
</body>
</html>