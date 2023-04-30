package com.semi.board.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.review.model.service.ReviewService;
import com.semi.board.review.model.vo.Review;
import com.semi.event.point.model.service.PointService;

/**
 * Servlet implementation class ReplyInsertController
 */
@WebServlet("/review.in") //리뷰 작성
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String productNo = request.getParameter("productNo");
		int reviewStar = Integer.parseInt(request.getParameter("reviewStar"));
		String reviewContent = request.getParameter("reviewContent");
		
		Review r = new Review();
		r.setMemberNo(memberNo);
		r.setProductNo(productNo);
		r.setReviewStar(reviewStar);
		r.setReviewContent(reviewContent);
		
		int result = new ReviewService().insertReview(r);
		
		//적립해줄 포인트
		int addP = 500;
		
		if(result>0) {
			new PointService().upPoint(memberNo, addP);//포인트 적립 메소드
		}
		
		response.getWriter().print(result);
	}

}
