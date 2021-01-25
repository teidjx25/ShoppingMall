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
		<title>리뷰페이지</title>
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
						
							<div>

							<c:forEach items="${ReviewList}" var="review">
							
								<div class="container" >
								<div style="background-color: lightgray">
									 	<c:if test="${review.reviewImg eq null || review.reLev eq 555}">
											<img src="/shoppingmall/resources/images/noReview.jpg" alt="리뷰사진" width="300" height="250"/>
										</c:if>
										<c:if test="${review.reviewImg ne null && review.reLev eq 0}">
											<img src="/shoppingmall/resources/reviewImg/${review.reviewImg }" alt="리뷰사진" width="300" />
										</c:if>
										 
								</div>
								<div style="background-color: lightgray">		
										<h3 <c:if test="${review.reLev eq 555}"> style="color:red" </c:if> >
										<c:if test="${review.reLev eq 555}"> [비공개 처리됨] </c:if>id: ${review.name }</h3>
										<h3 >평점:
										<c:choose>
										  <c:when test="${review.grade eq 10 }">
										    🌕
										  </c:when>
										  <c:when test="${review.grade eq 15 }">
										    🌕🌗
										  </c:when>
										  <c:when test="${review.grade eq 20 }">
										    🌕🌕
										  </c:when>
										  <c:when test="${review.grade eq 25 }">
										    🌕🌕🌗
										  </c:when>
										  <c:when test="${review.grade eq 30 }">
										    🌕🌕🌕
										  </c:when>
										  <c:when test="${review.grade eq 35 }">
										    🌕🌕🌕🌗
										  </c:when>
										  <c:when test="${review.grade eq 40 }">
										    🌕🌕🌕🌕
										  </c:when>
										  <c:when test="${review.grade eq 45 }">
										    🌕🌕🌕🌕🌗
										  </c:when>
										  <c:otherwise>
										 	🌕🌕🌕🌕🌕
										  </c:otherwise>
										</c:choose>
										(${review.grade/10 })
									</h3> 
									<c:if test="${review.reLev eq 0 || sessionScope.auth>1}">
										<h5>평가: ${review.comment }</h5>
									</c:if>
									<c:if test="${review.reLev eq 555 && sessionScope.auth<2}">
										<h5>평가: 🚫의도가 부적절 하여 관리자가 삭제한 게시글입니다.  </h5>
									</c:if>				
										<c:if test="${sessionScope.sessid eq review.name}">
											<a href="/shoppingmall/review/reviewUpdate?cnum= ${review.cnum }" class="button small">수정</a>
											<a href="/shoppingmall/review/reviewDelete?cnum= ${review.cnum }&pId=${product.pId}" class="button small">삭제</a>
											
										<c:if test="${sessionScope.auth eq 2}">	
											<a href="/shoppingmall/review/reviewAdminDelete?cnum=${review.cnum }&pId=${product.pId}&reLev=555" class="button small">글 비공개</a>
											<a href="/shoppingmall/review/reviewAdminDelete?cnum=${review.cnum }&pId=${product.pId}&reLev=0" class="button small">글 공개</a>
										</c:if>
										</c:if>
									
									
								</div><br>
							</div>	
							</c:forEach>
							</div >
							<right>
							<ul class="actions small">
								<c:choose>
								    <c:when test="${empty sessionScope.sessid}">
									      	<!-- 세션이 없을때 -->
									      	<li><a class="label" href="/shoppingmall/member/loginPage">로그인 하셔야 글을 쓰실수 있습니다</a></li>
								      	</c:when>
								      	<c:otherwise><!-- 세션이 있을때 -->
									      	<li><a href="/shoppingmall/review/reviewWrite?pId=${product.pId}" class="button primary small">리뷰 작성하기</a></li>
								      </c:otherwise>
								 </c:choose>
								
							</ul>
							</right>
						

							</section>
						<footer>
						<div class="pagination">
							<c:if test="${pageDto.totalCount gt 0}">
								<%-- [이전] 출력 --%>
									<c:if test="${pageDto.startPage gt pageDto.pageBlock}">
										<a class="previous" href="productReview?strPageNum=${pageDto.startPage - pageDto.pageBlock}&pId=${product.pId}">Prev</a>
									</c:if>
										
					
								<%-- 페이지 번호 --%>
									<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
										<c:choose>
											<c:when test="${pageScope.i eq requestScope.pageNum}">
												<a class="page" href="/shoppingmall/productReview?strPageNum=${i}&pId=${product.pId}">${i}</a>
											</c:when>
											<c:otherwise>
												<a class="page" href="/shoppingmall/productReview?strPageNum=${i}&pId=${product.pId}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
					
								<%-- [다음] 출력 --%>
									<c:if test="${ pageDto.endPage lt pageDto.pageCount}">
										<a class="next" href="/shoppingmall/productReview?strPageNum=${pageDto.startPage + pageDto.pageBlock}&pId=${product.pId}">Next</a>
									</c:if>
							</c:if>
							</div>
							<div class="field" align="center">
								<form action="/shoppingmall/oldproductList" method='get'>
								<ul class="actions small">
									<li>
										<select name='field' >
											<option value="product"> 상품명</option>
											<option value="price">가격</option>		
										</select> 
									</li>
									<li><input type='text' name='word'></li>
									<li><button type="submit" class="button primary icon solid fa-search">검색</button></li>
								</ul>						
								</form>
							</div >
						</footer>
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