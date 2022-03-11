package com.ssafy.fit.model.dao.video;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.fit.model.dto.video.Review;


public class ReviewDao {
	private List<Review> list = new ArrayList<>();
	private List<Review> reviewList;
	private int no = 0;
	private static ReviewDao instance;
	private ReviewDao() {
		
	}
	
	public static ReviewDao getInstance() {
		if (instance == null)
			instance = new ReviewDao();
		return instance;
	}
	
	// 전체 리뷰 목록 가져오기
	public List<Review> getReviewList() {
		return list;
	}
	
	// 해당 영상의 리뷰 목록 가져오기
	public List<Review> getVideoReviewList(int videoNo) {
		reviewList = new ArrayList<>();
		for(int i =0; i < list.size(); i++) {
			Review r = list.get(i);
			if(r.getVideoNo() == videoNo) {
				reviewList.add(r);
			}
		}
		return reviewList;
	}

	// 파라미터로 전송한 리뷰객체를 리스트에 추가하기
	public void addReview(Review review) {
		review.setNo(++no);
		int videoReviewSize = getVideoReviewList(review.getVideoNo()).size()+1;
		review.setReviewNo(videoReviewSize);
		review.setDate(LocalDate.now());
		list.add(review);
	}

	public int getIdx(int no) {
		for(int i=0; i< list.size(); i++) {
			Review r = list.get(i);
			if(r.getNo() == no) {
				return i;
			}
			
		}
		return -1;
	}
}

