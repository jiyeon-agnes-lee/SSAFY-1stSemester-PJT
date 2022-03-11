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
		// 수정 페이지로 간다.
		case "reviewModify":
			doReviewModify(req, resp);
			break;
		// 상세 페이지로 간다.
		case "reviewDetail":
			doReviewDetail(req, resp);
			break;
		// DAO에 저장된 리뷰 데이터를 수정한다.
		case "reviewRewrite":
			doReviewRewrite(req, resp);
			break;
		// 리뷰 수정 페이지에서 취소를 누르면 수정하려던 리뷰가 소속된 비디오의 리뷰리스트로 간다.
		case "reviewRewriteCancel":
			int videoNo = Integer.parseInt(req.getParameter("videoNo"));
			doReviewList(videoNo, req, resp);
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
		// 클릭한 리뷰의 고유번호를 받는다.
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
		// 조회수 1 증가
		int viewCntPlus = theReview.getViewCnt() + 1;
		// 증가된 조회수 저장
		theReview.setViewCnt(viewCntPlus);
		// 해당 리뷰 객체를 얻어서 request에 탑승시킨다.
		req.setAttribute("review", theReview);

		RequestDispatcher rd = req.getRequestDispatcher("/video/reviewDetail.jsp");
		rd.forward(req, resp);
	}

	private void doReviewRewrite(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		// 클릭한 리뷰의 고유번호를 받는다.
		int no = Integer.parseInt(req.getParameter("no"));
		// 클릭한 리뷰가 리스트 전체에서 몇번째인지를 통해 해당 리뷰 객체를 얻는다.
		Review toReWrite = ReviewDao.getInstance().getReviewList().get(ReviewDao.getInstance().getIdx(no));
		// 해당 객체의 제목과 내용을 수정한다.
		toReWrite.setTitle(req.getParameter("title"));
		toReWrite.setContent(req.getParameter("content"));

		doReviewList(toReWrite.getVideoNo(), req, resp);
	}

	private void doReviewDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 클릭한 리뷰의 고유값 받기
		int no = Integer.parseInt(req.getParameter("no"));
		// 클릭한 리뷰가 리스트 전체에서 몇번째인지
		int idx = ReviewDao.getInstance().getIdx(no);
		// 클릭한 리뷰의 객체 받기
		Review toReWrite = ReviewDao.getInstance().getReviewList().get(idx);
		// 클릭한 리뷰가 무슨 비디오 소속인지
		int videoNo = toReWrite.getVideoNo();
		// 클릭한 리뷰가 동일 비디오 리뷰 중 몇번째 리뷰인지
		int reviewNo = toReWrite.getReviewNo();
		// 클릭한 리뷰 제거
		ReviewDao.getInstance().getReviewList().remove(idx);
		// ReviewNo 재배열
		// 클릭한 리뷰와 같은 비디오 소속인 리뷰들 중 클릭한 리뷰 이후의 리뷰들의 ReviewNo을 하나 줄인다.
		for(int i=reviewNo; i <= ReviewDao.getInstance().getVideoReviewList(videoNo).size();i++) {
			// 인덱스를 위해 -1
			int oldRN = ReviewDao.getInstance().getVideoReviewList(videoNo).get(i-1).getReviewNo();
			ReviewDao.getInstance().getVideoReviewList(videoNo).get(i-1).setReviewNo(oldRN-1);
		}
		doReviewList(toReWrite.getVideoNo(), req, resp);
	}
}
