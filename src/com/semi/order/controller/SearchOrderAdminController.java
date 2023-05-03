package com.semi.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.order.model.service.OrderService;
import com.semi.order.model.vo.Payment;

/**
 * Servlet implementation class SearchOrderAdminController
 */
@WebServlet("/searchOrder.admin")
public class SearchOrderAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOrderAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("ms_select"));
		String search = request.getParameter("memberSearch");
		
		ArrayList<Payment> list = new OrderService().searchOrderAdmin(num,search);
		
		if(list.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "해당 하는 주문내역이 없습니다.");
			response.sendRedirect(request.getContextPath()+"/order.admin");
		}else {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin_order/adminOrder.jsp").forward(request, response);
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
