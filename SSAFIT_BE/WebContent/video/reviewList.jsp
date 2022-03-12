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
	<main>
		<div class="container">
			<br>
			<!-- 제목 시작-->
			<p class="display-5 fw-bold" style="text-align: center">운동 영상 상세</p>
			<!-- 제목 끝-->
			<hr>

			<!-- 썸네일 시작-->
			<!-- 비디오 정보 가져오기 구현 필요-->
			<div class="m-auto" style="width: 300px;">
				<iframe src="https://www.youtube.com/embed/${videoId}"
					title="YouTube video player"></iframe>
			</div>

			<hr>
			<!-- 썸네일 끝-->

			<!-- 검색창과 글작성 시작-->
			<div class="d-flex justify-content-end">
				<form method="POST" action="main">
					<input type="hidden" name="action" value="moveReviewRegist">
					<input type="hidden" name="videoId" value="${videoId}">
					<input type="hidden" name="videoNo" value="${videoNo}">
					<button class="btn btn-outline-info d-inline" type="submit">
						글작성</button>
				</form>
			</div>
			<!-- 검색창과 글작성 끝-->
			<br>
			<!-- 리뷰 목록 시작-->
			<div>
				<c:if test="${empty list }">
					<c:out value="입력된 리뷰가 없습니다."></c:out>
				</c:if>
				<c:if test="${!empty list }">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="auto">
							<col width="12%">
							<col width="13%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="item">
								<tr>
									<th scope="row"><a
										style="text-decoration: none; color: black"
										href="/ssafit/main?action=reviewDetail&no=${item.no}&videoId=${videoId}">${item.reviewNo }</a></th>
									<td><a style="text-decoration: none; color: black"
										href="/ssafit/main?action=reviewDetail&no=${item.no}&videoId=${videoId}">${item.title}</a></td>
									<td><a style="text-decoration: none; color: black"
										href="/ssafit/main?action=reviewDetail&no=${item.no}&videoId=${videoId}">${item.userName }</a></td>
									<td><a style="text-decoration: none; color: black"
										href="/ssafit/main?action=reviewDetail&no=${item.no}&videoId=${videoId}">${item.viewCnt }</a></td>
									<td><a style="text-decoration: none; color: black"
										href="/ssafit/main?action=reviewDetail&no=${item.no}&videoId=${videoId}">${item.date}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:out value="total: ${list.size() }"></c:out>
				</c:if>
			</div>
			<!-- 리뷰 목록 끝-->
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
<!-- End -->
