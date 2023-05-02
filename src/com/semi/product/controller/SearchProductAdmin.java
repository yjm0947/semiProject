package com.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.vo.PageInfo;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.product.model.service.ProductService;
import com.semi.product.model.vo.Product;

/**
 * Servlet implementation class SearchProductAdmin
 */
@WebServlet("/searchProduct.admin")
public class SearchProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProductAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; //총 게시글 개수
		int currentPage; // 현재 페이지
		int pageLimit; //페이징 바 최대 개수
		int boardLimit; // 한 페이지 게시글 최대 개수
		int maxPage; //마지막 페이지 
		int startPage; //페이징 바의 시작 수
		int endPage; // 페이징바의 마지막 수
		
		int num = 0;
		int barNum = 0;
		
		//select의 value값
		if(request.getParameter("ms_select") != null) {
			num = Integer.parseInt(request.getParameter("ms_select"));
			barNum = Integer.parseInt(request.getParameter("ms_select"));
		}else { //키워드 검색 시 페이징바 처리에 필요한 num
			num = Integer.parseInt(request.getParameter("barNum"));
			barNum = Integer.parseInt(request.getParameter("barNum"));
		}
		
		String search = "";
		String barSearch = "";
		
		//입력한 검색값
		if(request.getParameter("memberSearch") != null) {
			search = request.getParameter("memberSearch");
			barSearch = request.getParameter("memberSearch");
		}else {
			search = request.getParameter("barSearch");
			barSearch = request.getParameter("barSearch");
		}
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		listCount = new ProductService().searchProductCount(num,search);
		
		pageLimit = 10;
		boardLimit = 15;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		endPage = startPage+pageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Product> list = new ArrayList<>();
		
		list = new ProductService().searchProductAdmin(num,search,pi);
		
		if(list.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "해당하는 상품이 없습니다.");
			response.sendRedirect(request.getContextPath()+"/items.admin?currentPage=1");
		}else {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("barNum", barNum);
			request.setAttribute("barSearch", barSearch);
			request.getRequestDispatcher("/items.admin").forward(request, response);
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
