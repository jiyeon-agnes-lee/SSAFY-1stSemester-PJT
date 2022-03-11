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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex flex-column h-100">
    <!-- header -->
   	<%@ include file="/common/header.jsp" %>

    <main class="flex-shrink-0">
    	<form method="POST" action="/ssafit/main">
    		<!-- 폼에 필요한 입력값(자동 제공) -->
    		<input type="hidden" name="action" value="reviewRegist"> 
    		<!-- 로그인 구현 시 userName 은 로그인한 유저의 이름으로 변경 -->
    		<input type="hidden" id="userName" name="userName" value="ssafit">
	        <div class="container">
	        <br>
	        <!-- 리뷰 입력 페이지 헤더 -->
	        <p class="display-5 fw-bold" style="text-align: center"> 리뷰 쓰기</p>
	        <hr>
	  
	        <!-- 입력 창 -->
	        <div class="mb-3">
	            <label for="exampleFormControlInput2" class="form-label">영상번호</label>
	            <input type="number" class="form-control" id="FormControlInput2 videoNo" name="videoNo" placeholder="영상번호를 입력하세요">
	        </div>
	        
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">제목</label>
	            <input type="text" class="form-control" id="FormControlInput1" name="title" placeholder="제목을 입력하세요">
	        </div>
	       
	        <div class="mb-3">
	            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	            <textarea class="form-control" id="FormControlTextarea1" name="content" rows="3" placeholder="내용을 입력하세요"></textarea>
	        </div>
	        <!-- 입력 버튼 -->
	        <input class="btn btn-primary" type="submit" value="등록">
	        <input class="btn btn-danger" type="reset" value="취소">
	        </div>
        </form>
    </main>

     <!-- footer -->
     <%@ include file="/common/footer.jsp" %>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
