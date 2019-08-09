<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="include/header.jsp" %>
	<title>슈퍼마켙!</title>
</head>
<body>
<%@ include file="include/menu.jsp" %>

<c:if test="${message=='success'}">
	<script>
		alert("환영합니다.");
	</script>
</c:if>
<c:if test="${param.message=='nologin'}">
	<script>
		alert("로그인 후 이용 가능합니다.");
	</script>			
</c:if>	
<c:if test="${param.message=='restrict'}">
	<script>
		alert("접근권한이 없습니다.");
	</script>			
</c:if>
<c:if test="${param.message=='alreadylogin'}"></c:if>

<main class="site-main">       
    <section class="hero-banner">
      <div class="container">
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block">
            <div class="hero-banner__img">
              <img class="img-fluid" src="${path}/img/puttanesca.png">
            </div>
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
              <h4 style="letter-spacing:3px;">Shop is fun</h4>
              <h1 style="letter-spacing:3px;">Safe, healthy Premium Product</h1>
              <p style="letter-spacing:1px;">Responsible for your safe and healthy meal, 
              	<strong style="font-size:20px;">슈퍼마켙</strong>
              </p>
              </div>
          </div>
        </div>
      </div>
    </section>    
    <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="${path}/img/home/삼계탕.jpg" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <p>삼계탕</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="${path}/img/home/베이컨명란파스타.jpg" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <p>베이컨명란파스타</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="${path}/img/home/낙지철판볶음.jpg" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <p>낙지철판볶음</p>
          </a>
        </div>
		<div class="hero-carousel__slide">
          <img src="${path}/img/home/두부제육김치.jpg" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <p>두부제육김치</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="${path}/img/home/김치찌개.jpg" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <p>김치찌개</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="${path}/img/home/파스타.jpg" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <p>파스타</p>
          </a>
        </div>
      </div>
    </section>
    
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Best <span class="section-intro__style">Sellers</span></h2>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
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
              <h4 class="card-product__title"><a href="#"></a></h4>
            </div>
          </div>
        </div>
      </div>
    </section>   
</main>  
<%@ include file="include/footer.jsp" %>
</body>
</html>
