<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>주문 상세</title>
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
									<h2>주문 상세</h2>
								</header>
										<div class="image main">		
												<c:if test="${product.bimg eq null }">
													<img src="/shoppingmall/resources/images/images.png" width="1100" height="500" alt="상품의 이미지 없음" />
												</c:if>
												<c:if test="${product.bimg ne null }">
													<img src="/shoppingmall/resources/productImg/${product.bimg }" width="1100" height="500" alt="" name="상품이미지"/>
												</c:if>
										</div>
										<div class="col-6 col-12">
											<h4>상품이름 : ${product.pName}</h4>
											
											<h4>주문 갯수 : ${order.buyNum}</h4>
										
											<h4>주문 날짜 : ${order.regDate}</h4>
											
											
											<h4>총 주문가격 : ${order.totalPrice}</h4>
										
											<hr>
												<h4>성함 : ${order.buyName}</h4>
												<h4>배송지 :${order.buyAddress} </h4>
												<h4>연락번호 :${order.buyTel} </h4>
												<h4>배송 코드 : ${order.buyCode}</h4>
												
											<hr>
										</div>
							
										<!-- Break -->

										<!-- Break -->
										<ul class="actions small">
											<li><a href="/shoppingmall/member/mypage" class="button primary small">목록</a></li>
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