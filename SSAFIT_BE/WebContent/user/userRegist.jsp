<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="d-flex flex-column h-100">
	<!-- header -->
	<%@ include file="/common/header.jsp"%>

	<main class="flex-shrink-0">
		<form method="POST" action="/ssafit/main">
			<!-- 폼에 필요한 입력값(자동 제공) -->
			<input type="hidden" name="action" value="userRegist">
			<div class="container">
				<br>
				<!-- 리뷰 입력 페이지 헤더 -->
				<p class="display-5 fw-bold" style="text-align: center">회원가입</p>
				<hr>

				<!-- 입력 창 -->
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">아이디</label>
					<input type="text" class="form-control" id="FormControlInput1 id"
						name="id" placeholder="아이디를 입력하세요">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput2" class="form-label">비밀번호</label>
					<input type="password" class="form-control"
						id="FormControlInput2 password" name="password"
						placeholder="비밀번호를 입력하세요(8~14자리 영문대소문자, 숫자 포함)">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput3" class="form-label">이름(닉네임)</label>
					<input type="text" class="form-control" id="FormControlInput3 name"
						name="name" placeholder="닉네임으로 사용할 이름을 입력하세요">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput4" class="form-label">이메일</label>
					<input type="text" class="form-control"
						id="FormControlInput4 email" name="email" placeholder="이메일을 입력하세요">
				</div>

				<div class="mb-3">
					<label for="exampleFormControlInput5" class="form-label">나이</label>
					<input type="number" class="form-control"
						id="FormControlInput5 age" name="age" placeholder="나이를 입력하세요">
				</div>
				<div class="mb-3 text-center">
					<!-- 입력 버튼 -->
					<input class="btn btn-primary w-25 m-auto btn-lg" type="submit"
						value="가입"> 
					<input class="btn btn-danger  w-25 m-auto btn-lg" type="reset" value="취소">
				</div>
			</div>
		</form>
	</main>

	<!-- footer -->
	<%@ include file="/common/footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
