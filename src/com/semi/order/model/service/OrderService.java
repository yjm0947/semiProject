package com.semi.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.common.JDBCTemplate;
import com.semi.order.model.dao.OrderDao;
import com.semi.order.model.vo.Order;
import com.semi.order.model.vo.Payment;

public class OrderService {

	//장바구니에 체크된 목록 주문 db에 넣는 메소드
	public void insertChecked(int productNo, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new OrderDao().insertChecked(conn,productNo,userNo);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	}

	//주문 상품 리스트 메소드
	public ArrayList<Order> selectList(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Order> list = new OrderDao().selectList(conn,userNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//결제정보 입력 메소드
	public int orderPayment(Payment p) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().orderPayment(conn,p);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//주문목록 삭제 메소드
	public void deleteOrder(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().deleteOrder(conn,userNo);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	}

	//장바구니에있는 목록 주문목록에 한번에 넣는 메소드
	public void orderAllInsert(int cartId, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new OrderDao().orderAllInsert(conn,cartId,userNo);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	}

	//바로구매 누를때 주문에 넣는 메소드
	public void directInsert(int productNo, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new OrderDao().directInsert(conn,productNo,userNo);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	}

	//주문관리 리스트(관리자)
	public ArrayList<Payment> selectOrderAdmin() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Payment> list = new OrderDao().selectOrderAdmin(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//주문관리 상세조회 (관리자)
	public Payment detailOrderAdmin(int Ono) {
		
		Connection conn = JDBCTemplate.getConnection();
			
		Payment pay = new OrderDao().detailOrderAdmin(conn,Ono);
		
		JDBCTemplate.close(conn);
		
		return pay;
	}

	//주문번호로 회원조회(관리자) - 적립금
	public int chkMemberNoAdmin(int orderNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int memberNo = new OrderDao().chkMemberNoAdmin(conn,orderNo);
		
		JDBCTemplate.close(conn);
		
		return memberNo;
	}

	//결제상태 변경(관리자) - 'Y'
	public int chkPayUpdateAdmin(int orderNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().chkPayUpdateAdmin(conn,orderNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//결제상태 변경(관리자) - 'S'
	public int chkPayUpdate2Admin(int orderNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().chkPayUpdate2Admin(conn,orderNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
}	//주문 완료시 주문목록 상태 변경
	public void completeOrder(String userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new OrderDao().completeOrder(conn,userNo);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
	}
	
	//주문완료 페이지 메소드
	public String paymentSelect(int orderNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		String p = new OrderDao().paymentSelect(conn,orderNo);
		
		JDBCTemplate.close(conn);
		
		return p;
	}

	//카드결제정보 입력 메소드
	public int orderCard(Payment p) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().orderCard(conn,p);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//사용한 포인트 차감 메소드
	public void usePoint(String userNo, int usePoint) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().usePoint(conn,userNo,usePoint);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	}

	//사용한 쿠폰 상태 변경 메소드
	public void useCoupon(String userNo, int useCoupon) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().useCoupon(conn,userNo,useCoupon);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	}

	//주문내역 키워드 검색 - 관리자
	public ArrayList<Payment> searchOrderAdmin(int num, String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Payment> list = new OrderDao().searchOrderAdmin(conn,num,search);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

}
