package com.ssafy.fit.model.dao.video;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.fit.model.dto.video.Review;


public class ReviewDao {
	private List<Review> list = new ArrayList<>();
	private static int no = 0;
	private static ReviewDao instance;
	
	private ReviewDao() {
		
	}
	
	public static ReviewDao getInstance() {
		if (instance == null)
			instance = new ReviewDao();
		return instance;
	}
	public static int getViewCnt() {
		return no;
	}
	// 전체 리뷰 목록 가져오기
	public List<Review> getReviewList() {
		return list;
	}

	// 파라미터로 전송한 리뷰객체를 리스트에 추가하기
	public void addReview(Review review) {
		review.setNo(++no);
		review.setDate(LocalDate.now());
		list.add(review);
	}

}
