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
<title>리뷰 목록 조회</title>
</head>
<body>
	<h1>리뷰 목록 조회</h1>
	<c:if test="${!empty list }">
		<h2>지금까지 등록된 리뷰 수 : ${list.size() }</h2>
	</c:if>
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
			<c:forEach items="${list }" var="item">
				<tr>
					<td>${item.no }</td>
					<td>${item.title}</td>
					<td>${item.userName }</td>
					<td>${item.viewCnt }</td>
					<td>${item.date}</td>
				</tr>
			</c:forEach>

			<c:if test="${empty list }">
				<c:out value="입력된 리뷰가 없습니다."></c:out>
			</c:if>

		</tbody>
	</table>
	<a href="./video/reviewRegist.jsp">추가등록</a>
</body>
</html>
