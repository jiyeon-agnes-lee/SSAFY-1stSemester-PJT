package com.ssafy.fit.controller;

import java.io.IOException;
import java.time.LocalDate;
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
	private void doReviewRegist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String userName = req.getParameter("userName");

		// List에 추가
		Review review = new Review(title, content, userName);
		ReviewDao.getInstance().addReview(review);
		
		int no = review.getNo();
		int viewCnt = review.getViewCnt();
		LocalDate date = review.getDate();
		// 전달 받은 파리미터를 request에 담는다.
		req.setAttribute("no", no);
		req.setAttribute("title", title);
		req.setAttribute("content", content);
		req.setAttribute("userName", userName);
		req.setAttribute("viewCnt", viewCnt);
		req.setAttribute("date", date);
		
		doReviewList(req, resp);

	}
	private void doReviewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDao dao = ReviewDao.getInstance();
		List<Review> list = dao.getReviewList();
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/video/reviewList.jsp");
		rd.forward(request, response);
	}
}
