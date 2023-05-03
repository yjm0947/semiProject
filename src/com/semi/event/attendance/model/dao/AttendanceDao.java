package com.semi.event.attendance.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.semi.common.JDBCTemplate;
import com.semi.product.model.dao.ProductDao;

public class AttendanceDao {
	
private Properties prop = new Properties();
	
	public AttendanceDao() {
		
		String filePath = ProductDao.class.getResource("/sql/event/event-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(filePath));
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//첫 출첵페이지에서 출력해줄 도장개수(출석날)알아오기
	public int dayCount(Connection conn, int memberNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("dayCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	//출석체크일 업데이트
	public int upDate(Connection conn, int memberNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("upDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//출석체크 다 하면 0일로다시 바꿔주기
	public int resetCount(Connection conn, int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("resetCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//출석체크 날짜 체크 메소드
	public int attendanceOX(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("attendanceOX");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
