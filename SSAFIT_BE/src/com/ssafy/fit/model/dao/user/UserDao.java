package com.ssafy.fit.model.dao.user;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.fit.model.dto.user.User;

public class UserDao {
	private List<User> list = new ArrayList<>();
	private static int no = 0;
	private static UserDao instance;

	private UserDao() {

	}

	public boolean checkId(String id) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId().equals(id)) {
				return true;
			}
		}
		return false;
	}

	public boolean checkPassword(String pw) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getPassword().equals(pw)) {
				return true;
			}
		}
		return false;
	}

	public User getLoginUser(String id, String pw) {
		for (int i = 0; i < list.size(); i++) {
			User user = list.get(i);
			if (user.getId().equals(id) && user.getPassword().equals(pw)) {
				return user;
			}
		}
		return null;
	}

	public static UserDao getInstance() {
		if (instance == null)
			instance = new UserDao();
		return instance;
	}

	// 전체 유저 목록 가져오기
	public List<User> getUserList() {
		return list;
	}

	// 파라미터로 전송한 유저 객체를 리스트에 추가하기
	public void addUser(User user) {
		user.setNo(++no);
		list.add(user);
	}

}
