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
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/shoppingmall/resources/assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
									<h1>회원가입하기</h1>
								</header>
								<form method="post" action="/shoppingmall/member/insert" id="frm">
									<div class="form-group">
									  <label for="id"> Id:</label>
									  <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="mId" name="mId" required="required">
									  <button type="button" class="button small" id="idcheckBtn">중복확인</button>
									</div>
									<div class="form-group">
									  <label for="pwd">Password:</label>
									  <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="mPassword" name="mPassword" required="required">
									</div>
									<div class="form-group">
										<label for="pwd">Password Check:</label>
										<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="mPasswordCk" name="mPasswordCk" required="required" >
									  </div>
									  <div class="form-group">
										<div class="form-group">
											<label for="name">이름:</label>
											<input type="text" class="form-control" placeholder="이름을 입력하세요" id="mName" name="mName" required="required" >
										  </div>
										<label for="tel">전화번호:</label>
										<input type="tel" class="form-control" placeholder="전화번호를 입력하세요" id="mTel" name="mTel" required="required" >
									  </div>
									  <div class="form-group">
										<label for="email">이메일:</label>
										<input type="email" class="form-control" placeholder="이메일을 입력하세요" id="mEmail" name="mEmail" required="required" >
									  </div>

									  <div class="form-group">
										<label for="addr">주소:</label>
										<input type="text" class="form-control" placeholder="주소를 입력하세요" id="mAddress" name="mAddress" required="required" >
									  </div>

									<div class="col-12">
										<ul class="actions">
											<li><button type="button" class="primary" id="send">가입하기</button></li>
											 
										</ul>
									
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
<script>
$("#idcheckBtn").on("click",function(){
	window.open("idCheck","","width=700 height=250");//get방식
});

//유효성검사
$("#send").click(function(){
	if($("#mId").val()==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if($("#mPassword").val()==""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if($("#mPassword").val()!=$("#mPasswordCk").val()){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	$("#frm").submit();//input type=submit과 같은 역할
	
})
</script>
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