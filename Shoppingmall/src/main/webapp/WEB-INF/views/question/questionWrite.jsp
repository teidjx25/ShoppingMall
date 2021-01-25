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
									<h2>문의사항 작성하기</h2>
								</header>
								<form method="post" action="/shoppingmall/question/questionWrite" id="frm" enctype="multipart/form-data">
									<input type="hidden" name="bnum" id="bnum" value="${product.pId}">
									<input type="hidden" name="password" id="password" value="">
									
									<div class="row gtr-uniform">

										<div class="col-6 col-12">
											<input type="text" placeholder="제목을 입력하세요" name="title" id="title" value=""  required/>
										</div>
										<div class="col-6 col-12-xsmall">
											<input type="text" placeholder="이름" name="name" id="name" value="${sessionScope.sessid}" readonly="readonly"/>
										</div>
										<div class="col-6 col-12-small">
												<input type="checkbox" id="demo-copy" name="state" value="1">
												<label for="demo-copy">비밀글로 하시겠습니까</label>
										</div>
				
										<!-- Break -->
										<div class="col-12">
											<select name="category" id="category" required="required">
												<option value="">- Category -</option>
												<option value="product">상품관련</option>
												<option value="shipping">배송관련</option>
												<option value="service">서비스관련</option>
												
											</select>
										</div>
										
				
										<!-- Break -->
										<div class="col-12">
											<textarea placeholder="내용을 입력하세요" rows="6" name="contents" id="contents" required></textarea>
										</div>
										
										<div class="col-12">
											문의사항 이미지 : <input type="file" name="uploadFile" id="uploadFile">
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