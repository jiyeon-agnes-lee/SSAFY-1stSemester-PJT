<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<nav class="navbar navbar-dark bg-dark"
		aria-label="First navbar example">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">SSAFIT</a>
			
			<c:if test="${empty loginUser }">
				<input class="btn btn-primary" type="button"
					onClick="location.href='http://localhost:8080/ssafit/user/userLogin.jsp'"
					value="로그인">
			</c:if>
			<c:if test="${!empty loginUser }">
				<p style="color:white;">${loginUser.name }님 반갑습니다.</p>
				<input class="btn btn-secondary" type="button"
					onClick="location.href='http://localhost:8080/ssafit/main?action=logout'"
					value="로그아웃">
			</c:if>
			<button class="navbar-toggler collapsed" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample01"
				aria-controls="navbarsExample01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="navbarsExample01">
				<ul class="navbar-nav me-auto mb-2">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false">회원 정보</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="#">회원 정보 수정</a></li>
							<li><a class="dropdown-item" href="#">내가 쓴 리뷰</a></li>
							<li><a class="dropdown-item" href="#">내가 찜한 운동</a></li>
							<li><a class="dropdown-item" href="#">친구</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown02"
						data-bs-toggle="dropdown" aria-expanded="false">운동 영상</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="#">가장 많이 본 영상</a></li>
							<li><a class="dropdown-item" href="#">부위별 운동</a></li>
							<li><a class="dropdown-item" href="#">분할별 운동</a></li>
							<li><a class="dropdown-item" href="#">난이도별 운동</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">가까운 체육관</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">로그아웃</a></li>
				</ul>
				<form>
					<input class="form-control" type="text" placeholder="Search"
						aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
</header>
