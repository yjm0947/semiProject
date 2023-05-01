package com.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.product.model.service.ProductService;
import com.semi.product.model.vo.Product;

/**
 * Servlet implementation class SearchReceiveAdminController
 */
@WebServlet("/searchReceive.admin")
public class SearchReceiveAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchReceiveAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("ms_select"));
		
		String search = request.getParameter("memberSearch");
		
		ArrayList<Product> list = new ProductService().searchReceiveAdmin(num,search);
		
		if(list.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "해당하는 입고내역이 없습니다.");
			response.sendRedirect(request.getContextPath()+"/receive.admin");
		}else {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin_items/adminReceive.jsp").forward(request, response);
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
