<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
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
         /*--------------쇼핑정보 주문목록 / 배송조회 영역-----------------*/
        #shopping_info{
            margin: 50px 30px 0px 30px;
            box-sizing: border-box;
        }
        #non_shopping_detail{
            margin: 10px 0px 0px 0px;
            height: 300px;
            border: 1px solid black;
            box-sizing: border-box;
            display: flex;
        }
        #sh_detail{
            text-align: center;
            margin: auto;
        }
        #sh_detail i{
            font-size: 25px;
        }
        #sh_detail h4{
            font-size: 15px;
            margin: 10px 0px 0px 0px;
        }
        #shopping_info h2{
            margin: 0px 0px 10px 0px;
        }
       
        #order_history>#odh_table th,td{
            width: 20px;
            border-collapse: collapse;
        }
        #order_history>#odh_table {
            width: 100%;
            height: 100%;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            border-collapse: collapse;
        }
        #order_history>#odh_table th:first-child, table td:first-child {
            border-left: 0;
        }
        #order_history>#odh_table th:last-child, table td:last-child {
            border-right: 0;
        }
        #order_history h4{
            margin: 5px 0px 10px 0px;
            text-align: center;
        }
        #order_history p{
        	margin: 0;
            color: tomato;
            font-size: 40px;
        }

        #shopping_detail{
            margin: 20px 0px 0px 0px;
            border: 3px dashed lightblue;
            /*box-sizing: border-box;
            border-radius: 10px;*/
        }
        #order_detail{
            margin: 0px 30px 0px 0px;
            padding: 10px 0px;
            text-align: center;
            margin: auto;
            display: flex;
        }
        #order_detail>#od_table {
            margin: auto;
            width: 95%;
            border-collapse: collapse;
        }
        #order_detail>#od_table th, td {
            border: 1px solid black;
            padding: 5px 0;
        }
        #order_detail>#od_table th:first-child{
            border-left: none;
        }
        #order_detail>#od_table th:last-child{
            border-right: none;
        }
		
        /*----------------------------------------Modal----------------------------------------*/
        .modal{ 
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background-color:rgba(0,0,0,.5);
            display:none;
            justify-content:center;
            align-items:center;
        }
        .modal-back{
            background-color: rgba(0,0,0,0.6);
            border-radius: 10px;
            position: absolute;
        }
        .modal-content{
            background-color: white;
            padding: 30px;
            position: relative;
            border-radius: 10px;
            width: 800px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        
        .modal-content table{
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            border: 1px solid black;
        }
        .modal-content th,td {
            border: 1px solid black;
            padding: 5px ;
        }
        .modal-content th{
            text-align: center;
        }
        .modal-body img{
            height: 100px;
            margin: 0%;
        }
        .modal-body{
            text-align: left;
        }
        #bookDetail {
            text-align: center;
        }
        #bookDetail td{
            width: 50px;
        }
        .modal-footer {
            text-align: right;
            margin-top: 20px;
        }
        .closeModal {
            height: 40px;
            width: 60px;
            border-radius: 10px;
            border: none;
            background-color: rgb(255, 50, 50);
            color: white;
            font-weight: bolder;
            font-size: 15px;
            cursor: pointer;
            }
        .openModal .closeModal{
            cursor: pointer;
        }
        #refund-btn{
        	display: none;
        	float: left;
            height: 40px;
            border-radius: 10px;
            border: 2px solid rgb(62, 130, 255);
            background-color: white;
            font-size: 15px;
        }
        #refund-btn:hover {
        	border: none;
        	background-color: rgb(62, 130, 255);
        	color: white;
            font-weight: bolder;
            font-size: 15px;
        }
        
