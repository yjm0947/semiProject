<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.order.model.vo.Order"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_main.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_order.css">
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/order.admin'">주문 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<select name="ms_select" id="ms_select">
					<option value="">주문번호</option>
					<option value="">주문자명</option>
					<option value="">배송상태</option>
				</select>
				<input type="search" name="memberSearch" id="memberSearch">
					<button id="ms_img"></button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
					<%if(list.isEmpty()){%>
						<tr>
							<th style="font-size: 18px;">
								현재 주문한 내역이 없습니다.
							</th>
						</tr>
					<%}else {%>
						<tr id="ml_tr">
							<th>주문 번호</th>
							<th>주문자명</th>
							<th>받는사람</th>
							<th>받는주소</th>
							<th>요청사항</th>
							<th>결제일시</th>
							<th>결제금액</th>
							<th>배송상태</th>
						</tr>
					</thead>
					<tbody>
						<%for(Order or : list) {%>
							<tr>
							<%--
								<td><%=or.getOrderNo()%></td>zzzzzzzzzzzzzzzzzz
								<td><%=or.getMemberNo()%></td>
								<td><%=or.getAddressName()%></td>
								<td><%=or.getRoadAddress()%>+" "+<%=or.getDetailAddress%></td>
								<td><%=or.getOrderRequest%></td>
								<td><%=or.getCreatedAt%></td>
								<td><%=or.getPayment%></td>
								<td><%=or.getState%></td>
							--%>
							</tr>
						<%} %>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>

		<script>
			$(function(){
				$(".list-area>tbody>tr").click(function(){
					var Ono = $(this).children().eq(0).text();
					location.href='<%=contextPath%>/OrderDetail.admin?Ono='+Ono;
				});
			});
		</script>
		
		<div class="bottom">
			<%@include file="/views/common/footer.jsp"%>
		</div>
</div>
</body>
</html>