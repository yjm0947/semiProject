package com.semi.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.common.JDBCTemplate;
import com.semi.common.vo.PageInfo;
import com.semi.product.model.vo.Attachment;
import com.semi.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		
		String filePath = ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(filePath));
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//도서 등록
	public int insertProduct(Connection conn, int category, String productName, String publisher, String author,
			int price, int sale, int stock, String des) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, category);
				pstmt.setString(2, productName);
				pstmt.setString(3, publisher);
				pstmt.setString(4, author);
				pstmt.setInt(5, price);
				pstmt.setInt(6, sale);
				pstmt.setInt(7, stock);
				pstmt.setString(8, des);
				
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//상품 등록
	public int insertProduct(Connection conn, int category, String productName,String publisher, int price, int sale, int stock,
			String des) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProductItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, category);
				pstmt.setString(2, productName);
				pstmt.setString(3, publisher);
				pstmt.setInt(4, price);
				pstmt.setInt(5, sale);
				pstmt.setInt(6, stock);
				pstmt.setString(7, des);
				
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//첨부파일 등록
	public int insertAttachment(Connection conn, ArrayList<Attachment> list) {

		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getAttachmentName());
					pstmt.setString(2, at.getAttachmentChange());
					pstmt.setString(3, at.getAttachmentPath());
					pstmt.setInt(4, at.getFileLivel());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//도서리스트 조회
	public ArrayList<Product> selectAttachment(Connection conn, PageInfo pi) {
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO")
						,rset.getString("PRODUCT_CATEGORY")
						,rset.getString("PRODUCT_NAME")
						,rset.getString("PRODUCT_PUBLISHER")
						,rset.getString("PRODUCT_TEXT")
						,rset.getInt("PRODUCT_PRICE")
						,rset.getInt("PRODUCT_SALES_RATE")
						,rset.getString("AUTHOR")
						,rset.getDate("CREATE_DATE")
						,rset.getString("titleImg")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	//카테고리 클릭시 출력되는 도서 리스트 조회..a
	public ArrayList<Product> selectAttachmentC(Connection conn, PageInfo pi, int cate) {

		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentListC");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cate);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO")
						,rset.getString("PRODUCT_CATEGORY")
						,rset.getString("PRODUCT_NAME")
						,rset.getString("PRODUCT_PUBLISHER")
						,rset.getString("PRODUCT_TEXT")
						,rset.getInt("PRODUCT_PRICE")
						,rset.getInt("PRODUCT_SALES_RATE")
						,rset.getString("AUTHOR")
						,rset.getDate("CREATE_DATE")
						,rset.getString("titleImg")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	//베스트 도서 조회(출고순)
	public ArrayList<Product> selectBestAttachList(Connection conn, PageInfo pi) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBestAttachList");

		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO")
						,rset.getString("PRODUCT_CATEGORY")
						,rset.getString("PRODUCT_NAME")
						,rset.getString("PRODUCT_PUBLISHER")
						,rset.getString("PRODUCT_TEXT")
						,rset.getInt("PRODUCT_PRICE")
						,rset.getInt("PRODUCT_SALES_RATE")
						,rset.getString("AUTHOR")
						,rset.getDate("CREATE_DATE")
						,rset.getString("titleImg")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
		
	}

	//신간도서리스트 조회..a
		public ArrayList<Product> selectNewAttachList(Connection conn, PageInfo pi) {
			
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectNewAttachList");
			
			try {
				int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
				int endRow = (startRow+pi.getBoardLimit())-1;
				
				pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
							,rset.getString("PRODUCT_CATEGORY")
							,rset.getString("PRODUCT_NAME")
							,rset.getString("PRODUCT_PUBLISHER")
							,rset.getString("PRODUCT_TEXT")
							,rset.getInt("PRODUCT_PRICE")
							,rset.getInt("PRODUCT_SALES_RATE")
							,rset.getString("AUTHOR")
							,rset.getDate("CREATE_DATE")
							,rset.getString("titleImg")));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}


	//상품 리스트 조회..a
	public ArrayList<Product> selectItem(Connection conn, PageInfo pi) {
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentListP");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO")
						,rset.getString("PRODUCT_NAME")
						,rset.getString("PRODUCT_PUBLISHER")
						,rset.getString("PRODUCT_TEXT")
						,rset.getInt("PRODUCT_PRICE")
						,rset.getInt("PRODUCT_SALES_RATE")
						,rset.getDate("CREATE_DATE")
						,rset.getString("titleImg")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	//도서 총 게시글..a
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return listCount;
		}
	

		//카테고리별 도서 총 게시물 수..a
	public int selectCListCount(Connection conn, int cate) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectProCListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
		}
		
		//검색 도서 리스트 수
		public int searchCount(Connection conn, String search) {
			
			int listCount = 0;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("searchCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return listCount;
			}
	
		//검색한 도서 리스트
		public ArrayList<Product> searchBook(Connection conn, String search, PageInfo pi) {
			
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("searchBook");
	
			try {
				int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
				int endRow = (startRow+pi.getBoardLimit())-1;
				
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
										,rset.getString("PRODUCT_CATEGORY")
										,rset.getString("PRODUCT_NAME")
										,rset.getString("PRODUCT_PUBLISHER")
										,rset.getString("PRODUCT_TEXT")
										,rset.getInt("PRODUCT_PRICE")
										,rset.getInt("PRODUCT_SALES_RATE")
										,rset.getString("AUTHOR")
										,rset.getDate("CREATE_DATE")
										,rset.getString("titleImg")));
				}
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}
		
		//신간 도서 총 게시글 수..a
		public int selectNewCount(Connection conn) {
					
			int listCount = 0;
			ResultSet rset = null;
			Statement stmt = null;
					
			String sql = prop.getProperty("selectNewCount");
					
			try {
				stmt = conn.createStatement();
						
				rset = stmt.executeQuery(sql);
						
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
					
			return listCount;
		}


		//상품 총 게시글 수..a
		public int selectProListCount(Connection conn) {
			
			int listCount = 0;
			ResultSet rset = null;
			Statement stmt = null;
			
			String sql = prop.getProperty("selectProListCount");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			
			return listCount;
		}
	
		//상품 상세 정보
		public Product productItemDetail(Connection conn, int pno) {
			Product p = null;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("productDetail");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p = new Product(rset.getInt("PRODUCT_NO"),
							rset.getString("PRODUCT_NAME"),
							rset.getString("PRODUCT_PUBLISHER"),
							rset.getString("PRODUCT_TEXT"),
							rset.getInt("PRODUCT_PRICE"),
							rset.getInt("PRODUCT_SALES_RATE"),
							rset.getString("TITLEIMG"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return p;
		}

	//도서, 상품 상세 페이지
	public Product productDetail(Connection conn, int pno) {
		
		Product p = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("productDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getInt("PRODUCT_NO"),
								rset.getString("PRODUCT_NAME"),
								rset.getString("PRODUCT_PUBLISHER"),
								rset.getString("PRODUCT_TEXT"),
								rset.getInt("PRODUCT_PRICE"),
								rset.getInt("PRODUCT_SALES_RATE"),
								rset.getString("AUTHOR"),
								rset.getString("TITLEIMG"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return p;
	}
	
	//도서, 쇼핑 상세페이지의 상세이미지..
	public Product productDetail2(Connection conn, int pno) {
		
		Product p2 = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("productDetail2");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p2 = new Product(rset.getString("TITLEIMG"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return p2;
	}
	
	//메인페이지 베스트 도서 4개
	public ArrayList<Product> selectBestAttachList(Connection conn) {
			
			ArrayList<Product> list = new ArrayList<>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("mainBestBook");
	
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
							,rset.getString("PRODUCT_CATEGORY")
							,rset.getString("PRODUCT_NAME")
							,rset.getString("PRODUCT_PUBLISHER")
							,rset.getString("PRODUCT_TEXT")
							,rset.getInt("PRODUCT_PRICE")
							,rset.getInt("PRODUCT_SALES_RATE")
							,rset.getString("AUTHOR")
							,rset.getDate("CREATE_DATE")
							,rset.getString("titleImg")));
				}
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			return list;
			
		}	

	//메인페이지 신간 도서 리스트 4개
	public ArrayList<Product> newBookList(Connection conn) {
		
		ArrayList<Product> newBook = new ArrayList<>();
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("newBookList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				newBook.add(new Product(rset.getInt("PRODUCT_NO")
										,rset.getString("PRODUCT_NAME")
										,rset.getString("PRODUCT_PUBLISHER")
										,rset.getInt("PRODUCT_PRICE")
										,rset.getInt("PRODUCT_SALES_RATE")
										,rset.getString("titleImg")));
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return newBook;
	}
	
	//메인페이지 상품 리스트 4개
	public ArrayList<Product> newProList(Connection conn) {
		
		ArrayList<Product> newPro = new ArrayList<>();
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("newProList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				newPro.add(new Product(rset.getInt("PRODUCT_NO")
									,rset.getString("PRODUCT_NAME")
									,rset.getString("PRODUCT_PUBLISHER")
									,rset.getInt("PRODUCT_PRICE")
									,rset.getInt("PRODUCT_SALES_RATE")
									,rset.getString("titleImg")));
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return newPro;
	}
	
	//상품관리 조회
		public ArrayList<Product> selectAdminProduct(Connection conn) {
			
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectAdminProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
									  ,rset.getString("PRODUCT_CATEGORY")
									  ,rset.getString("PRODUCT_NAME")
									  ,rset.getString("PRODUCT_PUBLISHER")
									  ,rset.getString("PRODUCT_TEXT")
									  ,rset.getInt("PRODUCT_PRICE")
									  ,rset.getInt("PRODUCT_SALES_RATE")
									  ,rset.getInt("PRODUCT_STOCK")
									  ,rset.getString("AUTHOR")
									  ,rset.getDate("CREATE_DATE")
									  ,rset.getString("STATUS")));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}

		//상품 상세조회
		public Product detailAdminProduct(Connection conn, int pno) {
			
			Product item = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("detailAdminProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					item = new Product(rset.getInt("PRODUCT_NO")
							  ,rset.getString("PRODUCT_CATEGORY")
							  ,rset.getString("PRODUCT_NAME")
							  ,rset.getString("PRODUCT_PUBLISHER")
							  ,rset.getString("PRODUCT_TEXT")
							  ,rset.getInt("PRODUCT_PRICE")
							  ,rset.getInt("PRODUCT_SALES_RATE")
							  ,rset.getInt("PRODUCT_STOCK")
							  ,rset.getString("AUTHOR")
							  ,rset.getDate("CREATE_DATE")
							  ,rset.getString("STATUS"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return item;
		}

		//입고조회 리스트
		public ArrayList<Product> selectReceiveAdmin(Connection conn) {
			
			ArrayList<Product> list = new ArrayList<>();
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectReceiveAdmin");
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
										,rset.getString("PRODUCT_CATEGORY")
										,rset.getString("PRODUCT_NAME")
										,rset.getInt("PRODUCT_STOCK")
										,rset.getDate("CREATE_DATE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			return list;
		}

		//출고조회 리스트
		public ArrayList<Product> selectReleaseAdmin(Connection conn) {
			
			ArrayList<Product> list = new ArrayList<>();
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectReleaseAdmin");
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
										,rset.getString("PRODUCT_CATEGORY")
										,rset.getString("PRODUCT_NAME")
										,rset.getInt("QUANTITY")
										,rset.getString("MEMBER_ID")
										,rset.getDate("CREATED_AT")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			return list;
		}

		//출고량 추출
		public int relAdminProduct(Connection conn, int rel2) {
			
			int rel = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("relAdminProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rel2);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					rel = rset.getInt("QUANTITY");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return rel;
		}

		//상품 삭제 (관리자)
		public int deleteProductAdmin(Connection conn, int pno) {
			
			int result = 0 ;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteProductAdmin");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
		}

		//입고조회 키워드 검색 - 관리자
		public ArrayList<Product> searchReceiveAdmin(Connection conn, int num, String search) {
			
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = "";
			
			switch(num) {
			case 1 : sql = prop.getProperty("searchReceivePnoAdmin");
				break;
			case 2 : sql = prop.getProperty("searchReceivePnameAdmin");
				break;
			case 3 : sql = prop.getProperty("searchReceiveCateAdmin");
				break;
			case 4 : sql = prop.getProperty("searchReveiveCreateAdmin");
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//상품번호 키워드 검색시 문자열로 들어왔을때 처리
				char chkSearch = '\u0000';
				
				for(int i=0; i<search.length(); i++) {
					chkSearch = search.charAt(i); 
				}
				
				if(num == 1 && (int)chkSearch < 48 ||(int)chkSearch >57) {
					return list;
				}
				
				switch(num) {
					case 1 : pstmt.setInt(1, Integer.parseInt(search));
						break;
					case 2: pstmt.setString(1, search);
						break;
					case 3 : switch(search) {
								case "소설" : search = "1";
									break;
								case "에세이" : search = "2";
									break;
								case "자기계발" : search = "3";
									break;
								case "경제" : search = "4";
									break;
								case "경영" : search = "4";
									break;
								case "경제/경영" : search = "4";
									break;
								case "인문학" : search = "5";
									break;
								case "정치" : search = "6";
									break;
								case "사회" : search = "6";
									break;
								case "정치/사회" : search = "6";
									break;
								case "아이템" : search = "7";
									break;
							}
						pstmt.setString(1, search);
						break;
					case 4 : pstmt.setString(1, search);
						break;
				}
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
										,rset.getString("PRODUCT_CATEGORY")
										,rset.getString("PRODUCT_NAME")
										,rset.getInt("PRODUCT_STOCK")
										,rset.getDate("CREATE_DATE")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}

		//출고조회 키워드 검색 - 관리자
		public ArrayList<Product> searchReleaseAdmin(Connection conn, int num, String search) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = "";
			
			switch(num) {
				case 1 : sql = prop.getProperty("searchReleasePno");
					break;
				case 2 : sql = prop.getProperty("searchReleasePname");
					break;
				case 3 : sql = prop.getProperty("searchReleaseCate");
					break;
				case 4 : sql = prop.getProperty("searchReleaseId");
					break;
				case 5 : sql = prop.getProperty("searchReleaseDate");
					break;
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//상품번호 키워드 검색시 문자열로 들어왔을때 처리
				char chkSearch = '\u0000';
				
				for(int i=0; i<search.length(); i++) {
					chkSearch = search.charAt(i); 
				}
				
				if(num == 1 && (int)chkSearch < 48 ||(int)chkSearch >57) {
					return list;
				}
				
				switch(num) {
					case 1 : pstmt.setInt(1, Integer.parseInt(search));
						break;
					case 2 : pstmt.setString(1, search);
						break;
					case 3 : switch(search) {
								case "소설" : search = "1";
									break;
								case "에세이" : search = "2";
									break;
								case "자기계발" : search = "3";
									break;
								case "경제" : search = "4";
									break;
								case "경영" : search = "4";
									break;
								case "경제/경영" : search = "4";
									break;
								case "인문학" : search = "5";
									break;
								case "정치" : search = "6";
									break;
								case "사회" : search = "6";
									break;
								case "정치/사회" : search = "6";
									break;
								case "아이템" : search = "7";
									break;
							}
						pstmt.setString(1, search);
							break;
					case 4 :
					case 5 : pstmt.setString(1, search);
						break;
				}
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
										,rset.getString("PRODUCT_CATEGORY")
										,rset.getString("PRODUCT_NAME")
										,rset.getInt("QUANTITY")
										,rset.getString("MEMBER_ID")
										,rset.getDate("CREATED_AT")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}

		//상품관리 키워드 검색 - 관리자
		public ArrayList<Product> searchProductAdmin(Connection conn, int num, String search) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = "";
			
			switch(num) {
				case 1 : sql = prop.getProperty("searchProductPno");
					break;
				case 2 : sql = prop.getProperty("searchProductCate");
					break;
				case 3 : sql = prop.getProperty("searchProductPname");
					break;
				case 4 : sql = prop.getProperty("searchProductPub");
					break;
				case 5 : sql = prop.getProperty("searchProductAthor");
					break;
				case 6 : sql = prop.getProperty("searchProductDate");
					break;
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//상품번호 키워드 검색시 문자열로 들어왔을때 처리
				char chkSearch = '\u0000';
				
				for(int i=0; i<search.length(); i++) {
					chkSearch = search.charAt(i); 
				}
				
				if(num == 1 && (int)chkSearch < 48 ||(int)chkSearch >57) {
					return list;
				}
				
				switch(num) {
					case 1 : pstmt.setInt(1, Integer.parseInt(search));
						break;
					case 2 : switch(search) {
								case "소설" : search = "1";
									break;
								case "에세이" : search = "2";
									break;
								case "자기계발" : search = "3";
									break;
								case "경제" : search = "4";
									break;
								case "경영" : search = "4";
									break;
								case "경제/경영" : search = "4";
									break;
								case "인문학" : search = "5";
									break;
								case "정치" : search = "6";
									break;
								case "사회" : search = "6";
									break;
								case "정치/사회" : search = "6";
									break;
								case "아이템" : search = "7";
									break;
							}
						pstmt.setString(1, search);
							break;
					case 3 :
					case 4 :
					case 5 :
					case 6 : pstmt.setString(1, search);
						break;
				}
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Product(rset.getInt("PRODUCT_NO")
									  ,rset.getString("PRODUCT_CATEGORY")
									  ,rset.getString("PRODUCT_NAME")
									  ,rset.getString("PRODUCT_PUBLISHER")
									  ,rset.getString("PRODUCT_TEXT")
									  ,rset.getInt("PRODUCT_PRICE")
									  ,rset.getInt("PRODUCT_SALES_RATE")
									  ,rset.getInt("PRODUCT_STOCK")
									  ,rset.getString("AUTHOR")
									  ,rset.getDate("CREATE_DATE")
									  ,rset.getString("STATUS")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}	
}