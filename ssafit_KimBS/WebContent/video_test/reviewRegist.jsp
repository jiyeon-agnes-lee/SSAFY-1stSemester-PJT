<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	span {
		display: inline-block;
		width: 100px;
		text-align: left;
	}
</style>
<title>리뷰입력</title>
</head>
<body>
	<h1>리뷰입력</h1>
	<form method="POST" action="/ssafit/main">
		<fieldset>
			<legend> 리뷰 입력 </legend>
			<input type="hidden" name="action" value="reviewRegist"> 
			<span><label for="title">제목</label> </span>
			<input type="text" id="title" name="title">
			<br> 
			<span><label for="content">내용</label></span>
			<textarea id="content" name="content" rows="3"></textarea>
			<input type="hidden" id="userName" name="userName" value="ssafit">
			<input type="submit" value="등록">
			<input type="reset">
		</fieldset>
	</form>

</body>
</html>
