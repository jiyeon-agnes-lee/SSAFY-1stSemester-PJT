package com.ssafy.fit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.fit.dto.Video;
import com.ssafy.fit.model.VideoDao;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		//파라미터 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");	
		process(request, response);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// doGet을 통해서, doPost 통해 들어온 요청에 맞게 기능을 수행한다.
		String action = req.getParameter("action");

		switch (action) {
		//리스트 보내주기
		case "list":
			doListVideo(req, resp);
			break;
		case "partlist":
			doFindPart(req, resp);
			break;
		}		
	}
	
	
	private void doListVideo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//등록 되어 있는 게시글을 전부 읽어와서 그친구를 Home.jsp로 보내주면 좋겠다.
		VideoDao dao = VideoDao.getInstance();
		List<Video> list = dao.selectVideo();
		//Home.jsp 에 실제 내 데이터를 실어서 전달 할래~~~
		req.setAttribute("list", list);
		RequestDispatcher rd = req.getRequestDispatcher("/Home.jsp");
		rd.forward(req, resp);
	}
	
	private void doFindPart(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String part = req.getParameter("findpart");
		VideoDao dao = VideoDao.getInstance();
		List<Video> partlist = dao.findVideo(part);
		req.setAttribute("partlist", part);
		RequestDispatcher rd = req.getRequestDispatcher("/Home.jsp");
		rd.forward(req, resp);		
		
	}

}
