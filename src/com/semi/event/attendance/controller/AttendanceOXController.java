package com.semi.event.attendance.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.event.attendance.model.service.AttendanceService;
import com.semi.order.model.service.OrderService;
import com.semi.shoppingcart.model.service.ShoppingCartService;

/**
 * Servlet implementation class AttendanceOXController
 */
@WebServlet("/atdateOX.me")
public class AttendanceOXController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceOXController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new AttendanceService().attendanceOX(userNo);
		
		response.setContentType("json/application; charset=UTF-8");
		if (result>0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
	}

}
