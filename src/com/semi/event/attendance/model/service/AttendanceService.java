package com.semi.event.attendance.model.service;

import java.sql.Connection;

import com.semi.common.JDBCTemplate;
import com.semi.event.attendance.model.dao.AttendanceDao;
import com.semi.event.point.model.service.PointService;

public class AttendanceService {
	
	//출첵 페이지 출력 도장 개수(출석일) 알아오기
	public int dayCount(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count =new AttendanceDao().dayCount(conn,memberNo);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	//출석체크일 업데이트
	public void upDate(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result =new AttendanceDao().upDate(conn,memberNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
	}

	public void resetCount(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result =new AttendanceDao().resetCount(conn,memberNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
	}
	
	//출석체크 날짜 체크 메소드
	public int attendanceOX(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AttendanceDao().attendanceOX(conn,userNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
