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

<title>리뷰 상세 조회</title>
</head>


<body>
	<!-- header -->
	<%@ include file="/common/header.jsp"%>

	<!-- main 시작-->
	<main class="flex-shrink-0">
	<div class="container">
		<br>
		<!-- 상세 페이지 제목 -->
		<p class="display-5 fw-bold" style="text-align: center">운동영상 리뷰</p>
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
					<th scope="col">작성자 </th>
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
				name="content" rows="3"> ${review.content}</textarea>
		</div>
		<!-- 목록 버튼 -->
		<a class="btn btn-primary float-end" href="/ssafit/main?action=reviewRewriteCancel&videoNo=${review.videoNo}"
			role="button">목록</a>
		<!-- 리뷰 수정 -->
		<a class="btn btn-info float-end"
			href="/ssafit/main?action=reviewModify&no=${review.no}"
			role="button">리뷰 수정</a>
		<!-- 입력 버튼 -->
		<a class="btn btn-secondary " href="#" role="button">이전 글</a>
		<!-- 취소 버튼 -->
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


