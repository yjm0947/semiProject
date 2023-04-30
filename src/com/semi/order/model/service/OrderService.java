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

	//주문 완료시 주문목록 상태 변경
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

}
