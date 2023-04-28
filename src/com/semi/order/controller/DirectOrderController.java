package com.semi.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.order.model.service.OrderService;

/**
 * Servlet implementation class DirectOrderController
 */
@WebServlet("/directOrder.od")
public class DirectOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectOrderController() {
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
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		new OrderService().deleteOrder(userNo);
		
		new OrderService().directInsert(productNo,userNo);
		
		//값을 넘겨줘야 success
		response.setContentType("json/application; charset=UTF-8");
		response.getWriter().print(1);
		
	}

}
