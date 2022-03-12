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
		<h1>SSAFIT HOME</h1>
	</main>

	<!-- footer -->
	<%@ include file="/common/footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
