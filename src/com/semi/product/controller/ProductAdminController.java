package com.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.vo.PageInfo;
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
		int bar = 0;
		int barNum = 0;
		String barSearch = "";
		
		ArrayList<Product> list = new ArrayList<>();
		
		if(request.getAttribute("list") == null) {
		//상품 리스트 추출해서 뷰로 넘겨주기
			int listCount; //총 게시글 개수
			int currentPage; // 현재 페이지
			int pageLimit; //페이징 바 최대 개수
			int boardLimit; // 한 페이지 게시글 최대 개수
			int maxPage; //마지막 페이지 
			int startPage; //페이징 바의 시작 수
			int endPage; // 페이징바의 마지막 수
			
			listCount = new ProductService().selProductAdminCount();
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			pageLimit = 10;
			boardLimit = 15;
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			startPage = (currentPage-1)/pageLimit * pageLimit+1;
			endPage = startPage + pageLimit-1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
			list = new ProductService().selectAdminProduct(pi);
			
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
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("bar", bar);
			request.setAttribute("barNum", barNum);
			request.setAttribute("barSearch", barSearch);
			request.setAttribute("relist", relist);
		}else {
			bar = 1;
			barNum = (int)request.getAttribute("barNum");
			barSearch = (String)request.getAttribute("barSearch");
			
			PageInfo pi = (PageInfo)request.getAttribute("pi");
			list = (ArrayList<Product>)request.getAttribute("list");
			
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
			
			request.setAttribute("Pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("bar", bar);
			request.setAttribute("barNum", barNum);
			request.setAttribute("barSearch", barSearch);
			request.setAttribute("relist", relist);
		}
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
