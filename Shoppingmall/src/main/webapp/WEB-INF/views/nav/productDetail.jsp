<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>

							<header class="major">
									<span class="date"><fmt:formatDate pattern="yyyy/MM/dd" value="${product.regdate}" /></span>
									
									<h3><c:if test="${product.productType eq 2}">[중고 상품]</c:if> ${product.pName}</h3>
								</header>
								<div class="container">
									
									<div class="left_con">
										
									
											
				
										<div class="image main">		
												<c:if test="${product.bimg eq null }">
													<img src="/shoppingmall/resources/images/images.png" width="1100" height="500" alt="상품의 이미지 없음" />
												</c:if>
												<c:if test="${product.bimg ne null }">
													<img src="/shoppingmall/resources/productImg/${product.bimg }" width="1100" height="500" alt="" name="상품이미지"/>
												</c:if>
										</div>
								
									</div>

									<div class="right_con">
										<header class="major">
											<c:if test="${product.pBuyCnt ne 0}">
												<i><ins><h3 style="color:#ff8c00">현재 ${product.pBuyCnt}명이 구입한 상품!</h3></ins></i>
											</c:if>
											<h3>상품가격:
												<c:if test="${product.discount ne 0 }">
													 <del class="price"><fmt:formatNumber value="${product.pPrice}" type="number" /></del>원 → 
													 <ins class="price"><fmt:formatNumber value="${product.pPrice*((100-product.discount)/100)}" type="number"/>원 </ins><br> <b>(${product.discount}% 할인)</b>
												 </c:if>  
												 <c:if test="${product.discount eq 0}">
													<ins class="price">${product.pPrice}</ins>
												 </c:if>
											</h3>
											<c:if test="${product.pQTY eq 0 }">
											모두 팔렸습니다.
											</c:if>
											<c:if test="${product.pQTY ne 0 }">
											<h3>남은 갯수 :${product.pQTY } </h3>
											</c:if>
											
											<h3><a href="#">평균 평점: 
										<c:if test="${reviewcount >0 }">	
										<c:choose>
										  <c:when test="${avgReview >= 10 && avgReview < 15 }">
										    🌕 
										  </c:when>
										  <c:when test="${avgReview >= 15 && avgReview < 20 }">
										    🌕🌗 
										  </c:when>
										  <c:when test="${avgReview >= 20 && avgReview < 25 }">
										    🌕🌕
										  </c:when>
										  <c:when test="${avgReview >= 25 && avgReview < 30 }">
										    🌕🌕🌗 
										  </c:when>
										  <c:when test="${avgReview >= 30 && avgReview < 35 }">
										    🌕🌕🌕
										  </c:when>
										  <c:when test="${avgReview >= 35 && avgReview < 40 }">
										    🌕🌕🌕🌗 
										  </c:when>
										  <c:when test="${avgReview >= 40 && avgReview < 45 }">
										    🌕🌕🌕🌕
										  </c:when>
										  <c:when test="${avgReview >= 45 && avgReview < 50 }">
										    🌕🌕🌕🌕🌗 
										  </c:when>
										  <c:when test="${avgReview eq 50 }">
										    🌕🌕🌕🌕🌕 
										  </c:when>
										
										</c:choose>(${avgReview/10}) (${reviewcount}명)
										</c:if>
										<c:if test="${reviewcount eq 0 }">
										평가 없음 (0)
										</c:if>
										
											</a></h3>
											<h3><a href="#">판매자 : ${product.maker }</a></h3>
											
											<c:if test="${product.pQTY eq 0 }">
												<ins><h2>SOLD OUT!</h2></ins>
											</c:if>
											<c:if test="${product.pQTY ne 0 }">
											<c:choose>
				      							<c:when test="${empty sessionScope.sessid}">
													<ins><h3>로그인 후 주문 할 수 있습니다.</h3></ins>
												</c:when>
												<c:otherwise>
													<form action="/shoppingmall/CartProduct" method="post">
														<input type="hidden" id="pId" name="pId" value="${product.pId }">
														<input type="hidden" id="mId" name="mId" value="${sessionScope.sessid }">
														<input type="hidden" id="pName" name="pName" value="${product.pName }">
														
															<h3>주문 갯수:<input type="number" onkeyup='printName()' id='cQTY'  name="cQTY" min="1" max="${product.pQTY }"/></h3>
															<h3>가격 : <span id='result'></span>원</h3>

														<button class="button primary small" style="padding :0px 20px">장바구니</button> <a href="/shoppingmall/buyProduct?pId=${product.pId }" class="button primary small" style="padding :0px 20px">구매하기</a>	
														</form>
														
													
											  		
												</c:otherwise>
											</c:choose>
	
												
											  	
											  	
											</c:if>
											<!--<button id="buybtn" style="padding :0px 20px">구매하기</button>-->

											
										</header>
									</div>
								</div>	
								<div>
									<h3>
										<a href="/shoppingmall/productDetail?pId=${product.pId}" style="padding :0px 20px">상품 설명</a>
										<a href="/shoppingmall/productReview?pId=${product.pId}" style="padding :0px 20px">리뷰</a>
										<a href="/shoppingmall/productQuestion?pId=${product.pId}" style="padding :0px 20px">문의 사항</a>
										<hr>
									</h3>
								</div>
								
								<script type="text/javascript">
								function printName()  {
								  const name = document.getElementById('cQTY').value;
								  document.getElementById("result").innerText = ${product.pPrice*((100-product.discount)/100) }*name;
								}

								</script>
								
								
								
								