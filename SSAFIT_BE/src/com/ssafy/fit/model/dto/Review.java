package com.ssafy.fit.model.dto.video;

import java.time.LocalDate;

public class Review {
	// 고유 번호
	private int no;
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

	public Review(String title, String content, String userName) {
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
		return "Review [no=" + no + ", title=" + title + ", content=" + content + ", userName=" + userName
				+ ", viewCnt=" + viewCnt + ", date=" + date + "]";
	}	
	
}
