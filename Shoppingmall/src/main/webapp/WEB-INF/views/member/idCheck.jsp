<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id 체크</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="panel-body">
	<form>
		<div class="form-group">
			<label for="text">ID : </label> 
			<input type="text" class="form-control" id="mId" placeholder="Enter Id" name="mId">
		</div>
		<button type="button" class="btn btn-default" id="checkBtn">사용여부</button>
	</form>
	</div>
	<script>
		$("#checkBtn").click(function() {
			if ($("#mId").val() == "") {
				alert("아이디를 입력하세요");
				return false;
			}

			$.ajax({
				type : "post",
				url : "idCheck",
				data : {
					"mId" : $("#mId").val()
				}
			}).done(function(resp) {
				//alert(resp);
				if (resp == "success") {
					alert("사용가능");
					$(opener.document).find("#mId").val($("#mId").val());
					self.close();
				} else {
					alert("사용불가능");
					$("#mId").val("");
				}
			}).fail(function(error) {
				alert("실패:"+error);
				
			})

		})
	</script>
</body>
</html>