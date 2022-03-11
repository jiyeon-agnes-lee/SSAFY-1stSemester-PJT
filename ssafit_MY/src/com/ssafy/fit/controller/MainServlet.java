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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		case "reviewModify":
			doReviewModify(req, resp);
			break;
		case "reviewDetail":
			doReviewDetail(req, resp);
			break;
		case "reviewRewrite":
			doReviewRewrite(req, resp);
			break;
		case "reviewDelete":
			doReviewDelete(req, resp);
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
	private void doReviewList(int videoNo, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReviewDao dao = ReviewDao.getInstance();
		List<Review> list = dao.getVideoReviewList(videoNo);
		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("/video/reviewList.jsp");
		rd.forward(request, response);
	}

	// 작성된 모든 리뷰
	private void doReviewList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ReviewDao dao = ReviewDao.getInstance();
		List<Review> list = dao.getReviewList();
		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("/video/reviewList.jsp");
		rd.forward(request, response);
	}

	private void doReviewModify(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 클릭한 리뷰가 몇번째 수인지 받는다
		int no = Integer.parseInt(req.getParameter("no"));
		// 해당 리뷰 객체를 얻어서 request에 탑승시킨다.
		req.setAttribute("review", ReviewDao.getInstance().getReviewList().get(ReviewDao.getInstance().getIdx(no)));
		RequestDispatcher rd = req.getRequestDispatcher("/video/reviewModify.jsp");
		rd.forward(req, resp);
	}

	private void doReviewDetail(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 클릭한 리뷰가 몇번째 수인지 받는다
		int no = Integer.parseInt(req.getParameter("no"));
		Review theReview = ReviewDao.getInstance().getReviewList().get(ReviewDao.getInstance().getIdx(no));
		//조회수 1 증가
		int viewCntPlus = theReview.getViewCnt()+1;
		//증가된 조회수 저장
		theReview.setViewCnt(viewCntPlus);
		// 해당 리뷰 객체를 얻어서 request에 탑승시킨다.
		req.setAttribute("review", theReview);

		RequestDispatcher rd = req.getRequestDispatcher("/video/reviewDetail.jsp");
		rd.forward(req, resp);
	}

	private void doReviewRewrite(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		// 클릭한 리뷰가 몇번째 수인지 받는다
		int no = Integer.parseInt(req.getParameter("no"));

		Review toReWrite = ReviewDao.getInstance().getReviewList().get(ReviewDao.getInstance().getIdx(no));
		toReWrite.setTitle(req.getParameter("title"));
		toReWrite.setContent(req.getParameter("content"));
		
		doReviewList(req, resp);
	}
	private void doReviewDelete(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		// 클릭한 리뷰가 몇번째 수인지 받는다
		int no = Integer.parseInt(req.getParameter("no"));
		ReviewDao.getInstance().getReviewList().remove(ReviewDao.getInstance().getIdx(no));

		doReviewList(req, resp);
	}
}