</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	<%@ include file = "../common/myInfo.jsp" %>
	<%
		int state1 = 0;
		int state2 = 0;
		int state3 = 0;
		int state4 = 0;
		int state5 = 0;
		
		for(int i=0; i<plist.size(); i++){
			switch(plist.get(i).getState().charAt(0)){
				case '1' : state1 = state1 + 1; break;
				case '2' : state2 = state2 + 1; break;
				case '3' : state3 = state3 + 1; break;
				case '4' : state4 = state4 + 1; break;
				case '5' : state5 = state5 + 1; break;
			}
		}
	%>
	<div class="wrap">
		<div id="content">
            <div id="c_1">
                <div id="shopping_info">
                    <h2>전체</h2>

                    <div id="order_history">
                        <table id="odh_table">
                        	<tr>
	                            <th colspan="2"><p><%=state1 %></p></th>
	                            <th colspan="2"><p><%=state2 %></p></th>
	                            <th colspan="2"><p><%=state3 %></p></th>
	                            <th colspan="2"><p><%=state4 %></p></th>
	                            <th colspan="2"><p><%=state5 %></p></th>
                            </tr>
                            <tr>
                                <td colspan="2"><h4>준비중</h4></td>
                                <td colspan="2"><h4>배송중</h4></td>
                                <td colspan="2"><h4>배송완료</h4></td>
                                <td colspan="2"><h4>교환</h4></td>
                                <td colspan="2"><h4>취소</h4></td>
                            </tr>
                        </table>
                    </div>
                    
                    <%if(plist.isEmpty()) {%>
						<div id="non_shopping_detail">
	                        <div id="sh_detail">
	                            <i class="fa-solid fa-circle-exclamation"></i>
	                            <h4>해당 기간 내에 주문한 상품이 없습니다.</h4>
	                        </div>
	                    </div>
                    <%}else{ %>
                    
                   		<div id="shopping_detail">
                        <div id="order_detail">
                            <table class="order_area" id="od_table">
	                            <thead>
	                            	<tr>
	                                	<th colspan="3">주문번호</th>
	                                	<th colspan="2">주문상품</th>
		                                <th colspan="2">주문자명</th>
		                                <th colspan="2">결제방식</th>
		                                <th colspan="3">결제금액</th>
		                                <th colspan="2">조회</th>
	                                </tr>
                                </thead>
                    			<tbody>
                   			<%for(Payment p : plist) {%>
	                                <tr>
	                                    <td colspan="3"><%=p.getOrderNo() %></td>
	                                    <td colspan="2"><%=p.getProductNo() %></td>
	                                    <td colspan="2"><%=p.getDepositName() %></td>
	                                    <td colspan="3"><%=p.getPayment()+p.getDeliveryCost() %></td>
	                                    <%if(p.getBankName() != null) {%>
	                                    	<td colspan="2">무통장</td>
	                                    <%}else { %>
	                                    	<td colspan="2">카드</td>
	                                    <%} %>
	                                    <td colspan="2">
	                                    	<button type="button" class="openModal" data-toggle="modal" data-target="#myOrderModal">조회</button>
	                                    </td>
	                                </tr>
                            <%} %>
                                </tbody>
                            </table>
                      <%} %> 
                                              
                        
	                <div class="modal" id="myOrderModal">
	                    <div class="modal-back">
	                        <div class="modal-content">
	            
	                            
	                            <!-- modal body -->
	                           <div class="modal-body">
	                                <h2 class="modal-title">주문 상세 조회</h2>
	                                
	                                <h4>기본정보</h4>
	                                <input type="hidden" name="hideOno"> 
		                                <table id="basicInfo">
		                                    <tbody>
		                                    	
		                                    </tbody>
		                                </table>
		            
		                                <h4>주문 도서 정보</h4>
		                                <table id="bookDetail">
		                                    <thead>
		                                        <tr>
		                                            <th style="width:100px">상품명</th>
		                                            <th>구매수량</th>
		                                            <th>가격</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                    
		                                    </tbody>
		                                </table>
		                             
		                            <div class="modal-footer">
		                            	<button type="submit" id="refund-btn" data-dismiss="modal">환불하기</button>
		                                <button type="button" class="closeModal" data-dismiss="modal">닫기</button>
		                            </div>
	                            </div>
	                            
	                        </div>
	                    </div>
	                </div>
                  </div>
                </div>
             </div>
         </div>
		</div>
	</div>
	<script>
		 $(function(){
	            $(".openModal").on("click",function(){
	                $(".modal").css("display","flex");
	                $(".openModal").css("cursor","pointer");
	            });
	            $(".closeModal").on("click",function(){
	                $(".modal").css("display","none");
	                $(".closeModal").css("cursor","pointer");
	            });
	            $(".openModal").on("click",function(){
	            	var ono = $(this).parents("tr").children().eq(0).text();
	            	$.ajax({
	        			
	        			url : "shoppingList.me",
	        			type : "post",
	        			data : {
	        				orderNo : ono 
	        				},
	        			async: false,
	        			success : function(p){
	        				switch(p.state){
	        				case "1" : p.state = "준비중"; $("#refund-btn").css("display", "block"); break;
	        				case "2" : p.state = "배송중"; $("#refund-btn").css("display", "none"); break;
	        				case "3" : p.state = "배송완료"; $("#refund-btn").css("display", "none"); break;
	        				case "4" : p.state = "교환";  $("#refund-btn").css("display", "none"); break;
	        				case "5" : p.state = "취소"; $("#refund-btn").css("display", "none"); break;
	        				}
	        				
	        				var basicStr = "<tr>"
	                            +"<td>"+"주문번호"+"</td>"
	                            +"<td>"+p.orderNo+"</td>"
	                            +"<td>"+"주문자명"+"</td>"
	                            +"<td>"+p.memberNo+"</td>"
	                        +"</tr>"
	                        +"<tr>"
	                            +"<td>"+"결제번호"+"</td>"
	                            +"<td>"+p.paymentNumber+"</td>"
	                            +"<td>"+"결제일시"+"</td>"
	                            +"<td>"+p.createdAt+"</td>"
	                        +"</tr>"
	                        +"<tr>"
	                        	+"<td>"+"배송비"+"</td>"
	                            +"<td>"+p.deliveryCost+"</td>"
	                            +"<td>"+"배송상태"+"</td>"
	                            +"<td>"+p.state+"</td>"
	                        +"</tr>"
	                        +"<tr>"
	                        	+"<td>"+"결제금액"+"</td>"
	                            +"<td>"+(p.deliveryCost+p.payment)+"</td>"
	                            +"<td>"+"결제자명"+"</td>"
	                           	+"<td>"+p.depositName+"</td>"
	                      		+"</tr>"
	                        +"<tr>"
	                            +"<td>"+"우편번호"+"</td>"
	                            +"<td>"+p.post+"</td>"
	                            +"<td>"+"도로명"+"</td>"
	                            +"<td>"+p.roadAddress+"</td>"
	                        +"</tr>"
	                        +"<tr>"
	                           	+"<td>"+"상세주소"+"</td>"
	                            +"<td colspan=3>"+p.detailAddress+"</td>"
	                       	+"</tr>";
	               			
	               			var bookStr = "<tr>"
	                            +"<td>"+p.productNo+"</td>"
	                            +"<td>"+p.usePoint+" 권"+"</td>"
	                            +"<td>"+p.payment+" 원"+"</td>"
	                        "</tr>";
	                        
	                        $('input[name=hideOno]').attr('value',p.orderNo);
	              			$("#basicInfo tbody").html(basicStr);
	                       	$("#bookDetail tbody").html(bookStr);
	                       	console.log(p);
	                       return p;
	        			},
	        			error : function(){
	        				console.log("error");
	        				console.log(p);
	        			}
	        		});
	            });
	            $("#refund-btn").on("click",function(){
	            	
	            	var myOno =  $('input[name=hideOno]').val();
	            	
	            	$.ajax({
	        			
	        			url : "myPayList.me",
	        			type : "post",
	        			data : {
	        				hideOno : myOno 
	        				},
	        			success : function(data){
	        				
	        				if(data > 0){
	        					alert("환불 신청이 완료되었습니다.");
	        					window.location.href = "<%=contextPath%>/myPage.me";
	        				}else{
	        					alert("환불 신청을 실패했습니다.");
	        				}
	        				
	        			},
	        			error : function(){
	        				console.log("error");
	        			}
	        		});
	            	
	            	$(".modal").css("display","none");
	            });
	      });
	</script>
	<%@ include file = "../common/myPageCate.jsp" %>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>