package com.semi.event.point.model.service;

import java.sql.Connection;

import com.semi.common.JDBCTemplate;
import com.semi.event.point.model.dao.PointDao;

public class PointService {

	//적립금 올려주기
	public void upPoint(int memberNo, int addP) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new PointDao().upPoint(conn, memberNo, addP);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
	}

}
