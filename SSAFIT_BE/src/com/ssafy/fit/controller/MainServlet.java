package com.ssafy.fit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.fit.model.dao.user.UserDao;
import com.ssafy.fit.model.dao.video.ReviewDao;
import com.ssafy.fit.model.dto.user.User;
import com.ssafy.fit.model.dto.video.Review;


@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String action = req.getParameter("action");

		switch (action) {
		case "userRegist":
			doUserRegist(req, resp);
			break;
		case "userList":
			doUserList(req, resp);
			break;
		case "login":
			doLogin(req, resp);
			break;
		case "logout":
			doLogout(req, resp);
			break;
		case "reviewRegist":
			doReviewRegist(req, resp);
			break;
		case "reviewList":
			doReviewList(req, resp);
			break;
		}
	}
	// 회원 등록(회원 가입)
	private void doUserRegist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		// 문자열을 숫자(나이)로 변환
		int age = Integer.parseInt(req.getParameter("age"));

		// List에 추가
		User user = new User(id, password, name, email, age);
		UserDao.getInstance().addUser(user);
		
		// 전달 받은 파리미터를 request에 담는다.
		req.setAttribute("id", id);
		req.setAttribute("password", password);
		req.setAttribute("name", name);
		req.setAttribute("email", email);
		req.setAttribute("age", age);
		
		// JSP 화면 호출을 위해서 RequestDispatcher의 forward를 사용한다.
		RequestDispatcher disp = req.getRequestDispatcher("/user/regist_result.jsp");
		disp.forward(req, resp);

	}
	
	// 회원 목록
	private void doUserList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = UserDao.getInstance();
		List<User> list = dao.getUserList();
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/user/userList.jsp");
		rd.forward(request, response);
	}
	
	// 로그인
	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPassword");
		String msg = "";
		UserDao dao = UserDao.getInstance();
		if(!dao.checkId(id)) {
			msg = "존재하지 않는 아이디입니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("userId", id);
			request.setAttribute("userPassword", pw);
			request.getRequestDispatcher("/user/userLogin.jsp").forward(request, response);
		}else if(!dao.checkPassword(pw)) {
			msg = "잘못된 패스워드입니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("userId", id);
			request.setAttribute("userPassword", pw);
			request.getRequestDispatcher("/user/userLogin.jsp").forward(request, response);
		}else if(dao.checkId(id) && dao.checkPassword(pw)) {
			HttpSession session = request.getSession();
			User loginUser = dao.getLoginUser(id, pw);
			session.setAttribute("loginUser", loginUser);

//			// 쿠키 생성 // name, value
//			Cookie cookie = new Cookie("userName", loginUser.getName());
//			
//			//유효시간 설정(초)
//			cookie.setMaxAge(60*60*3); //3시간
//			response.addCookie(cookie);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
	
	// 로그아웃
	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		//세션 전부 날리기
		session.invalidate();
		response.sendRedirect("index.jsp");
//		// 쿠키 삭제
//		Cookie cookie = new Cookie("userName", null);
//		//유효시간 설정(초)
//		cookie.setMaxAge(0);
//		response.addCookie(cookie);
	}
	
	// 리뷰 등록
	private void doReviewRegist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String userName = req.getParameter("userName");
		int videoNo = Integer.parseInt(req.getParameter("videoNo"));
		
		// List에 추가
		Review review = new Review(videoNo, title, content, userName);
		ReviewDao.getInstance().addReview(review);
		// 리뷰 등록 시 해당 영상 리뷰 목록 업데이트 후 이동	
		doReviewList(videoNo, req, resp);

	}
	
	// 해당 영상 리뷰
	private void doReviewList(int videoNo, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDao dao = ReviewDao.getInstance();
		List<Review> list = dao.getVideoReviewList(videoNo);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/video/reviewList.jsp");
		rd.forward(request, response);
	}
	
	// 작성된 모든 리뷰
	private void doReviewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReviewDao dao = ReviewDao.getInstance();
		List<Review> list = dao.getReviewList();
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/video/reviewList.jsp");
		rd.forward(request, response);
	}
}
