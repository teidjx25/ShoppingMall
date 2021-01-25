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
		<title>상품등록</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/shoppingmall/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/shoppingmall/resources/assets/css/noscript.css" /></noscript>
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
								<header class="major">
									
									<h2>상품 등록하기</h2>
								</header>
								
							
								<form method="post" action="uploadProduct" id="frm" enctype="multipart/form-data">
									<div class="row gtr-uniform">

										<div class="col-6 col-12">
											상품 이름 : <input type="text" placeholder="상품을 입력하세요" name="pName" id="pName" required/>
										</div>

										<div class="col-6 col-12-xsmall">
											상품의 가격 : <input type="number" class="mobile" min="0" name="pPrice" id="pPrice"  required>
										</div>

										<div class="col-6 col-12">
											판매자 이름 : <input type="text" placeholder="이름" name="maker" id="maker" value="${sessionScope.sessid}" readonly="readonly"/>
										</div>
										<br>
										
																			
										<div class="col-12">
											상품 유형 : 
											<select name="productType" id="productType" required="required">
												<option value="">- 유형을 선택해주세요 -</option>
												<option value="1">일반</option>
												<option value="2">중고</option>
												
											</select>
										</div>
										
										
										<div class="col-12">
											상품 카테고리 : 
											<select name="category" id="category" required="required">
												<option value="">- Category -</option>
												<option value="1">옷</option>
												<option value="2">신발</option>
												<option value="3">스포츠</option>
												<option value="4">생활가전</option>
												<option value="5">도서</option>
											</select>
										</div>
										
										<div class="major">
										상품의 재고 : 
										<input type="number" class="mobile" min="0" name="pQTY"  id="pQTY" required>
										<hr>
										</div>

										
									   <div class="col-12">
										메인에 띄워둘 작은 추천문구를 입력하세요 : 
											<textarea placeholder="추천문구를 입력하세요 ex) #귀여운 #적절한 가격 #인스타용" rows="6" name="recomendC" id="recomendC" required></textarea>
										
										</div>
										<div class="col-12">
										소개글 : 
											<textarea placeholder="내용을 입력하세요" rows="6" name="pContent" id="pContent" required></textarea>
										
										</div>
										 
										<div class="col-12">
											상품 이미지 : <input type="file" name="uploadFile" id="uploadFile">
											<hr>
											</div>

										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" value="작성하기" class="primary" /></li>
												<li><input type="reset" value="초기화" /></li>
											
											</ul>
											<a href="/shoppingmall/" class="button primary small">목록</a>
										</div>
										
									</div>
								</form>
							
				

		
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
			<script src="/shoppingmall/resources/assets/js/jquery.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/browser.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/breakpoints.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/util.js"></script>
			<script src="/shoppingmall/resources/assets/js/main.js"></script>

	</body>
</html>