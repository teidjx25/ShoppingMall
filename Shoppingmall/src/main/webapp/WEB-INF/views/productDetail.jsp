<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>상품 상세</title>
		<%@ include file="include/topheader.jsp"%>

	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<%@ include file="nav/topheader.jsp"%>

				<!-- Nav -->
					<%@ include file="nav/nav.jsp"%>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<section class="post">
	
								<%@ include file="nav/productDetail.jsp"%>
								
								<p>상품 설명</p>
								<c:if test="${product.pContent ne null }">
									<p>${product.pContent }</p>
								</c:if>  
								<c:if test="${product.pContent eq null}">
									<p>상품설명이 따로 없는 제품입니다.</p>
								</c:if>
								
								<ul class="actions small">
									<c:choose>
									    <c:when test="${empty sessionScope.sessid}">
										      	<!-- 세션이 없을때 -->
										      	<li><a class="label" href="/shoppingmall/member/loginPage">로그인 하셔야 글을 쓰실수 있습니다</a></li>
									      	</c:when>
									      	<c:otherwise><!-- 세션이 있을때 -->
										      	<li><a href="/shoppingmall/review/reviewWrite?pId=${product.pId}" class="button primary small">리뷰 작성하기</a></li>
									      		<li><a href="/shoppingmall/question/questionWrite?pId=${product.pId}" class="button primary small">문의 작성하기</a></li>
									      </c:otherwise>
									 </c:choose>								
									<c:if test="${sessionScope.sessid eq product.maker}">
										<li><a href="productUpdate?pId=${product.pId}" class="button primary small">글 수정하기</a></li>
										<li><a href="productDelete?pId=${product.pId}" class="button primary small">글 삭제하기</a></li>
									</c:if>
								</ul>
	
							</section>

					</div>

				<!-- Footer -->
					<%@ include file="nav/footer.jsp"%>
				<!-- Copyright -->
					<div id="copyright">
						<ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
					</div>

			</div>

		<!-- Scripts -->
	
			
				   
			

	</body>
</html>