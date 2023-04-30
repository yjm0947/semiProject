package com.semi.board.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.inquiry.model.service.BoardService;
import com.semi.board.inquiry.model.vo.Board;
import com.semi.common.vo.PageInfo;
import com.semi.product.model.vo.Product;

/**
 * Servlet implementation class MainNoticeController
 */
@WebServlet("/noti.ma")
public class MainNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//페이징바 처리
		int listCount; //현재 총 게시글의 개수
		int currentPage; //현재 페이지
		int pageLimit; //페이지 하단 페이지 최대 개수
		int boardLimit; // 한 페이지에서 보여질 게시글 최대 수
		
		int maxPage; //가장 마지막 페이지 몇인지(총 페이지 개수)
		int startPage; //페이지 하단에 보여질 페이징바 시작 수
		int endPage; //페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new BoardService().MainNotice(); //공지사항 게시글 수
		currentPage = Integer.parseInt(request.getParameter("currentPage").trim());
		pageLimit = 10;
		boardLimit = 8;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
		endPage = startPage+pageLimit-1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Board> list = new BoardService().selectMainNotice(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
//		for(Board b : list) {
//			System.out.println(b);
//		}
		
		request.getRequestDispatcher("views/board/mainNotice.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}