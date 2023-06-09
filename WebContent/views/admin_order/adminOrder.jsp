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
				<form action="<%=contextPath%>/searchOrder.admin" method="get" onsubmit="return blankSearch()">
				<select name="ms_select" id="ms_select">
					<option value="1">주문번호</option>
					<option value="2">주문자명</option>
					<option value="3">주소</option>
					<option value="4">결제일시</option>
				</select>
				<input type="search" name="memberSearch" id="memberSearch">
				<button type="submit" id="ms_img"></button>
			</form>
			</div>
			
			<script>
				function blankSearch(){
					if($("#memberSearch").val().length == 0){
						alert("다시 입력해 주시길 바랍니다.")
						return false;
					}
				}
			</script>
			
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
									case 'N' : chk = "입금확인 요청";
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
									<button onclick="location.href='<%=contextPath%>/chkPay.admin?orderNo=<%=pay.getOrderNo()%>&payment=<%=pay.getPayment()%>'" id="chkPay" style="color: rgb(41, 128, 185);"><%=chk%></button>
								<%}else if(ss == 'Y') {%>
									<button id="chkPay" style="background-color: transparent;"><%=chk%></button>
								<%}else if(ss == 'R') {%>
									<button onclick="location.href='<%=contextPath%>/refundPay.admin?orderNo=<%=pay.getOrderNo()%>&payment=<%=pay.getPayment()%>'" id="chkPay" style="color: rgb(41, 128, 185);"><%=chk%></button>
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
						&lt;주문 번호&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;주문자명&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;상품명&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;받는사람&gt;
						<div>
						
						</div>
					</div>
					
					<div>
						&lt;받는주소&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;요청사항&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;전화번호&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;이메일&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;은행명&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;입금자명&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;사용한 포인트&gt;
						<div>
							
						</div>
					</div>
					
					
					<div>
						&lt;배송비&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;결제금액&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;결제일시&gt;
						<div>
							
						</div>
					</div>
					
					<div>
						&lt;입금확인&gt;
						<div>
							
						</div>
					</div>
					
				</div>

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