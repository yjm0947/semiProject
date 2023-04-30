<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.order.model.vo.Payment"%>
<%
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
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
							<th>결제상태</th>
						</tr>
					</thead>
					<tbody>
						<%for(Payment pay : list) {%>
							<tr>
								<td><%=pay.getOrderNo()%></td>
								<td><%=pay.getMemberNo()%></td>
								<td><%=pay.getAddressName() %></td>
								<td><%=pay.getRoadAddress() +" "+ pay.getDetailAddress()%></td>
								
								<%if(pay.getOrderRequest() == null){ %>
									<td></td>
								<%}else {%>
									<td><%=pay.getOrderRequest()%></td>
								<%} %>
								
								<td><%=pay.getCreatedAt()%></td>
								<td><%=pay.getPayment()%>원</td>
								<td id="chkTd">
								<%
									String s = pay.getCheckPay();
									char ss = s.charAt(0);
									String chk = "";
									switch(ss){
									case 'N' : chk = "입금완료";
										break;
									case 'Y' : chk = "입금확인 완료";
										break;
									case 'R' : chk = "환불신청";
										break;
									case 'S' : chk = "환불승인 완료";
										break;
									}
								%>
								
								<%if(ss == 'N') {%>
									<button onclick="location.href='<%=contextPath%>/chkPay.admin?orderNo=<%=pay.getOrderNo()%>&payment=<%=pay.getPayment()%>'" id="chkPay" style="color:red;"><%=chk%></button>
								<%}else if(ss == 'Y') {%>
									<button id="chkPay" style="background-color: transparent;"><%=chk%></button>
								<%}else if(ss == 'R') {%>
									<button onclick="location.href='<%=contextPath%>/refundPay.admin?orderNo=<%=pay.getOrderNo()%>&payment=<%=pay.getPayment()%>'" id="chkPay" style="color:red;"><%=chk%></button>
								<%}else {%>
									<button id="chkPay" style="background-color: transparent;"><%=chk%></button>
								<%} %>
								
								</td>
								
							</tr>
						<%} %>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="bottom">
			<%@include file="/views/common/footer.jsp"%>
		</div>
		
		<!-- ========================= 모달 영역 ========================= -->
		
		<div class="modal">
			<div class="modal_content">
				
				<div class="modal_img">
					주문내역 상세조회
				</div>
				
				<div id="modal_member">
					주문내역
				</div>

				<div class="modal_body">

					<div>
						주문 번호
						<div>
							
						</div>
					</div>
					
					<div>
						주문자명
						<div>
							
						</div>
					</div>
					
					<div>
						상품명
						<div>
							
						</div>
					</div>
					
					<div>
						받는사람
						<div>
						
						</div>
					</div>
					
					<div>
						받는주소
						<div>
							
						</div>
					</div>
					
					<div>
						요청사항
						<div>
							
						</div>
					</div>
					
					<div>
						전화번호
						<div>
							
						</div>
					</div>
					
					<div>
						이메일
						<div>
							
						</div>
					</div>
					
					<div>
						은행명
						<div>
							
						</div>
					</div>
					
					<div>
						입금자명
						<div>
							
						</div>
					</div>
					
					<div>
						사용한 포인트
						<div>
							
						</div>
					</div>
					
					
					<div>
						배송비
						<div>
							
						</div>
					</div>
					
					<div>
						결제금액
						<div>
							
						</div>
					</div>
					
					<div>
						결제일시
						<div>
							
						</div>
					</div>
					
					<div>
						입금확인
						<div>
							
						</div>
					</div>
					
				</div>
				<form action="<%=contextPath%>/noticeUpdate.admin" method="get">
				<input type="hidden" name="boardNo" id="boardNo" value="">
					<div class="modal_footer">
						<button type="submit">공지 수정</button>
						<button type="button" onclick="deleteNotice()">공지 삭제</button>
					</div>
				</form>
			</div>
		</div>
		
		<script>
			$(function(){
				$(".list-area>tbody>tr").click(function(){
					var Ono = $(this).children().eq(0).text();
				
					$(".modal").fadeIn();
					
					$.ajax({
						
						url : "OrderDetail.admin?Ono="+Ono,
						
						success : function(result){
							$(".modal_body").children().children().eq(0).text(result.orderNo);
							$(".modal_body").children().children().eq(1).text(result.memberNo);
							$(".modal_body").children().children().eq(2).text(result.productNo);
							$(".modal_body").children().children().eq(3).text(result.addressName);
							$(".modal_body").children().children().eq(4).text(result.roadAddress + " " + result.detailAddress);
							
							if(result.orderRequest == null){
								$(".modal_body").children().children().eq(5).text("없음");
							}else{
								$(".modal_body").children().children().eq(5).text(result.orderRequest);
							}
							
							$(".modal_body").children().children().eq(6).text(result.phone);
							$(".modal_body").children().children().eq(7).text(result.email);
							$(".modal_body").children().children().eq(8).text(result.bankName);
							$(".modal_body").children().children().eq(9).text(result.depositName);
							$(".modal_body").children().children().eq(10).text(result.usePoint);
							$(".modal_body").children().children().eq(11).text(result.deliveryCost+"원");
							$(".modal_body").children().children().eq(12).text(result.payment+"원");
							$(".modal_body").children().children().eq(13).text(result.createdAt);
							$(".modal_body").children().children().eq(14).text(result.checkPay);
						},
						
						error : function(){
							console.log("주문내역 상세조회 실패");
						}
					});
				});
				
					$(".modal_content,.modal").click(function(){
						$(".modal").fadeOut();
					});
					
			});
		</script>
		
</div>
</body>
</html>