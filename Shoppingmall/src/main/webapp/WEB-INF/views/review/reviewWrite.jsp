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
		<title>Generic Page - Massively by HTML5 UP</title>
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
									<h2>리뷰남기기 ⭐</h2>
								</header>
								<form method="post" action="/shoppingmall/review/reviewWrite" id="frm" enctype="multipart/form-data">
									<input type="hidden" name="bnum" id="bnum" value="${product.pId}">
									<div class="row gtr-uniform">

										<div class="col-6 col-12-xsmall">
											<input type="text" placeholder="이름" name="name" id="name"  value="${sessionScope.sessid}" readonly="readonly"/>
										</div>
							
											
											
										<!-- Break -->
										<div class="col-12">
											<select name="grade" id="grade" required="required">
												<option value="">리뷰를 남겨주세요</option>
												<option value="10">🌕{1점}</option>
												<option value="15">🌕🌗{1.5점}</option>
												<option value="20">🌕🌕{2점}</option>
												<option value="25">🌕🌕🌗{2.5점}</option>
												<option value="30">🌕🌕🌕{3점}</option>
												<option value="35">🌕🌕🌕🌗{3.5점}</option>
												<option value="40">🌕🌕🌕🌕{4점}</option>
												<option value="45">🌕🌕🌕🌕🌗{4.5점}</option>
												<option value="50">🌕🌕🌕🌕🌕{5점}</option>
											</select>
										</div>
										
				
										<!-- Break -->
										<div class="col-12">
											<textarea placeholder="내용을 입력하세요" rows="6" name="comment" id="comment" required></textarea>
										</div>
										
											<div class="col-12">
											리뷰 이미지 : <input type="file" name="uploadFile" id="uploadFile">
											<hr>
											</div>
										
										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" value="작성하기" class="primary" /></li>
												<li><input type="reset" value="초기화" /></li>
											
											</ul>
											<a href="#" class="button primary small">목록</a>
										</div>
										
									</div>
								</form>
								

				

		
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