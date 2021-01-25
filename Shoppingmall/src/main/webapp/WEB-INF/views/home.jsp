<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>K-yong</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/shoppingmall/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/shoppingmall/resources/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper" class="fade-in">

				<!-- Intro -->
					<div id="intro">
						<h1>welcome<br />
						K-yong</h1>
						<p>k-yong 매장에 오신것을 환영합니다. 편안한 쇼핑되시길 바랍니다.</p>
						<ul class="actions">
							<li><a href="#header" class="button icon solid solo fa-arrow-down scrolly">Continue</a></li>
						</ul>
					</div>

	
					<!-- Header -->
					<%@ include file="nav/topheader.jsp"%>
					<!-- Nav -->
					<%@ include file="nav/nav.jsp"%>

		
			<!-- Main -->
				<div id="main">

						<!-- Featured Post -->
							<article class="post featured">
								<header class="major">
									<span class="date">April 25, 2020</span>
									<h2><a href="#">신년맞이<br />
									특별할인!</a></h2>
									<div class="mainfont">
									<p><b>신년을 맞이하여 저희 회사에서 회원님들에게 제공하는 특별한 할인!<br />
									지금 놓치지 말고 특별한 할인과 함께 2021년 특별한 한 해를 보내세요!<br />
									2021년에도 k-yong은 당신과 함께하겠습니다.</b></p>
									</div>
								</header>
							<ul class="actions special">
									<li><a href="#" class="button large">상품 둘러보기</a></li>
								</ul>
							</article>

						<!-- Posts -->
							<section class="posts">
						
							<c:forEach items="${productList}" var="product">
								<article>
										<header>
											<h2><a href="/shoppingmall/productDetail?pId=${product.pId}">${product.pName }</a></h2>
										</header>
											<span class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${product.regdate}" /></span>
										
										<c:if test="${product.bimg eq null }">
											<a href="/shoppingmall/productDetail?pId=${product.pId}" class="image fit"><img src="/shoppingmall/resources/images/images.png" width="400px" height="300px" alt="상품의 이미지 없음" /></a>
										</c:if>
										<c:if test="${product.bimg ne null }">
											<a href="/shoppingmall/productDetail?pId=${product.pId}" class="image fit"><img src="/shoppingmall/resources/productImg/${product.bimg }" width="400px" height="300px" alt="" name="상품이미지"/></a>
										</c:if>
										
										<p><b>👍MD pick</b></p>
										<b>${product.pContent }</b><br>	
										
									   상품가격: <c:if test="${product.discount ne null }">
													<del class="price">${product.pPrice}</del>→<ins class="price">${product.pPrice*((100-product.discount)/100)}원 </ins> <b>(${product.discount}% 할인)</b>
												 </c:if>  
												 <c:if test="${product.discount eq null}">
													<ins class="price">${product.pPrice}</ins>
												 </c:if> 
												 <br>
									   <c:if test="${product.recomendC ne null }">
									   상품소개 :${product.recomendC} 
									   </c:if>
									   
										<ul class="actions special">
										
											<c:if test="${product.pQTY eq 0}">
												<li><ins><h2>SOLD OUT!</h2></ins></li>
											</c:if>
											<c:if test="${product.pQTY > 0}">
											<li><a href="/shoppingmall/productDetail?pId=${product.pId}" class="button">구입하기</a></li>
										</c:if>
										</ul>
								</article>	
							</c:forEach>
     							 
							</section>

						<!-- Footer -->
							<footer>
								<div class="pagination">
									<c:if test="${pageDto.totalCount gt 0}">
										<%-- [이전] 출력 --%>
											<c:if test="${pageDto.startPage gt pageDto.pageBlock}">
												<a class="previous" href="/shoppingmall/?strPageNum=${pageDto.startPage - pageDto.pageBlock}&field=${field}&word=${word}">Prev</a>
											</c:if>
										
					
										<%-- 페이지 번호 --%>
										<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
											<c:choose>
												<c:when test="${pageScope.i eq requestScope.pageNum}">
													<a class="page" href="/shoppingmall/?strPageNum=${i}&field=${field}&word=${word}">${i}</a>
												</c:when>
												<c:otherwise>
													<a class="page" href="/shoppingmall/?strPageNum=${i}&field=${field}&word=${word}">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
					
										<%-- [다음] 출력 --%>
										<c:if test="${ pageDto.endPage lt pageDto.pageCount}">
												<a class="next" href="/shoppingmall/?strPageNum=${pageDto.startPage + pageDto.pageBlock}&field=${field}&word=${word}">Next</a>
											</c:if>
										</c:if>
									</div>
							</footer>

					</div>
				<!-- Footer -->
					<%@ include file="nav/footer.jsp"%>



			</div>

		<!-- Scripts -->
			<script src="/shoppingmall/resources/assets/js/jquery.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/browser.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/breakpoints.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/util.js"></script>
			<script src="/shoppingmall/resources/assets/js/main.js"></script>

	</body>
</html>