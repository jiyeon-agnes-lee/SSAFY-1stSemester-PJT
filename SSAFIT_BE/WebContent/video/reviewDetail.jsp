<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table {
		width: 100%; 
		border: 1px solid black;
		border-collapse: collapse;
	}
	thead {
		text-align : center;
	}
	th, tr, td {
		border: 1px solid black;
		padding: 10px;
	}
</style>
<meta charset="UTF-8">
<title>리뷰 상세 조회</title>
</head>
<body>
	<h1>리뷰 상세</h1>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>

				<tr>
					<td>${review.no }</td>
					<td>${review.title}</td>
					<td>${review.userName }</td>
					<td>${review.viewCnt }</td>
					<td>${review.date}</td>
				</tr>
		</tbody>
	</table>
	<!-- 주소가 좀 달라짐!!!!!!!!!!!!ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
	<a href="./video/reviewModify.jsp">리뷰 수정</a>
</body>
</html>


