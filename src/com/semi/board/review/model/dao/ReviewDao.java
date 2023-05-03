package com.semi.board.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.board.review.model.vo.Review;
import com.semi.common.JDBCTemplate;
import com.semi.product.model.dao.ProductDao;

public class ReviewDao {
	
private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String filePath = ProductDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(filePath));
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//리플 작성
		public int insertReview(Connection conn, Review r) {
			
			int result = 0;
			PreparedStatement pstmt =null;
			
			String sql = prop.getProperty("insertReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, r.getMemberNo());
					pstmt.setString(2, r.getProductNo());
					pstmt.setInt(3, r.getReviewStar());
					pstmt.setString(4, r.getReviewContent());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		//댓글 목록 조회
		public ArrayList<Review> selectReview(Connection conn, String productNo) {
			
			ArrayList<Review> rlist = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, productNo);
					
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					rlist.add(new Review(rset.getInt("REVIEW_STAR"),
										rset.getString("REVIEW_CONTENT"),
										rset.getString("CREATE_DATE"),
										rset.getString("MEMBER_ID")));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return rlist;
		}

		//구매한 상품시에만 댓글 버튼 보이기
		public int rBtnCk(Connection conn, String productNo, String memberNo) {
			
			int count = 0;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("rBtnCk");
			
			try {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, productNo);
					pstmt.setString(2, memberNo);
					
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					count = 1; //조회되면 1 반환.. 구매한 상품
								//없으면 0
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return count;
		}

		//회원이 작성한 댓글 삭제하기
		public int deleteMyReview(Connection conn, int memNo, int reviewNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteMyReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memNo);
				pstmt.setInt(2, reviewNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		//리뷰 작성하거 있으면 버튼 없애기
		public int oneCk(Connection conn, String productNo, String memberNo) {
			
			int count = 0;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("oneCk");
			
			try {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, productNo);
					pstmt.setString(2, memberNo);
					
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					count = 1; //1이면 작성 리뷰가 있다는 뜻
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("dao"+count);
			return count;
		}

}
