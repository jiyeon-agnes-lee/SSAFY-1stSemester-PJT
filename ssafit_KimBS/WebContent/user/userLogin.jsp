<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSAFIT</title>
<style>
.list_corp {
	display: flex;
	flex-direction: row;
}

.corp_item {
	color: darkgray;
	margin-left: auto;
}

.corp_item>a {
	color: darkgray;
	text-decoration-line: none;
}

img {
	display: block;
	margin: 0px auto;
}

.pagination {
	justify-content: center;
}
</style>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body class="d-flex flex-column h-100">
	<!-- header -->
	<%@ include file="/common/header.jsp"%>

	<!-- main 시작-->
	<!-- 로그인 본문-->
	<main class="form-signin text-center">
		<!-- 로그인 페이지 제목 -->
		<br>
		<p class="display-5 fw-bold" style="text-align: center">로그인</p>
		<hr>
		<!-- 로그인 양식 -->
		<form method="POST" action="/ssafit/main">
			<!-- 폼에 필요한 입력값(자동 제공) -->
			<input type="hidden" name="action" value="login">
			<h2>
				<i class="bi bi-eye "></i>
			</h2>
			<br>
			<div class="form-floating mb-3 w-50 m-auto">
				<input type="text" class="form-control" id="userId" name="userId" value="${userId}"> 
				<label for="userId">아이디</label>
			</div>
			<div class="form-floating w-50 m-auto">
				<input type="password" class="form-control" id="userPassword"
					name="userPassword" value="${userPassword}"> <label
					for="userPassword">비밀번호</label>
			</div>
			<br>
			<div class="checkbox mb-3">
				<label> <input type="checkbox" id="remember-me"
					name="remember-me" value="1"> 로그인 정보 기억하기
				</label>
			</div>
			<c:if test="${msg != null}">
				<p style="color: red;">${msg }</p>
			</c:if>
			<button class="w-25 btn btn-lg btn-primary" type="submit">로그인</button>
			<input class="w-25 btn btn-lg btn-secondary" type="button"
				onClick="location.href='http://localhost:8080/ssafit/user/userRegist.jsp'"
				value="회원가입">
		</form>

	</main>
	<!-- main 끝-->

	<!-- footer -->
	<%@ include file="/common/footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<!-- End -->
