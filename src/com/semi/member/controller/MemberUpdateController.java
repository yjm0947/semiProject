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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/updateProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		String memberId = loginUser.getMemberId();
		String memberPwd = request.getParameter("memberPwd");
		
		if(memberPwd.isEmpty()) {
			memberPwd = loginUser.getMemberPwd();
		}
		
		String phone = request.getParameter("phone");
		
		if(phone.isEmpty()) {
			phone = loginUser.getPhone();
		}

		String email = request.getParameter("email");
		String dotCom = request.getParameter("dotCom");
		
		String memEmail = loginUser.getEmail();
		int sign = memEmail.indexOf("@");
		String emailAdd = loginUser.getEmail().substring(sign+1);
		
		if(dotCom == null) {
			email = email + "@" +emailAdd;
		}else {
			email = email + "@" + dotCom;
		}
		
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		
		String memberBirth = "";
		
		if(Integer.parseInt(birthMonth)<10) {
			birthMonth="0"+(String)birthMonth;
		}else {
			birthMonth=(String)birthMonth;
		}
		if(Integer.parseInt(birthDay)<10) {
			birthDay= "0"+(String)birthDay;
		}else {
			birthDay= (String)birthDay;
		}
		
		memberBirth = birthYear+"/"+birthMonth+"/"+birthDay;
		
		Member m = new Member(memberId, memberPwd, memberBirth, phone, email);
		
		Member memUpdate = new MemberService().updateMember(m);
		
		HttpSession session = request.getSession();
		
		if(memUpdate != null) {
			session.setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			session.setAttribute("loginUser", memUpdate);
			response.sendRedirect(request.getContextPath()+"/myPage.me");
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
}
