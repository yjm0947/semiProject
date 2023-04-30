package com.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.board.review.model.vo.Review;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MyReviewListController
 */
@WebServlet("/myReviewList.me")
public class MyReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memNo = loginUser.getMemberNo();
		
		ArrayList<Review> rlist = new MemberService().selectMyReview(memNo);
		
		request.setAttribute("rlist", rlist);
		request.getRequestDispatcher("views/member/myReviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		ArrayList<Review> list = new MemberService().selectReModal(reviewNo);
		
		response.setContentType("json/application; charset=UTF-8");
		Gson gson = new Gson();
		
		Review r = null;
		
		if(list.get(0).getReviewNo() == reviewNo) {
			for(int i=0; i<list.size(); i++) {
				r = list.get(i);
			}
		}else {
			System.out.println("댓글 상세 조회 실패");
		}
		
		
		gson.toJson(r,response.getWriter());
	}

}
