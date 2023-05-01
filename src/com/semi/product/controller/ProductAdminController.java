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
 * Servlet implementation class itemsController
 */
@WebServlet("/items.admin")
public class ProductAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		ArrayList<Product> list = new ArrayList<>();
		
//		if(request.getAttribute("list") == null) {
			//상품 리스트 추출해서 뷰로 넘겨주기
		ArrayList<Product> list = new ProductService().selectAdminProduct();
//		}else {
//			list = (ArrayList<Product>)request.getAttribute("list");
//		}
		
		//list.size()만큼 크기 지정 
		int rel[] = new int[list.size()];  
		
		//rel에 상품번호 넣어주기
		for(int i=0; i<list.size(); i++) {
			rel[i] = list.get(i).getProductNo();
		}
		
		//출고량 추출
		int relist[] = new int[list.size()];
		
		for(int i=0; i<rel.length; i++) {
			relist[i] = new ProductService().relAdminProduct(rel[i]);
		}
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("relist", relist);
		
		request.getRequestDispatcher("views/admin_items/adminItems.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
