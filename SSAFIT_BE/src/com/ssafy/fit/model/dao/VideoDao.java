package com.ssafy.fit.model;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.fit.dto.Video;

public class VideoDao {
	private List<Video> list = new ArrayList<>();
	private int no = 0;
	private static VideoDao instance;
	private List<Video> partlist;
	private List<Video> viewlist;
//	싱글턴 만들장~~!! 오또케??
	private VideoDao() {
		insertVideo(new Video("gMaB-fG4u4g", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", 10, "ThankyouBUBU", "https://www.youtube.com/embed/gMaB-fG4u4g"));
		insertVideo(new Video("swRNeYw1JkY", "하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", 6, "ThankyouBUBU", "https://www.youtube.com/embed/swRNeYw1JkY"));
		insertVideo(new Video("54tTYO-vU2E", "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", 21, "ThankyouBUBU", "https://www.youtube.com/embed/54tTYO-vU2E"));
		insertVideo(new Video("QqqZH3j_vH0", "상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", 22, "ThankyouBUBU", "https://www.youtube.com/embed/QqqZH3j_vH0"));
		insertVideo(new Video("tzN6ypk6Sps", "하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", 23, "김강민", "https://www.youtube.com/embed/tzN6ypk6Sps"));	
		insertVideo(new Video("u5OgcZdNbMo", "저는 하체 식주의자 입니다", "하체", 34, "GYM종국", "https://www.youtube.com/embed/u5OgcZdNbMo"));	
		insertVideo(new Video("PjGcOP-TQPE", "11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", 24, "ThankyouBUBU", "https://www.youtube.com/embed/PjGcOP-TQPE"));	
		insertVideo(new Video("7TLk7pscICk", "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", 17, "SomiFit", "https://www.youtube.com/embed/7TLk7pscICk"));	
		
	}

	public static VideoDao getInstance() {
		if (instance == null)
			instance = new VideoDao();
		return instance;
	}

	// 전체 보드 가져오기
	public List<Video> selectVideo() {
		//조회수대로 정렬//
		viewlist = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getViewCnt() > 20) {
				viewlist.add(list.get(i));
			}
		}
		return viewlist;
	}

	// 파라미터로 넘어온 보드 리스트에 등록하기
	public void insertVideo(Video v) {
		// TODO Auto-generated method stub
		list.add(v);
	}
	
	public List<Video> findVideo(String part) {
		//파라미터가 널이 아니면 여기로 들어와//널이면 list를 반환하는거로 작성하기.
		partlist = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPart().equals(part)) {
				partlist.add(list.get(i));
			}
		}
		
		return partlist;
	}
}
