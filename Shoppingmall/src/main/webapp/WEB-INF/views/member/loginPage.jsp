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
		<title>로그인</title>
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
									<h1>로그인 하기</h1>
								</header>
								<form method="post" action="#">
									<div class="form-group">
									  <label for="id"> Id:</label>
									  <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="mId">
									</div>
									<div class="form-group">
									  <label for="pwd">Password:</label>
									  <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="mPassword">
									</div>
									<div class="col-12">
										<ul class="actions">
											<li><input type="button"  id="loginBtn" value="로그인하기" class="primary" /></li>	
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
	$("#loginBtn").click(function(){
		if($("#mId").val()==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if($("#mPassword").val()==""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		$.ajax({
			type:"post",
			url:"loginCheck",
			data:{"mId":$("#mId").val(),"mPassword":$("#mPassword").val()}
		})
		.done(function(resp){
			//alert(resp);
			//로그인 성공
			if(resp=="success"){
				alert("Welcome");
				location.href="/shoppingmall/";
				//아이디 오류--->회원가입으로
			}else if(resp=="fail"){
				alert("You're not a member. Please sign up.");
				location.href="/shoppingmall/member/joinPage";
				//아이디는 맞지만 비번 오류
			}else{
				alert("Please check your password.");
				$("#mPassword").val("");
			}
			
			
		})
		.fail(function(e){
			alert("실패:"+e)
		})		
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