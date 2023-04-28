package com.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.model.service.BoardService;
import com.semi.board.model.vo.Board;
import com.semi.common.vo.PageInfo;

/**
 * Servlet implementation class noticeController
 */
@WebServlet("/notice.admin")
public class NoticeAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		int listCount; //총 게시글 개수
		int currentPage; //현재 페이지
		int pageLimit; //페이징 바 최대 개수
		int boardLimit; // 한 페이지 게시글 최대 개수
		int maxPage; // 마지막 페이지
		int startPage; // 페이징 바의 시작 수
		int endPage; // 페이징바의 마지막 수
		
		listCount = new BoardService().selNoticeAdminCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		endPage = startPage+pageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		*/
		ArrayList<Board> list = new BoardService().selectNoticeList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin_board/adminNotice.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
