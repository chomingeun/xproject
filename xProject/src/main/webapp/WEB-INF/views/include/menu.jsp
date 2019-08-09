<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap" rel="stylesheet">

<style>
.header_area > ul,li,a {font-family: 'Noto Sans KR', 'Nanum Gothic'}
</style>

<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="${path}/"><img src="${path}/img/LOGO22.png"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" 
          		data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
          		aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent" style="letter-spacing:1px;">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">             
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" 
                	role="button" aria-haspopup="true" aria-expanded="false">팝니다</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="${path}/shop/goods/list.do">치즈</a></li>
                  <li class="nav-item"><a class="nav-link" href="${path}/shop/goods/list2.do">소스·향신료</a></li>
                  <li class="nav-item"><a class="nav-link" href="${path}/shop/goods/list3.do">오일·식초</a></li>
                  <li class="nav-item"><a class="nav-link" href="${path}/shop/goods/sale">할인품목</a></li>
                </ul>
			  </li>
              <li class="nav-item"><a class="nav-link" href="#">물어봐요</a></li>
              <li class="nav-item"><a class="nav-link" href="${path}/board/getBoardList">공지사항</a></li>
             <c:choose>
              <c:when test="${sessionScope.userid=='admin'}">             
               <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" 
                	role="button" aria-haspopup="true" aria-expanded="false">관리자</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="${path}/shop/goods/write.do">상품등록</a></li>
                  <li class="nav-item"><a class="nav-link" href="${path}/user/list.do">회원관리</a></li>                  
                </ul>
			  </li>               
              </c:when>
              <c:otherwise>
               <li class="nav-item"><a class="nav-link" href="${path}/shop/goodscart/mypage">구매내역</a></li>
              </c:otherwise>
             </c:choose>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button onclick="location.href='${path}/shop/goodscart/list.do'">
              		<i class="ti-shopping-cart"></i>
              		<span class="nav-shop__circle">0</span></button> 
              </li>
              <li class="nav-item">
              	<c:choose>
              		<c:when test="${sessionScope.userid==null}">
              			<a class="button button-header" href="${path}/user/login.do">로그인</a>
              			<a class="button button-header" href="${path}/user/signup.do">회원가입</a>
              		</c:when>
              		<c:otherwise>
						${sessionScope.name}님 | 
						<c:if test="${sessionScope.userid=='admin'}">
							<a href="${path}/chart/google_chart">구매동향</a> | 
						</c:if>		
						<c:if test="${sessionScope.userid!=null && sessionScope.userid!='admin'}">
							<a href="${path}/user/view.do?userid=${sessionScope.userid}">개인정보 수정</a> | 
						</c:if>							
						<a href="${path}/user/logout.do">로그아웃</a>
					</c:otherwise>
              	</c:choose>              	
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
</header>
