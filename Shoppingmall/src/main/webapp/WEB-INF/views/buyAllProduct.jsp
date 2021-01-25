<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>상품 구매</title>
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
									
									<h2>상품 구매하기</h2>
								</header>
								
							
								<form action="/shoppingmall/buyProductAll"  method="post"  >
										
										<input type="hidden" id="buyId" name="buyId" value="${member.mId }">
										
										
										
								
									<div class="row gtr-uniform">
										
									
										<table class="alt">
													<thead>
														<tr>
															<th>상품 이름</th>
															<th>상품의 가격</th>
															<th>주문 갯수</th>
															<th>가격</th>
														</tr>
													</thead>
											<tbody>
														
											<c:forEach items="${pro}" var="product">
												<tr>
													<td>${product.pName }</td>
													<td><fmt:formatNumber value="${product.pPrice}" type="number" /></td>
													<td>${product.qQTY}</td>
													<td><fmt:formatNumber value="${product.qQTY*product.pPrice}" type="number" /></td>
												</tr>
											</c:forEach>
											</tbody>
													<tfoot>
														<tr>
															<td colspan="2"> 총 금액</td>
															<td><fmt:formatNumber value="${cttPrice}" type="number"/> 원</td>
														</tr>
													</tfoot>
										</table>
										
										
																			
										
										
										<div class="major">
										<h2>사용자 정보</h2><br>
										받는분 성함 : 
										<input type="text"  value="" name="buyName"  id="buyName" required>
										<hr>
										</div>
										
										<div class="col-12">
										받는분 전화번호 : 
											<input type="text"  value="${member.mTel }" name="buyTel"  id="buyTel" required>
										</div>
										<div class="col-12">
										받는분 주소 : 
											<input type="text"  value="${member.mAddress }" name="buyAddress"  id="buyAddress" required>
										</div>
										
										<div class="col-12">
										결제 : (1 입력)
											<input type="text"  name="buyCheck"  id="buyCheck" required>
										</div>
										
										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
											<c:if test="${cttPrice ne 0}">
												<li><input type="submit" value="작성하기" class="primary" /></li>
												<li><input type="reset" value="초기화" /></li>
											</c:if>
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