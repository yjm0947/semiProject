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

/**
 * Servlet implementation class NoticeSearchAdminController
 */
@WebServlet("/searchNotice.admin")
public class NoticeSearchAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("ms_select"));
		String search = request.getParameter("memberSearch");
		
		ArrayList<Board> list = new BoardService().searchNoticeAdmin(num,search);
		
		if(list.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "해당하는 공지사항이 없습니다.");
			response.sendRedirect(request.getContextPath()+"/notice.admin");
		}else {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin_board/adminNotice.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
