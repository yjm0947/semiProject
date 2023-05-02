package com.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Coupon;
import com.semi.member.model.vo.Member;
import com.semi.order.model.vo.Payment;


/**
 * Servlet implementation class MypageConteroller
 */
/**
 * Servlet implementation class MypageConteroller
 */
@WebServlet("/myPage.me")
public class MypageConteroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageConteroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memNo = loginUser.getMemberNo();
		
		ArrayList<Coupon> clist = new MemberService().selectCoupon(memNo);
		ArrayList<Payment> plist = new MemberService().selectPaymentList(memNo);
		
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		
	}
		// TODO Auto-generated method stub
		//doGet(request, response);
		
	}

}
