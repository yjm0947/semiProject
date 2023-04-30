package com.semi.board.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.semi.board.model.vo.Board;
import com.semi.common.JDBCTemplate;
import com.semi.product.model.vo.Attachment;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		
		String filePath = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//공지사항 조회
	public ArrayList<Board> selectNoticeList(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("MEMBER_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")
								  ,rset.getInt("BOARD_COUNT")
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
	
	//공지사항 등록
	public int insertNotice(Connection conn, Board b, int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//공지사항 등록 첨부파일
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
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//공지사항 상세조회
	public Board detailBoardAdmin(Connection conn, int bno) {
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailBoardAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("MEMBER_NAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getInt("BOARD_COUNT")
							 ,rset.getDate("CREATE_DATE")
							 ,rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return b;
	}

	//공지사항 상세조회 파일
	public ArrayList<Attachment> detailAttachmentAdmin(Connection conn, int bno) {
		
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("detailAttachmentAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("ATTACHMENT_ID")
									   ,rset.getString("ATTACHMENT_NAME")
									   ,rset.getString("ATTACHMENT_CHANGE")
									   ,rset.getString("ATTACHMENT_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public Board updateNotice(Connection conn, int bno) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailBoardAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("MEMBER_NAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getInt("BOARD_COUNT")
							 ,rset.getDate("CREATE_DATE")
							 ,rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	public ArrayList<Attachment> updateAttachment(Connection conn, int bno) {
		
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("detailAttachmentAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("ATTACHMENT_ID")
						   ,rset.getString("ATTACHMENT_NAME")
						   ,rset.getString("ATTACHMENT_CHANGE")
						   ,rset.getString("ATTACHMENT_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int updateNoticeAdmin(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNoticeAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateAttachmentAdmin(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachmentAdmin");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getAttachmentName());
				pstmt.setString(2, at.getAttachmentChange());
				pstmt.setString(3, at.getAttachmentPath());
				pstmt.setInt(4, at.getAttachmentId());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int newAtAdmin(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("newAtAdmin");
		
		try {
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, at.getBoardNo());
				pstmt.setString(2, at.getAttachmentName());
				pstmt.setString(3, at.getAttachmentChange());
				pstmt.setString(4, at.getAttachmentPath());
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			result=0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteNoticeAdmin(Connection conn, int bno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNoticeAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//1:1문의 게시판 조회
	public ArrayList<Board> selectInquireList(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquireList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("MEMBER_ID")
								  ,rset.getString("PRODUCT_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")
								  ,rset.getString("BOARD_ANSWERED")
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

	public Board inquireDetailAdmin(Connection conn, int bno) {
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("inquireDetailAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getString("BOARD_ANSWERED"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	public int inquireAnswer(Connection conn, int bno, String answer) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("inquireAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//FAQ조회
	public ArrayList<Board> selectFaqAdmin(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")
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

	
	//FAQ등록
	public int insertFaqAdmin(Connection conn, int mno, String faqtitle, String faqcontent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaqAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setString(2, faqtitle);
			pstmt.setString(3, faqcontent);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//FAQ 수정전 조회
	public Board selFaqAdmin(Connection conn, int bno) {
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selFaqAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	//FAQ 수정
	public int updateFaqAdmin(Connection conn, int bno, String title, String content) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaqAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//FAQ 삭제
	public int delFaqAdmin(Connection conn, int bno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("delFaqAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//공지사항 총 게시물 수
	public int selNoticeAdminCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selNoticeAdminCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return listCount;
	}

	//공지사항 키워드 검색 리스트
	public ArrayList<Board> searchNoticeAdmin(Connection conn, int num, String search) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		switch(num) {
			//게시글번호로 조회
			case 1 : sql = prop.getProperty("searchNoticeBno"); 
				break;
			//제목으로 조회
			case 2 : sql = prop.getProperty("searchNoticeTitle");
				break;
		}
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			if(num == 1) {
				pstmt.setString(1, search);
			}else {
				pstmt.setString(1, search);
				pstmt.setString(2, search);
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("MEMBER_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")
								  ,rset.getInt("BOARD_COUNT")
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

	//1:1문의 키워드 검색 리스트
	public ArrayList<Board> searchInquireAdmin(Connection conn, int num, String search) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		switch(num) {
			case 1 : sql = prop.getProperty("searchInquireBno");
				break;
			case 2 : sql = prop.getProperty("searchInquirePno");
				break;
			case 3 : sql = prop.getProperty("searchInquireTitle");
				break;
			case 4 : sql = prop.getProperty("searchInquireWriter");
				break;
			case 5 : sql = prop.getProperty("searchInquireDate");
				break;
		}
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			if(num == 3) {
				pstmt.setString(1, search);
				pstmt.setString(2, search);
			}else {
				pstmt.setString(1, search);
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("MEMBER_ID")
								  ,rset.getString("PRODUCT_NO")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")
								  ,rset.getString("BOARD_ANSWERED")
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

	//FAQ 키워드 검색 리스트
	public ArrayList<Board> searchFaqAdmin(Connection conn, int num, String search) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchFaqAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_CONTENT")));
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
