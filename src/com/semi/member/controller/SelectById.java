package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectById
 */
@WebServlet("/selectbyid.me")
public class SelectById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 이름 과 폰번호 생년월일로 아이디 찾기
		
		request.setCharacterEncoding("UTF-8");
		//HttpSession session = request.getSession();
		
		Member m = new Member();
		
		m.setMemberName(request.getParameter("memberName"));
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		String phone = request.getParameter("phone");
		m.setPhone(phone);
		
		if(Integer.parseInt(birthMonth)<10) {
			birthMonth = "0"+(String)birthMonth;
		}
		
		if(Integer.parseInt(birthDay)<10) {
			birthDay = "0"+(String)birthDay;
		}
		String memberBirth = birthYear+birthMonth+birthDay;
		 
		
		m.setMemberBirth(memberBirth);
		
		
		
		/* m.setPhone(request.getParameter("phone")); */
		
		String srcIdM = new MemberService().selectId(m);
		m.setMemberId(srcIdM);
		
		System.out.println(srcIdM);
		System.out.println(birthYear);
		System.out.println(memberBirth);
		System.out.println(m);
		/*
		 * JSONObject jObj = new JSONObject(); jObj.put(m.getMemberName());
		 * jObj.put(key, value)
		 */
		response.setContentType("json/application; charset=UTF-8 "); 
		
		JSONArray jArr = new JSONArray();
		
		jArr.add(srcIdM);
		
		response.getWriter().print(jArr);
		//}
		
	}

}
