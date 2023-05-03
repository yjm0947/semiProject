package com.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.order.model.vo.Payment;

/**
 * Servlet implementation class MyPaybackListController
 */
@WebServlet("/myPayList.me")
public class MyPaybackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPaybackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memNo = loginUser.getMemberNo();
		
		ArrayList<Payment> plist = new MemberService().selectPaymentList(memNo);
		
		request.setAttribute("payList", plist);
		request.getRequestDispatcher("views/member/myPayList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memNo = loginUser.getMemberNo();
		int ono = Integer.parseInt(request.getParameter("hideOno"));
		
		int result = new MemberService().refundMyOrder(memNo, ono);
		
		response.setContentType("json/application; charset=UTF-8");
		Gson gson = new Gson();
		
		gson.toJson(result,response.getWriter());
		
	}

}
