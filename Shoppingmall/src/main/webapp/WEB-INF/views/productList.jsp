<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>상품 둘러보기</title>
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
						<hr><c:choose>
								<c:when test="${category eq 1}">
									<h2 align="center">의류</h2>		
								</c:when>
								<c:when test="${category eq 2}">
									<h2 align="center">신발</h2>		
								</c:when>
								<c:when test="${category eq 3}">
									<h2 align="center">스포츠</h2>		
								</c:when>
								<c:when test="${category eq 4}">
									<h2 align="center">생활가전</h2>		
								</c:when>
								<c:when test="${category eq 5}">
									<h2 align="center">도서</h2>		
								</c:when>
								<c:otherwise>
											
								</c:otherwise>
							</c:choose>
						
						<!-- Post -->
						<section class="posts">
								
							<c:forEach items="${productList}" var="product">
								<article>
										<header>
											<h2><a href="/shoppingmall/productDetail?pId=${product.pId}">${product.pName }</a></h2>
										</header>
											<span class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${product.regdate}" /></span>
										
										<c:if test="${product.bimg eq null }">
											<a href="/shoppingmall/productDetail?pId=${product.pId}" class="image fit"><img src="/shoppingmall/resources/images/images.png" width="400px" height="300px" alt="상품의 이미지 없음" /></a>
										</c:if>
										<c:if test="${product.bimg ne null }">
											<a href="/shoppingmall/productDetail?pId=${product.pId}" class="image fit"><img src="/shoppingmall/resources/productImg/${product.bimg }" width="400px" height="300px" alt="" name="상품이미지"/></a>
										</c:if>
										
										<b><a href="/shoppingmall/productDetail?pId=${product.pId}"></a>${product.pContent }</b><br>	
									   상품가격: <c:if test="${product.discount ne 0 }">
													<del class="price">${product.pPrice}</del>→<ins class="price">${product.pPrice*((100-product.discount)/100)}원 </ins> <b>(${product.discount}% 할인)</b>
												 </c:if>  
												 <c:if test="${product.discount eq 0}">
													<ins class="price">${product.pPrice}</ins>
												 </c:if> <br>
									   <c:if test="${product.recomendC ne null }">
									   상품소개 :${product.recomendC} 
									   </c:if>
									   
										<ul class="actions special">
											<c:if test="${product.pQTY eq 0}">
													<li><ins><h2>SOLD OUT!</h2></ins></li>
											</c:if>
											<c:if test="${product.pQTY > 0}">
												<li><a href="/shoppingmall/productDetail?pId=${product.pId}" class="button">구입하기</a></li>
											</c:if>	
										</ul>
								</article>	
							</c:forEach>

							
							
						</section>
						
						<footer>
						<div class="pagination">
							<c:if test="${pageDto.totalCount gt 0}">
								<%-- [이전] 출력 --%>
									<c:if test="${pageDto.startPage gt pageDto.pageBlock}">
										<a class="previous" href="productList?strPageNum=${pageDto.startPage - pageDto.pageBlock}&field=${field}&word=${word}">Prev</a>
									</c:if>
										
					
								<%-- 페이지 번호 --%>
									<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
										<c:choose>
											<c:when test="${pageScope.i eq requestScope.pageNum}">
												<a class="page" href="/shoppingmall/productList?strPageNum=${i}&field=${field}&word=${word}">${i}</a>
											</c:when>
											<c:otherwise>
												<a class="page" href="/shoppingmall/productList?strPageNum=${i}&field=${field}&word=${word}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
					
								<%-- [다음] 출력 --%>
									<c:if test="${ pageDto.endPage lt pageDto.pageCount}">
										<a class="next" href="/shoppingmall/productList?strPageNum=${pageDto.startPage + pageDto.pageBlock}&field=${field}&word=${word}">Next</a>
									</c:if>
							</c:if>
						</div>
						
						
						<div class="field" align="center">
							<form action="/shoppingmall/productList" method='get'>
								<input type="hidden" name="category" value="${category}">
								<ul class="actions small">
								<li><select name='field' >
										<option value="product"> 상품명</option>
										
									</select> </li>
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