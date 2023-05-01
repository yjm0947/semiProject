package com.semi.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.order.model.service.OrderService;

/**
 * Servlet implementation class CheckPayAdminController
 */
@WebServlet("/chkPay.admin")
public class CheckPayAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPayAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//결제금액 담기
		int payment = Integer.parseInt(request.getParameter("payment"));
		
		//결제금액 적립금으로 계산
		int pay = (int)((payment-3000)*0.1);
		
		//해당 주문번호 담기
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		
		//해당 주문번호의 회원번호 받아오기
		int memberNo = new OrderService().chkMemberNoAdmin(orderNo);
		
		//받아온 회원번호로 해당 회원 적립금 올려주기
		int result = new MemberService().upPointAdmin(memberNo,pay);
		
		//결제상태 변경
		int result2 = new OrderService().chkPayUpdateAdmin(orderNo);
		
		if(result*result2 > 0) {
			request.getSession().setAttribute("alertMsg", "입금확인 완료");
			response.sendRedirect(request.getContextPath()+"/order.admin");
		}else {
			request.setAttribute("errorMsg", "입금확인 처리 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
