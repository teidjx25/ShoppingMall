<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
	<head>
		<title>상품 관리</title>
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
						<hr>
						<!-- Post -->
						<div><a href="/shoppingmall/ProductAdmin?pState=0" class="button primary small" >행사 물품 등록하기</a>
						<a href="/shoppingmall/ProductAdmin?pState=1" class="button primary small" >행사 물품 제거하기</a></div>
						
						<div class="field" align="center">
							<form action="/shoppingmall/ProductManager" method='get'>
							<input type="hidden" name="category" value="${category}">
								<ul class="actions small">
									<li>
										<select name='field' >
											<option value="maker"> 메이커</option>	
											<option value="product"> 상품명</option>	
										</select> 
									</li>
									<li><input type='text' name='word'></li>
									<li><button type="submit" class="button primary icon solid fa-search">검색</button></li>
								</ul>						
								</form>
							</div >		
								<c:forEach items="${productList}" var="product">
								<div class="container">
										
										<div style="padding: 0px 50px">
										<c:if test="${product.bimg eq null }">
											<a href="/shoppingmall/productDetail?pId=${product.pId}" class="image fit"><img src="/shoppingmall/resources/images/images.png" width="400px" height="300px" alt="상품의 이미지 없음" /></a>
										</c:if>
										<c:if test="${product.bimg ne null }">
											<a href="/shoppingmall/productDetail?pId=${product.pId}" class="image fit"><img src="/shoppingmall/resources/productImg/${product.bimg }" width="400px" height="300px" alt="" name="상품이미지"/></a>
										</c:if>
										</div>

										<div>
										<header>
											<h2><a href="/shoppingmall/productDetail?pId=${product.pId}"><c:if test="${product.productType eq 2}">[중고]</c:if>${product.pName }</a></h2>
										</header>
										
											<span class="date">등록날짜:<fmt:formatDate pattern="yyyy/MM/dd" value="${product.regdate }" /></span>	
									   <br>상품가격: <c:if test="${product.discount ne 0 }">
													<del class="price">${product.pPrice}</del>→<ins class="price">${product.pPrice*((100-product.discount)/100)}원 </ins> <b>(${product.discount}% 할인)</b>
												 </c:if>  
												 <c:if test="${product.discount eq 0}">
													<ins class="price">${product.pPrice}</ins>
												 </c:if> <br>
									   <c:if test="${product.recomendC ne null }">
									   상품 메이커 : ${product.maker} <br>
									   상품 카테고리 : <b><ins>
									   	<c:choose>
											<c:when test="${product.category eq 1}">
												[옷]
											</c:when>
											<c:when test="${product.category eq 2}">
												[신발]
											</c:when>
											<c:when test="${product.category eq 3}">
												[스포츠]
											 </c:when>
											 <c:when test="${product.category eq 4}">
												[생활가전]
											 </c:when>
											 <c:when test="${product.category eq 5}">
												[도서]
											 </c:when>
										</c:choose></ins></b> <br>
										
									   상품 남은 재고 : ${product.pQTY}  <br>
									   전면 광고 글 : ${product.recomendC} <br>
									   </c:if >

											<input type="hidden" id="pId" name="pId" value="${product.pId }">
											
	
											<c:choose>
												<c:when test="${product.promotion < 1}">
													<a href="AdminPromotion?pId=${product.pId}&strPageNum=${pageDto.startPage}&field=${field}&pState=${pState}&word=${word}" class="button primary small" >행사상품으로 등록하기</a>
												</c:when>
												<c:otherwise>
													<a href="AdminNotPromotion?pId=${product.pId}&strPageNum=${pageDto.startPage}&field=${field}&pState=${pState}&word=${word}" class="button primary small" >행사상품에서 제거하기</a>
												</c:otherwise>
											</c:choose>


											<a href="AdminDelete?pId=${product.pId}&strPageNum=${pageDto.startPage}&field=${field}&pState=${pState}&word=${word}" class="button primary small" >부적절한 게시글 제거하기</a>
									   
									  
									   </div>
								</div>
							</c:forEach>
							


						
						<footer>
						<div class="pagination">
							<c:if test="${pageDto.totalCount gt 0}">
								<%-- [이전] 출력 --%>
									<c:if test="${pageDto.startPage gt pageDto.pageBlock}">
										<a class="previous" href="/shoppingmall/ProductAdmin?pState=${pState}&strPageNum=${pageDto.startPage - pageDto.pageBlock}&field=${field}&word=${word}">Prev</a>
									</c:if>
										
					
								<%-- 페이지 번호 --%>
									<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
										<c:choose>
											<c:when test="${pageScope.i eq requestScope.pageNum}">
												<a class="page" href="/shoppingmall/ProductAdmin?pState=${pState}&strPageNum=${i}&field=${field}&word=${word}">${i}</a>
											</c:when>
											<c:otherwise>
												<a class="page" href="/shoppingmall/ProductAdmin?pState=${pState}&strPageNum=${i}&field=${field}&word=${word}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
					
								<%-- [다음] 출력 --%>
									<c:if test="${ pageDto.endPage lt pageDto.pageCount}">
										<a class="next" href="/shoppingmall/ProductAdmin?pState=${pState}&strPageNum=${pageDto.startPage + pageDto.pageBlock}&field=${field}&word=${word}">Next</a>
									</c:if>
							</c:if>
							</div>

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