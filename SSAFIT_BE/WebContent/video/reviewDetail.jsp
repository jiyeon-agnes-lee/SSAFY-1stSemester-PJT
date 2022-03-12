<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSAFIT</title>
<style type="text/css">
body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

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

<title>SSAFIT</title>
</head>


<body>
	<!-- header -->
	<%@ include file="/common/header.jsp"%>

	<!-- main 시작-->
	<main class="flex-shrink-0">
		<div class="container">
			<br>
			<!-- 상세 페이지 제목 -->
			<p class="display-5 fw-bold" style="text-align: center">리뷰 상세</p>
			<hr>
			<!-- 본문 -->
			<table class="table table-hover text-center"
				style="border: 1px solid;">
				<colgroup>
					<col width="10%">
					<col width="auto">
					<col width="12%">
					<col width="13%">
					<col width="15%">
				</colgroup>
				<thead class="table-primary">
					<tr>
						<th scope="col">리뷰번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">${review.no}</th>
						<td>${review.title}</td>
						<td>${review.userName}</td>
						<td>${review.viewCnt}</td>
						<td>${review.date}</td>
					</tr>
				</tbody>
			</table>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="FormControlTextarea1"
					name="content" rows="3" readonly> ${review.content}</textarea>
			</div>
			<!-- 목록 버튼 -->
			<a class="btn btn-primary float-end"
				href="/ssafit/main?action=reviewRewriteCancel&videoNo=${review.videoNo}&videoId=${videoId}"
				role="button">목록</a>
			<!-- 리뷰 수정(로그인이 되어 있고 로그인 유저 네임과 현재 리뷰 유저 네임이 같을 경우만 리뷰 수정 버튼 표시 -->
			<c:if test="${!empty loginUser.name}">
				<c:if test="${review.userName eq loginUser.name}">
					<a class="btn btn-info float-end"
						style="margin-right: 5px; color: white;"
						href="/ssafit/main?action=reviewModify&no=${review.no}&videoId=${videoId}"
						role="button">리뷰 수정</a>
				</c:if>
			</c:if>
			<!-- 이전 버튼 -->
			<a class="btn btn-secondary " href="#" role="button">이전 글</a>
			<!-- 다음 버튼 -->
			<a class="btn btn-secondary " href="#" role="button">다음 글</a>

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
