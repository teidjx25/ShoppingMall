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
					<%@ include file="nav/topheader.jsp"%>

				<!-- Nav -->
				<%@ include file="nav/nav.jsp"%>

				<!-- Main -->
					<div id="main">

					<!-- Post -->
							<section class="post">
								<%@ include file="nav/productDetail.jsp"%>

								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>아이디</th>
												<th>날짜</th>
												
											</tr>
										</thead>
										<tbody>
										
										
											<c:forEach items="${RequestList}" var="request">
												<tr>
													<td>${request.qnum}</td>
													
													<c:if test="${request.state eq 0}">
														<td><c:if test="${request.reLev eq 1}">
															<span>&nbsp;&nbsp;</span><img alt="" src="/shoppingmall/resources/images/re.gif">
															</c:if>
															<a href="/shoppingmall/question/questionDetail?qnum=${request.qnum}&maker=${product.maker }">
														<c:choose>
															  <c:when test="${request.category eq 'product'}">
															    [상품]
															  </c:when>
															   <c:when test="${request.category eq 'shipping'}">
															    [배송]
															  </c:when>
															  <c:when test="${request.category eq 'service'}">
															    [서비스]
															  </c:when>
														</c:choose> ${request.title}</a></td>
													</c:if>
													<c:if test="${request.state eq 1}">
														<td><a href="/shoppingmall/question/questionDetail?qnum=${request.qnum}&maker=${product.maker }">🔒잠긴글입니다.</a></td>
													</c:if>
													<c:if test="${request.state eq 2}">
														<td><a href="/shoppingmall/question/questionDetail?qnum=${request.qnum}&maker=${product.maker }">🚫부적절한 글입니다.</a></td>
													</c:if>
													<td>${request.name}</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${request.qRdate}" /></td>
													
												</tr>
											</c:forEach>	
		
										</tbody>
										
									</table>
									<div class="pagination">
									<c:if test="${pageDto.totalCount gt 0}">
										<%-- [이전] 출력 --%>
											<c:if test="${pageDto.startPage gt pageDto.pageBlock}">
												<a class="previous" href="/shoppingmall/productQuestion?strPageNum=${pageDto.startPage - pageDto.pageBlock}&pId=${product.pId}">Prev</a>
											</c:if>
										
					
										<%-- 페이지 번호 --%>
										<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
											<c:choose>
												<c:when test="${pageScope.i eq requestScope.pageNum}">
													<a class="page" href="/shoppingmall/productQuestion?strPageNum=${i}&pId=${product.pId}">${i}</a>
												</c:when>
												<c:otherwise>
													<a class="page" href="/shoppingmall/productQuestion?strPageNum=${i}&pId=${product.pId}">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
					
										<%-- [다음] 출력 --%>
										<c:if test="${ pageDto.endPage lt pageDto.pageCount}">
												<a class="next" href="/shoppingmall/productQuestion?strPageNum=${pageDto.startPage + pageDto.pageBlock}&pId=${product.pId}">Next</a>
											</c:if>
										</c:if>
									</div>
								</div>

								<ul class="actions small">
									<c:choose>
								      	<c:when test="${empty sessionScope.sessid}">
									      	<!-- 세션이 없을때 -->
									      	<li><a class="label" href="/shoppingmall/member/loginPage">로그인 하셔야 글을 쓰실수 있습니다</a></li>
									      	
									      	
								      	</c:when>
								      	<c:otherwise><!-- 세션이 있을때 -->
									      	<li><a href="/shoppingmall/question/questionWrite?pId=${product.pId}" class="button primary small">문의 작성하기</a></li>

								      	</c:otherwise>
								     </c:choose>
									
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
			<script src="/shoppingmall/resources/assets/js/jquery.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/browser.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/breakpoints.min.js"></script>
			<script src="/shoppingmall/resources/assets/js/util.js"></script>
			<script src="/shoppingmall/resources/assets/js/main.js"></script>

	</body>
</html>