package com.semi.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.shoppingcart.model.service.ShoppingCartService;
import com.semi.shoppingcart.model.vo.ShoppingCart;

/**
 * Servlet implementation class SCSelectUserCartController
 */
@WebServlet("/selectUserCart.sc")
public class SCSelectUserCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SCSelectUserCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usernum = Integer.parseInt(request.getParameter("usernum"));
		ShoppingCart scList = new ShoppingCartService().selectUserCart(usernum);
		
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(scList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	}

}
