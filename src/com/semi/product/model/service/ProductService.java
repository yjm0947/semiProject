package com.semi.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.review.model.vo.Review;
import com.semi.common.JDBCTemplate;
import com.semi.common.vo.PageInfo;
import com.semi.product.model.dao.ProductDao;
import com.semi.product.model.vo.Attachment;
import com.semi.product.model.vo.Product;

public class ProductService {
	
	//도서등록
	public int insertProduct(int category, String productName, String publisher, String author, int price, int sale,
			int stock, String des, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		//첨부파일 없어도 커밋해야됨
		int result = new ProductDao().insertProduct(conn,category,productName,publisher,author,price,sale,stock,des);
		
		int result2 = 1; //첨부파일
		
		if(list!=null) {//첨부파일 있는 경우
			result2 = new ProductDao().insertAttachment(conn,list);
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	//상품등록
	public int insertProduct(int category, String productName,String publisher, int price, int sale, int stock, String des,
			ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		//첨부파일 없어도 커밋해야됨
		int result = new ProductDao().insertProduct(conn,category,productName,publisher,price,sale,stock,des);
		
		int result2 = 1; //첨부파일
		
		if(list!=null) {//첨부파일 있는 경우
			result2 = new ProductDao().insertAttachment(conn,list);
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	//전체도서리스트 조회
	public ArrayList<Product> selectAttachmentList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> list = new ProductDao().selectAttachment(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//베스트 도서 리스트 조회(출고순)
	public ArrayList<Product> selectBestAttachList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> list = new ProductDao().selectBestAttachList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}

	//신간도서리스트 조회
		public ArrayList<Product> selectNewAttachList(PageInfo pi) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectNewAttachList(conn,pi);
			
			JDBCTemplate.close(conn);
			
			return list;
		}
	
	//카테고리 클릭시 출력되는 도서 리스트 조회
	public ArrayList<Product> selectAttachmentCList(PageInfo pi, String cate) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> list = new ProductDao().selectAttachmentC(conn,pi,cate);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//상품 리스트 조회
	public ArrayList<Product> selectItem(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> list = new ProductDao().selectItem(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//도서 총 게시글 개수 
	public int selectListCount() {

		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new ProductDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	
	//상품 총 게시글 개수 
		public int selectProListCount() {

			Connection conn = JDBCTemplate.getConnection();
			
			int listCount = new ProductDao().selectListCount(conn);
			
			JDBCTemplate.close(conn);
			
			return listCount;
		}

	//카테고리 총 게시물 수
	public int selectCListCount(String cate) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new ProductDao().selectCListCount(conn,cate);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

		//도서,상품 상세 페이지
	public Product productDetail(int pno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Product p = new ProductDao().productDetail(conn,pno);
		
		JDBCTemplate.close(conn);
		
		return p;
	}
	//도서,상품 상세 페이지.. 상세이미지
	public Product productDetail2(int pno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Product p2 = new ProductDao().productDetail2(conn,pno);
		
		JDBCTemplate.close(conn);
		
		return p2;
	}
	
	//메인페이지 베스트도서 4개
		public ArrayList<Product> selectBestAttachList() {

			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectBestAttachList(conn);
			
			JDBCTemplate.close(conn);
			
			return list;
		}
	
	//메인페이지 신간 도서 4개
	public ArrayList<Product> newBookList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> newBook = new ProductDao().newBookList(conn);
		
		JDBCTemplate.close(conn);
		
		return newBook;
	}

	//메인페이지 쇼핑 목록 4개
	public ArrayList<Product> newProList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> newPro = new ProductDao().newProList(conn);
		
		JDBCTemplate.close(conn);
		
		return newPro;
	}
	
	//상품관리 조회
		public ArrayList<Product> selectAdminProduct() {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectAdminProduct(conn);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//상품 상세조회
		public Product detailAdminProduct(int pno) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Product item = new ProductDao().detailAdminProduct(conn,pno);
			
			JDBCTemplate.close(conn);
			
			return item;
		}

		//입고조회 리스트
		public ArrayList<Product> selectReceiveAdmin() {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectReceiveAdmin(conn);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//출고조회 리스트
		public ArrayList<Product> selectReleaseAdmin() {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectReleaseAdmin(conn);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//출고량 추출
		public int relAdminProduct() {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int rel = new ProductDao().relAdminProduct(conn);
			
			JDBCTemplate.close(conn);
			
			return rel;
		}
}