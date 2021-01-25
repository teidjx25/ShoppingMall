<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

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
		<title>마이페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/shoppingmall/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/shoppingmall/resources/assetscss/noscript.css" /></noscript>
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
									
									<h2>마이페이지</h2>
								</header>
								<div class="mypage_container">
									
									<div class="left_con">
											<c:if test="${member.auth < 2}">
											<div class="image main"><img src="/shoppingmall/resources/images/${mClass}.png" alt="멤버쉽 사진" /></div>
											</c:if>
											<c:if test="${member.auth eq 2}">
											<div class="image main"><img src="/shoppingmall/resources/images/admin.png" alt="멤버쉽 사진" /></div>
											
											</c:if>
										
										<header class="major">
											<c:if test="${member.auth < 2}">
											<h3>고객님은 현재 <br> <b>${mClass}</b>등급입니다!</h3>
											<h4>고객님의 현재 포인트는 : ${member.mPoint} 점입니다.</h4>
											</c:if>
											<c:if test="${member.auth eq 2}">
											<h3>관리자님 환영합니다!</h3>
											
											</c:if>
										</header>
										<ul class="actions stacked">
											<li><a href="/shoppingmall/member/memberPage" class="button primary fit">회원 정보</a></li>
											<li><a href="/shoppingmall/ProductManager" class="button primary fit">판매 관리</a></li>
											<c:if test="${sessionScope.auth >= 2}">
												<li><a href="/shoppingmall/ProductAdmin?pState=0" class="button primary fit">상품 관리 (행사물품,일반 물품)</a></li>
											</c:if>
										</ul>
									</div>

									<div class="right_con">
										<header class="major">
											
											<h3>주문조회</h3>
											<div class="table-wrapper">
												<table class="alt">
													<thead>
														<tr>
															<th>번호</th>
															<th>운송장 번호</th>
															<th>금액</th>
															<th>날짜</th>
														</tr>
													</thead>
													<tbody>
													
													<c:forEach items="${orderList}" var="order">
														<tr>
															<td>${order.idbuyProduct}</td>
															<td><a href="/shoppingmall/member/orderDetail?num=${order.idbuyProduct}">${order.buyCode}</a></td>
															<td><fmt:formatNumber value="${order.totalPrice}" type="number"/>원</td>
															<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.regDate}" /></td>
														</tr>
													</c:forEach>

													</tbody>
													<tfoot>
														<tr>
															<td colspan="2"> 총 금액</td>
															<td><fmt:formatNumber value="${ttPrice}" type="number"/> 원</td>
														</tr>
													</tfoot>
												</table>
												
												<div class="pagination">
													<c:if test="${orderPageDto.totalCount gt 0}">
														<%-- [이전] 출력 --%>
															<c:if test="${orderPageDto.startPage gt orderPageDto.pageBlock}">
																<a class="previous" href="/shoppingmall/member/mypage?strOrderorderPageNum=${orderPageDto.startPage - orderPageDto.pageBlock}">Prev</a>
															</c:if>
														
									
														<%-- 페이지 번호 --%>
														<c:forEach var="i" begin="${orderPageDto.startPage}" end="${orderPageDto.endPage}" step="1">
															<c:choose>
																<c:when test="${pageScope.i eq requestScope.pageNum}">
																	<a class="page" href="/shoppingmall/member/mypage?strOrderorderPageNum=${i}" >${i}</a>
																</c:when>
																<c:otherwise>
																	<a class="page" href="/shoppingmall/member/mypage?strOrderorderPageNum=${i}">${i}</a>
																</c:otherwise>
															</c:choose>
														</c:forEach>
									
														<%-- [다음] 출력 --%>
														<c:if test="${ orderPageDto.endPage lt orderPageDto.pageCount}">
																<a class="next" href="/shoppingmall/member/mypage?strOrderorderPageNum=${orderPageDto.startPage + orderPageDto.pageBlock}">Next</a>
															</c:if>
														</c:if>
													</div>
											</div>
											
											
	
										</header>
									</div>
								</div>	

									
									

									<div class="right_con">
										<header class="major">
											
											<h3>장바구니</h3>
											<div class="table-wrapper">
												<table class="alt">
													<thead>
														<tr>
															<th>번호</th>
															<th>상품명</th>
															<th>금액</th>
															<th>수량</th>
															<th>상품재고</th>
															<th>삭제</th>
															
														</tr>
													</thead>
													<tbody>
														
													<c:forEach items="${cartList}" var="cart">
														<tr>
															<td>${cart.idcart}</td>
															<td>${cart.pName}</td>
															<td><fmt:formatNumber value="${cart.pPrice*((100-cart.discount)/100)}" type="number"/>원 * ${cart.cQTY} 개
															<fmt:formatNumber value="${cart.pPrice*((100-cart.discount)/100)*cart.cQTY}" type="number"/>원</td>
															<td>
																<form action="/shoppingmall/member/cartUpdate" method="post">
																	<input type="hidden" name="pId" value="${cart.pId}"/>
																	<input type="number" name="cQTY" value="${cart.cQTY}" min="0" max="${cart.pQTY}"/>
																	<button>장바구니 수정</button>
																</form>
															</td>
															<td>${cart.pQTY}</td>
															<td><a href="/shoppingmall/member/cartDeleteOne?pId=${cart.pId}">삭제</a></td>
															
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
												<div class="pagination">
													<c:if test="${cartPageDto.totalCount gt 0}">
														<%-- [이전] 출력 --%>
															<c:if test="${cartPageDto.startPage gt cartPageDto.pageBlock}">
																<a class="previous" href="/shoppingmall/member/mypage?strCartcartPageNum=${cartPageDto.startPage - cartPageDto.pageBlock}">Prev</a>
															</c:if>
														
									
														<%-- 페이지 번호 --%>
														<c:forEach var="i" begin="${cartPageDto.startPage}" end="${cartPageDto.endPage}" step="1">
															<c:choose>
																<c:when test="${pageScope.i eq requestScope.pageNum}">
																	<a class="page" href="/shoppingmall/member/mypage?strCartcartPageNum=${i}" >${i}</a>
																</c:when>
																<c:otherwise>
																	<a class="page" href="/shoppingmall/member/mypage?strCartcartPageNum=${i}">${i}</a>
																</c:otherwise>
															</c:choose>
														</c:forEach>
									
														<%-- [다음] 출력 --%>
														<c:if test="${ cartPageDto.endPage lt cartPageDto.pageCount}">
																<a class="next" href="/shoppingmall/member/mypage?strCartcartPageNum=${orderPageDto.startPage + orderPageDto.pageBlock}">Next</a>
															</c:if>
														</c:if>
													</div>
												<ul class="actions stacked">
													<li><a href="/shoppingmall/buyAllProduct" class="button primary fit">상품 전부주문</a></li>
													<li><a href="/shoppingmall/member/cartDeleteAll" class="button primary fit">상품 전부제거</a></li>
												</ul>
												
											</div>
			
											
	
										</header>

								</div>	
								
	
							</section>

					</div>

				<!-- Footer -->
					<%@ include file="../nav/footer.jsp"%>

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