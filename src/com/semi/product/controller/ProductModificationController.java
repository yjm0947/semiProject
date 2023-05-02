package com.semi.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.product.model.service.ProductService;
import com.semi.product.model.vo.Product;

/**
 * Servlet implementation class ProductModificationController
 */
@WebServlet("/product.md")
public class ProductModificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductModificationController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("겟옴...");
		
		int proNo = Integer.parseInt(request.getParameter("pNo"));
		
		System.out.println(proNo);
		
//		Product pro = new ProductService().modifiPro(proNo);
		
		
		
		request.getRequestDispatcher("views/product/productModifi.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productNo = request.getParameter("productNo");
		
		response.setContentType("json/applicaion; charset=UTF-8");
		response.getWriter().print(productNo);

	}

}
