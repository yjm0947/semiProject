package com.semi.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.common.JDBCTemplate;
import com.semi.order.model.vo.Order;
import com.semi.order.model.vo.Payment;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		
		String filePath = OrderDao.class.getResource("/sql/order/order-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//장바구니에 체크된 목록 주문 db에 넣는 메소드
	public int insertChecked(Connection conn, int productNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChecked");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
	
		return result;
	}

	//주문페이지 상품 리스트 메소드
	public ArrayList<Order> selectList(Connection conn, int userNo) {
		ArrayList<Order> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Order(rset.getInt("ORDER_NO")
								  ,rset.getInt("MEMBER_NO")
						  	  	  ,rset.getInt("PRODUCT_NO")
								  ,rset.getString("PRODUCT_NAME")
								  ,rset.getInt("PRICE")
								  ,rset.getInt("QUANTITY")
								  ,rset.getString("PRODUCT_PUBLISHER")
								  ,rset.getString("MEMBER_NAME")
								  ,rset.getString("PHONE")
								  ,rset.getString("EMAIL")
								  ,rset.getString("ADDRESS")
								  ,rset.getInt("MEMBER_POINT")
								  ,rset.getString("TITLE_IMG")));
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

	//결제정보 입력 메소드
	public int orderPayment(Connection conn, Payment p) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getOrderNo());
			pstmt.setString(2, p.getMemberNo());
			pstmt.setString(3, p.getProductNo());
			pstmt.setInt(4, p.getPayment());
			pstmt.setString(5, p.getOrderRequest());
			pstmt.setString(6, p.getBankName());
			pstmt.setString(7, p.getDepositName());
			pstmt.setInt(8, p.getUsePoint());
			pstmt.setString(9, p.getAddressName());
			pstmt.setString(10, p.getPhone());
			pstmt.setString(11, p.getEmail());
			pstmt.setString(12, p.getPost());
			pstmt.setString(13, p.getRoadAddress());
			pstmt.setString(14, p.getDetailAddress());
			pstmt.setInt(15, p.getDeliveryCost());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//주문목록 다 지우는 메소드
	public int deleteOrder(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteOrder");
		
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

	//장바구니에있는 목록 주문목록에 한번에 넣는 메소드
	public int orderAllInsert(Connection conn, int cartId, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderAllInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartId);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
	
		return result;
	}

	//바로구매 누를때 주문에 넣는 메소드
	public int directInsert(Connection conn, int productNo, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("directInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
	
		return result;
	}

	//주문관리 리스트(관리자)
	public ArrayList<Payment> selectOrderAdmin(Connection conn) {
		
		ArrayList<Payment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("ORDER_NO")
									,rset.getString("MEMBER_NAME")
									,rset.getDate("CREATED_AT")
									,rset.getInt("PAYMENT")
									,rset.getString("ORDER_REQUEST")
									,rset.getString("ADDRESS_NAME")
									,rset.getString("ROAD_ADDRESS")
									,rset.getString("DETAIL_ADDRESS")
									,rset.getString("CHECK_PAY")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	//주문관리 상세조회 (관리자)
	public Payment detailOrderAdmin(Connection conn, int Ono) {
		
		Payment pay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailOrderAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Ono);
			rset = pstmt.executeQuery();
					
			if(rset.next()) {
				pay = new Payment(rset.getInt("ORDER_NO")
							 	 ,rset.getString("MEMBER_NAME")
							 	 ,rset.getString("PRODUCT_NAME")
							 	 ,rset.getDate("CREATED_AT")
							 	 ,rset.getInt("PAYMENT")
							 	 ,rset.getString("ORDER_REQUEST")
							 	 ,rset.getString("BANK_NAME")
							 	 ,rset.getString("DEPOSIT_NAME")
							 	 ,rset.getInt("USE_POINT")
							 	 ,rset.getString("ADDRESS_NAME")
							 	 ,rset.getString("PHONE")
							 	 ,rset.getString("EMAIL")
							 	 ,rset.getString("ROAD_ADDRESS")
							 	 ,rset.getString("DETAIL_ADDRESS")
							 	 ,rset.getInt("DELIVERY_COST")
							 	 ,rset.getString("CHECK_PAY"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return pay;
	}

	//주문번호로 회원조회(관리자) - 적립금
	public int chkMemberNoAdmin(Connection conn, int orderNo) {
		int memberNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("chkMemberNoAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getInt("MEMBER_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return memberNo;
	}

	//결제상태 변경(관리자) - 'Y'
	public int chkPayUpdateAdmin(Connection conn, int orderNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("chkPayUpdateAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	//결제상태 변경(관리자) - 'S'
	public int chkPayUpdate2Admin(Connection conn, int orderNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("chkPayUpdate2Admin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
}
	//주문 완료시 주문목록 상태 변경
	public int completeOrder(Connection conn, String userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("completeOrder");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
		return result;
	}

	//주문완료 페이지 메소드
	public String paymentSelect(Connection conn, int orderNo) {
		String p = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("paymentSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = rset.getString("PAYMENT_NUMBER");
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

}
