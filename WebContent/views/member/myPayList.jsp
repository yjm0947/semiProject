<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	ArrayList<Payment> payList = (ArrayList<Payment>)request.getAttribute("payList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
        .wrap{
            
            width: 1400px;
            margin: auto;
        }
		#content{
            width: 100%;
            margin-top: 20px;
        }
		
		/*--------------취소교환반품 쿠폰 상세 조회 영역-----------------*/
        #refund_info{
            margin: 50px 0px 0px 30px;
            box-sizing: border-box;
        }
        #refund_info h2{
            margin: 0px 0px 10px 0px;
        }
        #refund_info section{
            display: none;
            margin: 0px 30px 0px 0px;
            padding: 20px 0 0;
            border-top: 1px solid #b6b6b6;
        }

        #refund_info table {
            border-collapse: collapse;
            border-left: 0;
            border-right: 0;
            width: 95%;
            margin: auto;
            line-height: 2;
        }
        #refund_info table th, table td {
            text-align: center;
            border: 1px solid gray;
        }
        #refund_info table th:first-child, table td:first-child {
            border-left: 0;
        }
        #refund_info table th:last-child, table td:last-child {
            border-right: 0;
        }
        
        #refund_info input{
            display: none;
        }
        #refund_info label{
            display: inline-block;
            margin: 0 0 -1px;
            padding: 15px 25px;
            font-weight: bold;
            text-align: center;
            color: #b6b6b6;
            border: 1px solid transparent;
        }
        #refund_info label:hover{
            color: rgb(34, 93, 255);
            cursor: pointer;
        }
        
        #refund_info input:checked + label{
            color: #555;
            border: 1px solid #b6b6b6;
            border-left: 5px solid lightblue;
            border-bottom: 1px solid #ffffff;
        }
        #refund:checked ~ #refund_cont,
        #payback:checked ~ #payback_cont{
            display: block;
        }
		#refund_info i{
            font-size: 25px;
        }
        #refund_info h4{
            font-size: 15px;
            margin: 10px 0px 0px 0px;
        }
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<%@ include file = "../common/myInfo.jsp" %>
	<div class="wrap">
		<div id="content">
	            <div id="c_1">
	                <div id="refund_info">
	                    <h2>환불 / 결제 상세 조회</h2>
	                    <input type="radio" id="refund" name="tab" checked>
	                    <label for="refund">환불 내역</label>
	
	                    <input type="radio" id="payback" name="tab">
	                    <label for="payback">결제 내역</label>
	
	                    <section id="refund_cont">
	                        <table border="1">
	                            <!--조회결과 없을 때-->
	                            <tr>
	                                <th>주문번호</th>
	                                <th>주문일</th>
	                                <th>상품명</th>
	                                <th>상품수량</th>
	                                <th>상품금액</th>
	                                <th>진행상태</th>
	                            </tr>
						<%for(int i=0; i<payList.size(); i++) {%>
							<%if(payList.get(i).getCheckPay() == "N" || payList.get(i).getCheckPay() == "Y") {%>
	                            <tr>
	                                <td colspan="12" style="height: 200px;">
	                                    <i class="fa-solid fa-circle-exclamation"></i>
	                                    <h4>환불 신청한 상품이 없습니다.</h4>
	                                </td>
	                            </tr>
							<%}%>
						<%} %>
						
						
						<%for(Payment p : payList) {%>
							<%if(p.getCheckPay().charAt(0)=='R' || p.getCheckPay().charAt(0)=='R') {%>
	                            <!--조회결과 있을 때-->
	                            <tr>
	                                <td><%=p.getOrderNo() %></td>
	                                <td><%=p.getCreatedAt() %></td>
	                                <td><%=p.getProductNo() %></td>
	                                <td><%=p.getQuantity() %></td>
	                                <td><%=p.getDeliveryCost() + p.getPayment() %></td>
	                                <td>
	                                	<%
	                                		String progress = "";
	                                	
	                                		switch(p.getCheckPay().charAt(0)){
	                                		case 'R' : progress = "환불중"; break;
	                                		case 'S' : progress = "환불완료"; break;
	                                		}
	                                	%>
	                                	<%=progress %>
	                                </td>
	                            </tr>
	                    	<%} %>
						<%} %>
					
	                        </table>
	                    </section>
	
	                    <section id="payback_cont">
	                        <table border="1">
	                            <!--조회결과 없을 때-->
	                            <tr>
	                                <th>주문번호</th>
	                                <th>주문일</th>
	                                <th>상품명</th>
	                                <th>상품수량</th>
	                                <th>상품금액</th>
	                                <th>진행상태</th>
	                            </tr>
							<%if(payList.isEmpty()) {%>
	                            <tr>
	                                <td colspan="12" style="height: 200px;">
	                                    <i class="fa-solid fa-circle-exclamation"></i>
	                                    <h4>입금 관련 내역이 없습니다.</h4>
	                                </td>
	                            </tr>
							<%}%>
	                            
	                            <!-- 조회 결과 있을 때 -->
							<%for(Payment p : payList) {%>
	                            <!--조회결과 있을 때-->
	                            <tr>
	                                <td><%=p.getOrderNo() %></td>
	                                <td><%=p.getCreatedAt() %></td>
	                                <td><%=p.getProductNo() %></td>
	                                <td><%=p.getQuantity() %></td>
	                                <td><%=p.getDeliveryCost() + p.getPayment() %></td>
	                                <td>
	                                	<%
	                                		String progress = "";
	                                	
	                                		switch(p.getCheckPay().charAt(0)){
	                                		case 'N' : progress = "미결제"; break;
	                                		case 'Y' : progress = "결제완료"; break;
	                                		case 'R' : progress = "환불중"; break;
	                                		case 'S' : progress = "환불완료"; break;
	                                		}
	                                	%>
	                                	<%=progress %>
	                                </td>
	                            </tr>
							<%} %>
	                        </table>
	                    </section>
	                    
	                </div>
	            </div>
	        </div>
		</div>
	<%@ include file = "../common/myPageCate.jsp" %>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>