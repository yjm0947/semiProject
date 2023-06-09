<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/7f4a340891.js" crossorigin="anonymous"></script>
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
        
        /*--------------마이페이지 쿠폰 상세 조회 영역-----------------*/
        #c_info{
            margin: 20px 0px 0px 30px;
            box-sizing: border-box;
        }
        h2{
            margin: 50px 0px 0px 30px;
        }
        #available_cont::-webkit-scrollbar {
		    display: none;
		}
        #c_info section{
        	overflow: scroll;
        	-ms-overflow-style: none;
        	scrollbar-width: none;
        	height: 350px;
            display: none;
            margin: 0px 30px 0px 0px;
            padding: 20px 0 0;
            border-top: 1px solid #b6b6b6;
        }

        #c_info table {
            border-collapse: collapse;
            border-left: 0;
            border-right: 0;
            width: 95%;
            margin: auto;
            line-height: 2;
        }
        #c_info table th, table td {
            text-align: center;
            border: 1px solid gray;
        }
        #c_info table th:first-child, table td:first-child {
            border-left: 0;
        }
        #c_info table th:last-child, table td:last-child {
            border-right: 0;
        }
        

        #c_info input{
            display: none;
        }
        #c_info label{
            display: inline-block;
            margin: 0 0 -1px;
            padding: 15px 25px;
            font-weight: bold;
            text-align: center;
            color: #b6b6b6;
            border: 1px solid transparent;
        }
        #c_info label:hover{
            color: rgb(34, 93, 255);
            cursor: pointer;
        }
        
        #c_info input:checked + label{
            color: #555;
            border: 1px solid #b6b6b6;
            border-left: 5px solid lightblue;
            border-bottom: 1px solid #ffffff;
        }
        #available:checked ~ #available_cont,
        #unavailable:checked ~ #unavailable_cont {
            display: block;
        }

        /*--------------마이페이지 적립금 상세 조회 영역-----------------*/
        #p_info{
            margin: 20px 0px 0px 30px;
            box-sizing: border-box;
        }
		#point_section::-webkit-scrollbar,
		#unavailable_cont::-webkit-scrollbar {
		    display: none;
		}
        #p_info section{
        	overflow: scroll;
        	-ms-overflow-style: none;
        	scrollbar-width: none;
        	height: 350px;
            margin: 0px 30px 0px 0px;
            padding: 10px;
        }

        #p_info table {
            border-collapse: collapse;
            border-left: 0;
            border-right: 0;
            width: 100%;
            margin: auto;
            line-height: 2;
        }
        #p_info table th, table td {
            text-align: center;
            border: 1px solid gray;
        }
        #p_info table th:first-child, table td:first-child {
            border-left: 0;
        }
        #p_info table th:last-child, table td:last-child {
            border-right: 0;
        }
		
		#non-text{
			margin: 20px;
		}
		#non-text i{
			margin:10px;
			font-size: 25px;
		}
		#non-text h4{
			margin:10px;
			font-size: 20px;
		}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<%@ include file = "../common/myInfo.jsp" %>
	<%
		int memberNo = loginUser.getMemberNo();
		int memPoint = loginUser.getMemberPoint();
		
		int resultY = 0;
		
		for(int i=0; i<cplist.size(); i++){
			if(cplist.get(i).getStatus().charAt(0) == 'Y') {
				resultY += 1;		
			}
		}
		
		int resultN= 0;
		
		for(int i=0; i<cplist.size(); i++){
			if(cplist.get(i).getStatus().charAt(0) == 'N') {
				resultN += 1;		
			}
		}
	%>
	<div class="wrap">
		<div id="content">
	            <div id="c_1">
                    <h2>My 쿠폰</h2>
	                <div id="c_info">
	                    <input type="radio" id="available" name="tab" checked>
	                    <label for="available">사용가능</label>
	
	                    <input type="radio" id="unavailable" name="tab">
	                    <label for="unavailable">사용불가능</label>
	                    
		                <section id="available_cont">
		                        <table border="1">
		                        	<tr>
			                            <th colspan="3">쿠폰명</th>
			                            <th colspan="3">혜택</th>
			                            <th colspan="3">유효기간</th>
		                            </tr>
                            	<%if(resultN < 1) {%>
		                            <tr>
		                                <td colspan="9">
		                                	<div id="non-text">
			                                    <i class="fa-solid fa-circle-exclamation"></i>
			                                    <h4>사용 가능한 쿠폰이 없습니다.</h4>
		                                	</div>
		                                </td>
	                            	</tr>
	                           	<%}else {%>
			                   		<%for(Coupon c : cplist){  %>	
			                   		 	<%if(c.getStatus().charAt(0)=='N') {%>			
				                            <tr>
				                                <td colspan="3"><%=c.getCouponName() %></td>
				                                <td colspan="3"><%=c.getCouponDc() %>%</td>
				                                <td colspan="3"><%=c.getCouponSdate() %> ~ <%=c.getCouponPeriod() %></td>
				                            </tr>
			                            <%}%>
	                            	<%} %>
                            	<%} %>
		                        </table>
		                    </section>
	                    <section id="unavailable_cont">
	                        <table border="1">
	                            <tr>
	                                <th colspan="3">쿠폰명</th>
	                                <th colspan="3">혜택</th>
	                                <th colspan="3">유효기간</th>
	                            </tr>
                           <%if(resultY < 1) {%>
	                            <tr>
	                                <td colspan="9">
	                                    <div id="non-text">
		                                    <i class="fa-solid fa-circle-exclamation"></i>
		                                    <h4>사용 만료된 쿠폰이 없습니다.</h4>
	                                	</div>
	                                </td>
	                           	</tr>
                          	<%}else {%>
	                             <%for(Coupon c : cplist){  %>	
		                   		 	<%if(c.getStatus().charAt(0)=='Y') {%>			
		                            <tr>
		                                <td colspan="3"><%=c.getCouponName() %></td>
		                                <td colspan="3"><%=c.getCouponDc() %></td>
		                                <td colspan="3"><%=c.getCouponSdate() %> ~ <%=c.getCouponPeriod() %></td>
		                            </tr>
		                            <%} %>
	                    		<%}%>
	                   		<%} %>
	                        </table>
	                    </section>
	                </div>
	                
                    <h2>My 적립금</h2>
	                <div id="p_info">
	
	                    <section id="point_section">
	                        <table border="1">
	                        	<tr>
	                        		<th colspan="2">결제일</th>
		                            <th colspan="2">적립금 사용내역</th>
		                            <th colspan="2">총 적립금</th>
	                        	</tr>
                       	<%for(int i=0; i<plist.size(); i++){ %>
	                            <tr>
	                            	<td colspan="2"><%=plist.get(i).getCreatedAt() %></td>
	                                <td colspan="2"><%=-plist.get(i).getUsePoint() %> <b>P</b></td>
	                                <td colspan="2"><%=memPoint-=plist.get(i).getUsePoint() %> <b>P</b></td>
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