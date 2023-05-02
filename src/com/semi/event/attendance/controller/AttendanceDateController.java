package com.semi.event.attendance.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.event.attendance.model.service.AttendanceService;

/**
 * Servlet implementation class AttendanceDateController
 */
@WebServlet("/atdate.me")//출석체크 화면에 출력해줄 도장 갯수 알아오기
public class AttendanceDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceDateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		//페이지 로딩시 출석체크 도장 출력
		int count = new AttendanceService().dayCount(memberNo);

		response.getWriter().print(count);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		new AttendanceService().resetCount(memberNo);//출석체크 다 찍었을시 0으로 바꿔주기
		
		
	}

}
