package com.semi.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.common.MyFileRenamePolicy;
import com.semi.product.model.service.ProductService;
import com.semi.product.model.vo.Attachment;
import com.semi.product.model.vo.Product;

/**
 * Servlet implementation class ProductModificationController
 */
@WebServlet("/product.md")//도서 수정시 불러올 리스트
public class ProductModificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductModificationController() {
		
		//상품 수정
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//아이템으로 들어올시
		String cate = request.getParameter("cate");
		
		int proNo = Integer.parseInt(request.getParameter("ppro"));
		int cateNum = 0;
		
		if(cate.equals("아이템")) {
			cateNum = 7;
		}
		System.out.println(cateNum);
		
		if(cateNum==7) {//들어온게 아이템이면
			//아이템 리스트 조회
			Product proItem = new ProductService().productItemDetail(proNo);
//			System.out.println(proItem);
			
			Product proItem2 = new ProductService().productDetail2(proNo);
			
			request.setAttribute("pro", proItem);
			request.setAttribute("pro2", proItem2);
			
			
		}else {
			//상품 수전 전 리스트 조회
			Product pro = new ProductService().modifiPro(proNo);
			//상세이미지도 가져오기
			Product p2 = new ProductService().productDetail2(proNo);
			//System.out.println(p2);
			
			request.setAttribute("pro", pro);
			request.setAttribute("pro2", p2);
		};
		
		request.getRequestDispatcher("views/product/productModifi.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {

			//전송용량 제한
			int maxSize = 20 * 1024 * 1024;
			//저장할 파일 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/");
			
			//파일명 저장
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			int proNo = Integer.parseInt(multiRequest.getParameter("proNo"));
			String category = multiRequest.getParameter("category");
			String productName = multiRequest.getParameter("pro_Name");
			String publisher = multiRequest.getParameter("pro_Publisher");
			String author = multiRequest.getParameter("pro_author");
			int price = Integer.parseInt(multiRequest.getParameter("pro_Price"));
			int sale = Integer.parseInt(multiRequest.getParameter("pro_sales"));
			int stock= Integer.parseInt(multiRequest.getParameter("pro_Stock"));
			String des = multiRequest.getParameter("pro_Des");
			
			Product p = new Product(proNo,category,productName,publisher,des,price,sale,stock,author);
			
			Attachment at = null;
			Attachment at2 = null;
			
			//첨부파일이 있으면
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				at = new Attachment();
					at.setAttachmentName(multiRequest.getOriginalFileName("reUpfile"));
					at.setAttachmentChange(multiRequest.getFilesystemName("reUpfile"));
					at.setAttachmentPath("/resources/");
					
					//기존 첨부 파일 있으면,,, 즉 기존 파일 있는데 새로운 파일 있으면
					if(multiRequest.getParameter("fileNo") != null) {
						//파일번호 이용하여 데이터 변경
						at.setAttachmentId(Integer.parseInt(multiRequest.getParameter("fileNo")));
						
						//기존에 첨부파일 삭제
						new File(savePath+"/"+multiRequest.getParameter("originFileName")).delete();
						
					}else {//원래 첨부파일이 없었고 새롭게 들어온 경우
						//현재 게시글 번호를 참조하게 INSERT 하기
						at.setBoardNo(proNo);
					}
				}
			
			int result = new ProductService().updateProduct(p,at);
			
			//상세이미지 첨부파일 바꾸기
			if(multiRequest.getOriginalFileName("reUpfile2") != null) {
				at2 = new Attachment();
					at2.setAttachmentName(multiRequest.getOriginalFileName("reUpfile2"));
					at2.setAttachmentChange(multiRequest.getFilesystemName("reUpfile2"));
					at2.setAttachmentPath("/resources/");
					
					//기존 첨부 파일 있으면,,, 즉 기존 파일 있는데 새로운 파일 있으면
					if(multiRequest.getParameter("fileNo2") != null) {
						//파일번호 이용하여 데이터 변경
						at2.setAttachmentId(Integer.parseInt(multiRequest.getParameter("fileNo2")));
						
						//기존에 첨부파일 삭제
						new File(savePath+"/"+multiRequest.getParameter("originFileName2")).delete();
						
					}else {//원래 첨부파일이 없었고 새롭게 들어온 경우
						//현재 게시글 번호를 참조하게 INSERT 하기
						at2.setBoardNo(proNo);
					}
				}	
			
				//상세이미지
				int result2 = 1;
				result2 = new ProductService().updateProduct(p,at2);
				
				
				if(result*result2>0) { //성공
					request.getSession().setAttribute("alertMsg", "게시글 수정 성공");
					response.sendRedirect(request.getContextPath()+"/items.admin?currentPage=1");
				}else {//실패
					request.setAttribute("errorMsg", "게시글 수정 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
			}
		}

}
