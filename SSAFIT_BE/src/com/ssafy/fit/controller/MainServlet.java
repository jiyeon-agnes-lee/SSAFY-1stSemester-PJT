package com.ssafy.fit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.fit.model.dao.video.ReviewDao;
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
		case "reviewRegist":
			doReviewRegist(req, resp);
			break;
		case "reviewList":
			doReviewList(req, resp);
			break;
		}
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
