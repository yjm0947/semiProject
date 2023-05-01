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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		int count = new AttendanceService().dayCount(memberNo);
		
		if (count>23) {//출석체크 일수가 23개 찍혀있다면... 0으로 바꿔주기
			new AttendanceService().resetCount(memberNo);
		}
		
		response.getWriter().print(count);
		
	}

}
