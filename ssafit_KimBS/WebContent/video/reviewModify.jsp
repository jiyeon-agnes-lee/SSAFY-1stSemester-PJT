<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style type="text/css">
table {
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}

thead {
	text-align: center;
}

th, tr, td {
	border: 1px solid black;
	padding: 10px;
}

body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.list_corp {
	display: flex;
	flex-direction: row;
	/* justify-content: center; */
}

.corp_item {
	/* width: 10px; */
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

<title>SSAFIT 리뷰 수정</title>
</head>


<body>
	<!-- header -->
	<%@ include file="/common/header.jsp"%>

	<!-- 리뷰수정페이지 본문 -->
	<main class="flex-shrink-0">
	<div class="container">
		<form method="POST" action="main">
			<input type="hidden" name="action" value="reviewRewrite">
			<input type="hidden" name="no" value="${review.no}"> <br>
			<!-- 리뷰 수정 페이지 제목 -->
			<p class="display-5 fw-bold" style="text-align: center">리뷰 수정</p>
			<hr>
			<!-- 입력 창 -->
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> <input type="text"
					class="form-control" id="title" name="title"
					value="${review.title}">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" id="content" name="content" rows="3">${review.content}</textarea>
			</div>
			<!-- 입력 버튼 -->
			<button class="btn btn-primary" type="submit">수정</button>
			<!-- 삭제 버튼 -->
			<input class="btn btn-primary" type="button"
				onClick="location.href='<c:url value='/main'/>?action=reviewDelete&no=${review.no}'" value="삭제">
			<!-- 취소 버튼 -->
			<a class="btn btn-danger " href="/ssafit/main?action=reviewRewriteCancel&videoNo=${review.videoNo}"
				role="button">취소</a>
		</form>

	</div>
	</main>
	<!-- main 끝-->

	<!-- footer -->
	<%@ include file="/common/footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


