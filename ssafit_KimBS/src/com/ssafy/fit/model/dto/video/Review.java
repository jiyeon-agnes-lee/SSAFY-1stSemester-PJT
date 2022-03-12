package com.ssafy.fit.model.dto.video;

import java.time.LocalDate;

public class Review {
	// 고유 번호
	private int no;
	// 비디오 번호
	private int videoNo;
	// 비디오에 따른 리뷰 번호
	private int reviewNo;
	// 리뷰 제목
	private String title;
	// 리뷰 내용
	private String content;
	// 리뷰 작성자 name
	private String userName;
	// 조회수
	private int viewCnt;
	// 작성일
	private LocalDate date;
	
	public Review() {
		
	}

	public Review(int videoNo, String title, String content, String userName) {
		this.videoNo = videoNo;
		this.title = title;
		this.content = content;
		this.userName = userName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	
	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Review [no=" + no + ", videoNo=" + videoNo + ", reviewNo=" + reviewNo + ", title=" + title + ", content=" + content + ", userName=" + userName
				+ ", viewCnt=" + viewCnt + ", date=" + date + "]";
	}	
	
}
