package com.semi.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.inquiry.model.vo.Board;
import com.semi.board.review.model.vo.Review;
import com.semi.common.JDBCTemplate;
import com.semi.common.vo.PageInfo;
import com.semi.member.model.dao.MemberDao;
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

	//전체도서리스트 조회..a
	public ArrayList<Product> selectAttachmentList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> list = new ProductDao().selectAttachment(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//도서 검색시 보여줄 리스트 수..a
	public int searchCount(String search) {
			
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new ProductDao().searchCount(conn,search);
			
		JDBCTemplate.close(conn);
			
		return listCount;
	}
		
	//도서 검색
//	public ArrayList<Product> searchBook(String search, PageInfo pi) {
//		
//		Connection conn = JDBCTemplate.getConnection();
//			
//		ArrayList<Product> list = new ProductDao().searchBook(conn,search,pi);
//			
//		JDBCTemplate.close(conn);
//			
//		return list;
//		}
	
		public ArrayList<Product> searchBook(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
			
		ArrayList<Product> list = new ProductDao().searchBook(conn,search);
			
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
	
	//신간도서 게시글 수 조회..a
	public int selectNewCount() {

		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new ProductDao().selectNewCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	

	//신간도서리스트 조회..a
		public ArrayList<Product> selectNewAttachList(PageInfo pi) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectNewAttachList(conn,pi);
			
			JDBCTemplate.close(conn);
			
			return list;
		}
	
	//카테고리 클릭시 출력되는 도서 리스트 조회..a
	public ArrayList<Product> selectAttachmentCList(PageInfo pi, int cate) {
		
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
			
			int listCount = new ProductDao().selectProListCount(conn);
			
			JDBCTemplate.close(conn);
			
			return listCount;
		}

	//카테고리 총 게시물 수..a
	public int selectCListCount(int cate) {
		
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
	
	//상품 상세 페이지
		public Product productItemDetail(int pno) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Product p = new ProductDao().productItemDetail(conn,pno);
			
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
		public ArrayList<Product> selectAdminProduct(PageInfo pi) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().selectAdminProduct(conn,pi);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//상품 상세조회 - 관리자
		public Product detailAdminProduct(int pno) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Product item = new ProductDao().detailAdminProduct(conn,pno);
			
			JDBCTemplate.close(conn);
			
			return item;
		}

		//상품 상세조회 이미지 - 관리자
		public ArrayList<Product> detailAdminPath(int pno) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> Path = new ProductDao().detailAdminPath(conn,pno);
			
			JDBCTemplate.close(conn);
			
			return Path;
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
		public int relAdminProduct(int rel2) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int rel = new ProductDao().relAdminProduct(conn,rel2);
			
			JDBCTemplate.close(conn);
			
			return rel;
		}

		//상품 삭제(관리자)
		public int deleteProductAdmin(int pno) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new ProductDao().deleteProductAdmin(conn,pno);
					
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		}

		//입고조회 키워드 검색 - 관리자
		public ArrayList<Product> searchReceiveAdmin(int num, String search) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().searchReceiveAdmin(conn,num,search);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//출고조회 키워드 검색 - 관리자
		public ArrayList<Product> searchReleaseAdmin(int num, String search) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().searchReleaseAdmin(conn,num,search);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//상품관리 키워드 검색 - 관리자
		public ArrayList<Product> searchProductAdmin(int num, String search, PageInfo pi) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Product> list = new ProductDao().searchProductAdmin(conn,num,search,pi);
			
			JDBCTemplate.close(conn);
			
			return list;
		}

		//도서 수정시 불러올 상품 리스트
		public Product modifiPro(int proNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Product pro = new ProductDao().productDetail(conn,proNo);
			
			JDBCTemplate.close(conn);
			
			return pro;
		}
		
		//총 상품 개수 (관리자 - 페이징)
		public int selProductAdminCount() {
			
			Connection conn = JDBCTemplate.getConnection();
					
			int listCount = new ProductDao().selProductAdminCount(conn);
			
			JDBCTemplate.close(conn);
			
			return listCount;
		}

		//상세검색 상품 수
		public int searchProductCount(int num, String search) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int listCount = new ProductDao().searchProductCount(conn,num,search);
			
			JDBCTemplate.close(conn);
			
			return listCount;
		}

		


		//도서 정보 수정
		public int updateProduct(Product p, Attachment at) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			//첨부파일없어도 등록
			int result = new ProductDao().updateProduct(conn,p);
			
			int result2 =1;
			
			if(at !=null) { //첨부파일이 있는 경우
				if(at.getAttachmentId() != 0) { //기존의 첨부파일이 있었을 경우 (변경)
					result2 = new ProductDao().updateAttachment(conn,at);
				}else {//기존의 첨부파일이 없었을 경우 (추가)
					result2 = new ProductDao().newInsertAttachment(conn,at);
				}
			}
			
			if(result>0 && result2>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result*result2;
		}

		/*
		 * public Product modiItem(int proNo, int cateNum) {
		 * 
		 * Connection conn = JDBCTemplate.getConnection();
		 * 
		 * Product pro = new ProductDao().productItemDetail(conn,proNo,cateNum);
		 * 
		 * JDBCTemplate.close(conn);
		 * 
		 * return pro; }
		 */
}