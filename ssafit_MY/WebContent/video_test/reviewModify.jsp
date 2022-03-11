<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>SSAFIT 리뷰 수정</h1>
	<form method="POST" action="main">
		<fieldset>
			<legend> 리뷰</legend>
			<input type="hidden" name="action" value="modify">
			<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" value="${review.title}">
			</div>
			<div>
			<label for="content">내용</label>
			<textarea id="content" name="content" > ${review.content}</textarea>
			</div>
			<input type="submit">
			<input type="reset">
		</fieldset>
	</form>
	



</body>
</html>