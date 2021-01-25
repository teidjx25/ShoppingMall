<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

</html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<div>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/shoppingmall/productList?category=1">의류</a>
  <a href="/shoppingmall/productList?category=2">신발</a>
  <a href="/shoppingmall/productList?category=3">스포츠</a>
  <a href="/shoppingmall/productList?category=4">생활가전</a>
  <a href="/shoppingmall/productList?category=5">도서</a>
</div>

		<!-- Nav -->
			<nav id="nav">
				<ul class="links">
					<li ><a style="cursor:pointer" onclick="openNav()">&#9776; 카테고리</a></li>
					<c:choose>
				      	<c:when test="${productType eq 1 && promotion eq 1 && pState eq null}">
							<li class="active"><a href="/shoppingmall/">특별 할인 행사</a></li>
							<li><a href="/shoppingmall/productList?category=0">판매 물품 둘러보기</a></li>
							<li><a href="/shoppingmall/oldProductList">중고샵</a></li>
				      	</c:when>
				      	<c:when test="${productType eq 1 && promotion eq 0 && pState eq null}">
							<li><a href="/shoppingmall/">특별 할인 행사</a></li>
							<li class="active"><a href="/shoppingmall/productList?category=0">판매 물품 둘러보기</a></li>
							<li><a href="/shoppingmall/oldProductList">중고샵</a></li>
				      	</c:when>
				      	<c:when test="${productType eq 2 && promotion eq 0 && pState eq null}">
							<li><a href="/shoppingmall/">특별 할인 행사</a></li>
							<li><a href="/shoppingmall/productList?category=0">판매 물품 둘러보기</a></li>
							<li class="active"><a href="/shoppingmall/oldProductList">중고샵</a></li>
				      	</c:when>				      	
				      	<c:otherwise>
							<li><a href="/shoppingmall/">특별 할인 행사</a></li>
							<li><a href="/shoppingmall/productList?category=0">판매 물품 둘러보기</a></li>
							<li><a href="/shoppingmall/oldProductList">중고샵</a></li>					     	
				      	</c:otherwise>
				    </c:choose>

					<c:if test="${sessionScope.auth >= 1}">
						<li<c:if test="${manager ne null}"> class="active"</c:if>><a href="/shoppingmall/ProductManager">상품 관리하기</a></li>
					</c:if>
					<c:if test="${sessionScope.auth >= 2}">
						<li <c:if test="${pState ne null}"> class="active"</c:if> ><a href="/shoppingmall/ProductAdmin?pState=0">행사 상품 관리</a></li>
						
					</c:if>
					

				</ul>
				<ul class="icons">
					<c:choose>
				      	<c:when test="${empty sessionScope.sessid}">
					      	<!-- 세션이 없을때 -->
					      	
					      	<li><a class="label" href="/shoppingmall/member/loginPage">로그인</a></li>
					      	<li><a class="label" href="/shoppingmall/member/joinPage">회원가입</a></li>
				      	</c:when>
				      	<c:otherwise><!-- 세션이 있을때 -->
					      	<li><a class="label" href="/shoppingmall/member/logout">로그아웃</a></li>
					     	<li><a class="label" href="/shoppingmall/member/mypage">마이페이지</a></li>
					     	
				      	</c:otherwise>
				     </c:choose>
				</ul>
			</nav>


<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
</div>