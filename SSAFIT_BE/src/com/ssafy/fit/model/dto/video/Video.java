package com.ssafy.fit.dto;

public class Video {
	
	private String id;
	private String title;
	private String part;
	private int viewCnt;
	private String channelName;
	private String url;
	
	
	public Video(String id, String title, String part, int viewCnt, String channelName, String url) {
		super();
		this.id = id;
		this.title = title;
		this.part = part;
		this.viewCnt = viewCnt;
		this.channelName = channelName;
		this.url = url;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPart() {
		return part;
	}
	
	public void setPart(String part) {
		this.part = part;
	}
	
	public int getViewCnt() {
		return viewCnt;
	}
	
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public String getChannelName() {
		return channelName;
	}
	
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", part=" + part + ", viewCnt=" + viewCnt + ", channelName="
				+ channelName + ", url=" + url + "]";
	}
	
	
	
}	
