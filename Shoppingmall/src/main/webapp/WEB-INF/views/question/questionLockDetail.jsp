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
		<title>문의사항</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/shoppingmall/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/shoppingmall/resources/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<%@ include file="../nav/topheader.jsp"%>

				<!-- Nav -->
					<%@ include file="../nav/nav.jsp"%>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<section class="post">
								<header class="major">
									<span class="date">April 25, 2017</span>
									<h2>문의사항</h2>
								</header>
								
									<div class="row gtr-uniform">
											
										<div class="col-6 col-12"><hr>
											<h3>제목 : 잠긴글입니다.</h3>
											<hr>
										</div>
										<div class="col-6 col-12">
										<h3>문의 범위 : 
										<c:choose>
											<c:when test="${request.category eq 'product'}">
												[상품관련 문의]
											</c:when>
											<c:when test="${request.category eq 'shipping'}">
												[배송관련 문의]
											</c:when>
											<c:when test="${request.category eq 'service'}">
												[서비스관련 문의]
											 </c:when>
										</c:choose> 
										</h3> 
										</div>
										<div class="col-6 col-12-xsmall">
										<hr>
											<h3>작성자 :${request.name} </h3><hr>
										</div>
							
										<!-- Break -->
										<div class="col-12">

											<h3>내용 :</h3> 잠긴글입니다.
											 <hr>
										</div>
										<!-- Break -->
										<ul class="actions small">
											<li><a href="../productDetail_question.html" class="button primary small">목록</a></li>
											<li><a href="/shoppingmall/question/questionUpdate?qnum=${request.qnum}" class="button primary small">수정</a></li>
											<li><a href="/shoppingmall/question/questionDelete?qnum=${request.qnum}&pId=${request.bnum}" class="button primary small">삭제</a></li>
											<li><a href="questionReply.html" class="button primary small">답글</a></li>
										</ul>
										
									</div>

							</section>

					</div>

				<!-- Footer -->
					<%@ include file="../nav/footer.jsp"%>

				<!-- Copyright -->
					<div id="copyright">
						<ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
					</div>

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