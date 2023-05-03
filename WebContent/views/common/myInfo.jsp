<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member,java.util.ArrayList,com.semi.member.model.vo.Coupon
    ,com.semi.order.model.vo.Payment"%>
<%
	String contextPath2 = request.getContextPath();
	Member loginMem = (Member)session.getAttribute("loginUser");
	ArrayList<Coupon> cplist = (ArrayList<Coupon>)session.getAttribute("cplist");
	ArrayList<Payment> plist = (ArrayList<Payment>)session.getAttribute("pList");
%>
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
            height: auto;
            margin: auto;
        }
		#content{
            height: auto;
            margin-top: 20px;
            position: 
        }
		#c_1{
            width: 80%;
            height:auto;
            display : inline-block;
            float: right;
        }
        #my_info{
            height: 200px;
            background-color: lightgrey;
            margin-top: 50px;
            margin: 50px 0px 0px 30px;
            display: flex;
        }
        #my_info p{
        	color:white;
            width: 100%;
            text-align: center;
            font-size: 15px;
            margin: auto;
            font-weight: bolder;
        }
        #my_benefit{
            width: 60%;
            height: 200px;
            border: 5px solid lightgrey;
            margin: 50px 30px 0px 0px;
            float: right;
            display : flex;
            justify-content: center;
            align-items : center;
        }
        
        #benefit_wrapper{
            width: 550px;
            margin: 0 auto;
        }
        #coupon{
            width: 20%;
            text-align: center;
            float: left;
            font-size: 50px;
            margin: 0px 70px;
        }
        #point {
            display: inline-block;
            width: 20%;
            text-align: center;
            font-size: 50px;
            margin: 0px 70px;
        }
        #coupon i, #point i{
            color: lightblue;
        }
        #coupon a, #point a{
            text-decoration: none;
            color: tomato;
        }
</style>
</head>
<body>
	<%
		String memberName = loginMem.getMemberName();
		String memRole = "";
		memRole = String.valueOf(loginMem.getMemberRole());
		int memberPoint = loginMem.getMemberPoint();
		
		switch(memRole){
		case "1" : memRole = "베이직"; break;
		case "2" : memRole = "실버"; break;
		case "3" : memRole = "골드"; break;
		case "4" : memRole = "VIP"; break;
		}
		
		int couponCount = 0;
		
		for(int i=0; i<cplist.size(); i++){
			if(cplist.get(i).getStatus().charAt(0) == 'Y') {
				couponCount += 1;		
			}
		}
		
		for(int i=0; i<plist.size(); i++){
			memberPoint -= plist.get(i).getUsePoint();
		}
	%>
	<div class="wrap">
		<div id="content">
	            <div id="c_1">
	                <div id="my_benefit">
	                    <div id="benefit_wrapper">
	                        <div id="coupon">
	                            <i class="fa-solid fa-ticket"></i> <br>
	                            <a href="<%=contextPath2 %>/myCouponList.me"><%=couponCount %></a>
	                        </div>
	                        <div id="point">
	                            <i class="fa-solid fa-coins"></i> <br>
	                            <a href="<%=contextPath2 %>/myPointList.me"><%=memberPoint %>P</a> 
	                        </div>
	                    </div>
	                </div>
	                <div id="my_info">
	                    <p>
	                        <b><%=memberName %></b> 님의 <br>
							회원등급은 <b><%=memRole %></b> 입니다.
	                    </p>
	                </div>
                </div>
			</div>
		</div>
			
		<script>
			const infoBox = document.getElementById('my_info');
			const infoBorder = document.getElementById('my_benefit');
			const memRole = "<%=memRole%>";
			
			switch(memRole){
			case '베이직' : infoBox.style.backgroundColor = "#74C01B"; infoBorder.style.border = "5px solid #74C01B"; break;
			case "실버" : infoBox.style.backgroundColor = "#01A5DB"; infoBorder.style.border = "5px solid #01A5DB"; break;
			case "골드" : infoBox.style.backgroundColor = "#DBB201"; infoBorder.style.border = "5px solid #DBB201"; break;
			case "VIP" : infoBox.style.backgroundColor = "#DB471F"; infoBorder.style.border = "5px solid #DB471F"; break;
			}
		</script>
</body>
</html>