package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class UpdateAddrController
 */
@WebServlet("/updateAddr.me")
public class UpdateAddrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAddrController() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		String memberId = loginUser.getMemberId();
		
		String addressNum = request.getParameter("addressNum");
		String loadAddress = request.getParameter("loadAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		String address = request.getParameter("address");

		address = addressNum + loadAddress + " " + detailAddress;
		
		Member updateAddr = new MemberService().updateAddress(memberId, address);
		
		HttpSession session = request.getSession();
		
		if(updateAddr != null) {
			request.getSession().setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			session.setAttribute("loginUser", updateAddr);
			response.sendRedirect(request.getContextPath()+"/myPage.me");
		}else {
			request.getSession().setAttribute("alertMsg", "회원 정보 수정을 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/myPage.me");
		}
		
	}

}
