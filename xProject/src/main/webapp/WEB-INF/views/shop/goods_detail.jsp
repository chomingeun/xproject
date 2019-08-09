<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 | 슈퍼마켙!</title>
<%@ include file="../include/header.jsp" %>
<link href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>
<style>
td {padding: 5px;}
select, option {z-index: 500;}
</style>
<script>
$(function(){
	review_list();
	
	$("#review").summernote({
	    placeholder: "리뷰를 작성하세요.",
	    tabsize: 2,
	    height: 100,
	    lang: "ko-KR",
	    toolbar: [
	      ["style", ["style"]],
	      ["font", ["bold", "underline", "clear"]],
	      ["color", ["color"]],
	      ["para", ["ul", "ol", "paragraph"]],
	      ["insert", ["picture"]]
	    ]
	});
	
	$("#btnWrite").click(function(){
		var param = {"review":$("#review").val(), "good_id":"${dto.good_id}"};
		$.ajax({
			type: "post",
			url: "${path}/shop/review/insert.do",
			data: param,
			success: function(){
				$("#review").val("");
				alert("리뷰가 등록되었습니다.");
				review_list();
			}
		});
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<div class="info__img">
	<img src="${path}/img/productInfo.png" 
		style="display:block; margin:0px auto; margin-top:30px; width:200px; height:55px;">
</div>
<div align="center">
	<img src="${path}/img/${dto.img_path}" 
		style="margin-left:500px; margin-top:30px; float:left; width:400px; height:400px;">
</div>
<div>
	<p></p><p></p><br>
	<p>상 품 명 : ${dto.gname}</p>
	<p>가     격 : ${dto.price}</p>
	<p>상품상세 : ${dto.description}</p>
	<table style="margin-top:30px; margin-right:-80px">
		<tr>
		<td colspan="2">
			<form name="form1" method="post" action="${path}/shop/goodscart/insert.do">
				<input type="hidden" name="good_id" value="${good_id}">
				<input type="number" name="amount" value="1" style="width:80px;">
				&nbsp;
				<c:if test="${sessionScope.userid != 'admin'}">
					<input class="btn btn-primary" type="submit" value="장바구니에 담기">
				</c:if>
			</form>
		</td>
		</tr>
	</table>
</div>

<!-- 리뷰 작성 -->
<div style="width:700px; height:300px; margin-top:200px; margin-left:600px;">
<img src="${path}/img/productestimate.png" 
		style="margin-left:250px; margin-bottom:20px; width:200px; height:55px;">
<form method="post" name="form2">
	<c:if test="${sessionScope.userid != null}">
		<input type="hidden" name="good_id" value="${dto.good_id}">		
		<textarea name="review" id="review"></textarea>
		<input type="button" class="btn" id="btnWrite" value="리뷰 작성"
			style="background-color:#384aec; color:white;">
	</c:if>
</form>
</div>
<!-- 상품별 리뷰 목록(댓글 형식) -->
<div id="reviewList"></div>
<script>
function review_list() {
	$.ajax({
		type: "get",
		url: "${path}/shop/review/list.do?good_id=${dto.good_id}",
		success: function(result) {
			$("#reviewList").html(result);
		}
	});
}
</script>

 <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <h2>연관 <span class="section-intro__style">상품</span></h2>
        </div>       
        
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product1.jpg" alt="">
              <ul class="card-product__imgOverlay">
                 <form name="form1" method="post" action="${path}/shop/goods/list2.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            
            
            
            
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product2.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <form name="form1" method="post" action="${path}/shop/goods/list4.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            <div class="card-body">
              <p>Beauty</p>
              <h4 class="card-product__title"><a href="single-product.html">Women Freshwash</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product3.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <form name="form1" method="post" action="${path}/shop/goods/list3.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
                  
              </ul>
            </div>
            <div class="card-body">
              <p>Decor</p>
              <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product4.jpg" alt="">
              <ul class="card-product__imgOverlay">
               <form name="form1" method="post" action="${path}/shop/goods/list4.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            <div class="card-body">
              <p>Decor</p>
              <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product5.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <form name="form1" method="post" action="${path}/shop/goods/list2.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product6.jpg" alt="">
              <ul class="card-product__imgOverlay">
               <form name="form1" method="post" action="${path}/shop/goods/list.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            <div class="card-body">
              <p>Beauty</p>
              <h4 class="card-product__title"><a href="single-product.html">Women Freshwash</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product7.jpg" alt="">
              <ul class="card-product__imgOverlay">
               <form name="form1" method="post" action="${path}/shop/goods/list.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            <div class="card-body">
              <p>Decor</p>
              <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            </div>
          </div>

          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${path}/img/product/product8.jpg" alt="">
              <ul class="card-product__imgOverlay">
               <form name="form1" method="post" action="${path}/shop/goods/list.do">
                  <li><button type="submit"><i class="ti-search">
                  	<input type="hidden" name="good_id" value="${row.good_id}">
                  	<input type="hidden" name="amount" value="1" >
                  </i></button></li>
                  </form>
              </ul>
            </div>
            <div class="card-body">
              <p>Decor</p>
              <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            </div>
          </div>
        </div>
      </div>
    </section> 
    
<%@ include file="../include/footer.jsp" %>
</body>
</html>