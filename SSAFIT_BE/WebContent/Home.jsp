<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<title>Document</title>
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
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>

<body class="d-flex flex-column h-100">
	<!-- header -->
	<header>
		<nav class="navbar navbar-dark bg-dark"
			aria-label="First navbar example">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">SSAFIT</a>
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
	<!-- 본문 -->
	<main class="flex-shrink-0"> <!-- Top화면 시작-->
	<section class="py-3 text-center container">
		<div class="row py-lg-3">
			<div class="col-lg-6 col-md-8 mx-auto">
				<div id="carouselExampleControlsTop" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="./image/youtube6.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="./image/youtube7.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="./image/youtube8.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="./image/굽은등 운동.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="./image/프로틴드링크.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControlsTop" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControlsTop" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<p>
					<a href="#" class="btn btn-outline-secondary my-2">이벤트 이동</a>
				</p>
			</div>
		</div>
	</section>
	<!-- Top화면 끝--> <!-- 영상 정보 시작-->
	<div class="container d-flex flex-row ">
		<!-- -----최근에 가장 많이 본 동영상 시작-------- -->
		<div class="container">
			<h2 class=" d-inline display-7 fw-bold">최근에 가장 많이 본 운동</h2>
			<hr>

			<!-- 앨범 시작-->
			<div class="album py-5 bg-light">
				<div id="carouselExampleControlsLeft"
					class="carousel carousel-dark slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${list }" var="video" varStatus="status">
							<!--<c:if test="${video.viewCnt gt 0}">-->
							<c:if test="${status.index == 0}">
								<div class="carousel-item active">
									<div class="container-1"
										style="display: flex; justify-content: center; align-items: center;">
										<div class="card shadow-sm m-2" style="width: 18rem;">
											<iframe width="100%"
												src="https://www.youtube.com/embed/${video.id}"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen> </iframe>
											<div class="card-body">

												<p class="card-text" style="height: 55px">${video.title}</p>

												<div
													class="d-flex justify-content-between align-items-center">
													<button type="button"
														class="btn btn-sm btn-outline-secondary">리뷰</button>
													<div class="d-flex flex-row">
														<span class="view"><i class="bi bi-eye"></i>${video.viewCnt}</span>
														<span class="badge bg-success">${video.part}</span> <span
															class="badge bg-danger ">${video.channelName}</span>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index > 0}">
								<div class="carousel-item">
									<div class="container-1"
										style="display: flex; justify-content: center; align-items: center;">
										<div class="card shadow-sm m-2" style="width: 18rem;">
											<iframe width="100%"
												src="https://www.youtube.com/embed/${video.id}"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen> </iframe>
											<div class="card-body">

												<p class="card-text" style="height: 55px">${video.title}</p>

												<div
													class="d-flex justify-content-between align-items-center">
													<button type="button"
														class="btn btn-sm btn-outline-secondary">리뷰</button>
													<div class="d-flex flex-row">
														<span class="view"><i class="bi bi-eye"></i>${video.viewCnt}</span>
														<span class="badge bg-success">${video.part}</span> <span
															class="badge bg-danger ">${video.channelName}</span>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!--</c:if>-->
						</c:forEach>
						<!-- 두번째 앨범 끝 -->
					</div>
					<!-- 앨범 방향 키 설정 시작-->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControlsLeft" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControlsLeft" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
					<!--앨범 방향 키 설정 끝 -->
				</div>
				<!-- 캐러셀 끝 -->
			</div>
			<!-- 앨범 끝-->
		</div>
		<!-- 최근에 가장 많이 본 동영상 끝-->
		<!--운동 부위 선택 시작-->
		<div class="container">
			<div class="d-flex flex-row">
				<div class="item">
					<h2 class="d-inline display-7 fw-bold">부위별 운동</h2>
				</div>
				<div class="item" style="margin-left: 10px; margin-top:6px;">
					<form method="POST" action="/ssafit/main">
						<input type="hidden" name="action" value="partList"> <input
							type="submit" class="btn btn-outline-info btn-sm" id=""
							name="findpart" value="상체"> <input type="submit"
							class="btn btn-outline-info btn-sm" id="" name="findpart"
							value="복부"> <input type="submit"
							class="btn btn-outline-info btn-sm" id="" name="findpart"
							value="하체"> <input type="submit"
							class="btn btn-outline-info btn-sm" id="" name="findpart"
							value="전신">
					</form>
				</div>
			</div>
			<hr>


			<!-- 앨범 시작-->
			<div class="album py-5 bg-light">
				<div id="carouselExampleControlsLeft2"
					class="carousel carousel-dark slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${partlist }" var="partvideo" varStatus="status">
							<!-- 첫번째 앨범 시작 -->
							<c:if test="${status.index == 0}">
								<div class="carousel-item active">
									<div class="container-1"
										style="display: flex; justify-content: center; align-items: center;">
										<div class="card shadow-sm m-2" style="width: 18rem;">
											<iframe width="100%"
												src="https://www.youtube.com/embed/${partvideo.id}"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
											<div class="card-body">

												<p class="card-text" style="height: 55px">${partvideo.title}</p>
												<div
													class="d-flex justify-content-between align-items-center">
													<button type="button"
														class="btn btn-sm btn-outline-secondary">리뷰</button>
													<div class="d-flex flex-row">
														<span class="view"><i class="bi bi-eye"></i>${partvideo.viewCnt}</span>
														<span class="badge bg-success">${partvideo.part}</span> <span
															class="badge bg-danger ">${partvideo.channelName}</span>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!-- 첫번째 앨범 끝 -->

							<!-- 두번째 앨범 시작 -->
							<c:if test="${status.index > 0}">
								<div class="carousel-item">
									<div class="container-1"
										style="display: flex; justify-content: center; align-items: center;">
										<div class="card shadow-sm m-2" style="width: 18rem;">
											<iframe width="100%"
												src="https://www.youtube.com/embed/${partvideo.id}"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
											<div class="card-body">

												<p class="card-text" style="height: 55px">${partvideo.title}</p>
												<div
													class="d-flex justify-content-between align-items-center">
													<button type="button"
														class="btn btn-sm btn-outline-secondary">리뷰</button>
													<div class="d-flex flex-row">
														<span class="view"><i class="bi bi-eye"></i>${partvideo.viewCnt}</span>
														<span class="badge bg-success">${partvideo.part}</span> <span
															class="badge bg-danger ">${partvideo.channelName}</span>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 두번째 앨범 끝 -->
					</div>

					<!-- 앨범 방향 키 설정 시작-->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControlsLeft2"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControlsLeft2"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
					<!--앨범 방향 키 설정 끝 -->
				</div>
				<!-- 캐러셀 끝 -->
			</div>
			<!-- 앨범 끝-->
		</div>
		<!-- 운동 부위 선택 끝-->
	</div>
	<!-- 영상 정보 끝--> </main>

	<!-- footer -->
	<footer class="footer mt-auto py-3 bg-light">
		<div class="container">
			<span class="text-muted">
				<div class="corp_area" data-clk-prefix="plc">
					<ul class="list_corp">
						<li class="corp_item"><a href="#" data-clk="intronhn">회사소개</a></li>
						<li class="corp_item"><a href="#" data-clk="recruit">인재채용</a></li>
						<li class="corp_item"><a href="#" data-clk="contact">제휴제안</a></li>
						<li class="corp_item"><a href="#" data-clk="service">이용약관</a></li>
						<li class="corp_item"><a href="#" data-clk="privacy"><strong>개인정보처리방침</strong></a>
						</li>
						<li class="corp_item"><a href="#" data-clk="helpcenter">고객센터</a></li>
					</ul>
				</div>
			</span>
		</div>
	</footer>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>
<!-- End -->
