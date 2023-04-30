package com.semi.board.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.inquiry.model.service.BoardService;
import com.semi.board.inquiry.model.vo.Board;

/**
 * Servlet implementation class QnainsertController
 */
@WebServlet("/qna.in") //1:1문의 인설트
public class QnainsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnainsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트 옴");
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		System.out.println(boardTitle);
		System.out.println(boardContent);
		String memberNo = request.getParameter("mamberNo");
		System.out.println(memberNo);
		
		request.getRequestDispatcher("views/board/mainQna.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//상품 페이지 상에서 상품 qna 등록
		String memberNo = request.getParameter("memberNo");
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		Board b = new Board();
		b.setMemberNo(memberNo);
		b.setProductNo(productNo);
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		
		int result = new BoardService().insertQna(b);
		
		response.getWriter().print(result);
		
	}

}
