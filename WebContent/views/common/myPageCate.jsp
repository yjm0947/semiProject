<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%
	String contextPath1 = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginUser");
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
        /*--------------마이페이지 사용자 프로필 영역-----------------*/
        #c_2{
            width: 20%;
            height: auto;
            text-align: center;
            padding: 10px 0px;
            border-right: 1px solid lightgray;
        }
        #pro_icon i{
        	border: 5px solid black;
        	border-radius: 50%;
        	padding: 20px 30px;
        	margin: 10px 0;
            font-size: 80px;
            text-align:center;
            color: black;
        }
        #userName{
            margin: 10px 0px 20px 0px;
        }

        /*--------------마이페이지 사용자 카테고리 영역-----------------*/
        #c_3{
            width: 20%;
            height: auto;
            border-top: 1px solid lightgray;
            padding: 10px 0px;
            border-right: 1px solid lightgray;
        }
        #my_nav {
            list-style: none;
        }
        #my_nav>ul{
            list-style: none;
            padding: 0%;
            margin-bottom: 15%;
        }
        #my_nav>ul li{
            padding-bottom: 5px;
        }
        #my_nav>ul a{
            text-decoration: none;
            color: black;
        }
        #my_nav a:hover{
            font-weight: bold;
            text-decoration: underline;
		}
</style>
</head>
<body>
	<%
		String memberRole = "";
		memberRole = String.valueOf(loginMember.getMemberRole());
		
		switch(memberRole){
		case "1" : memberRole = "베이직"; break;
		case "2" : memberRole = "실버"; break;
		case "3" : memberRole = "골드"; break;
		case "4" : memberRole = "VIP"; break;
		}
	%>
	<div class="wrap">
		<div id="content">
			<div id="c_2"> <!--마이페이지 메인-->
	                <h2>마이페이지</h2>
	                <div id="pro_icon">
	                    <i class="fa-solid fa-user" id="proIcon"></i>
	                </div>
	                <h3 id="userName"><%=loginMember.getMemberName() %></h3>
	            </div>
	
	            <div id="c_3">
	                <ul id="my_nav">
	                    <li>
	                        <li><h3>쇼핑정보</h3></li>
	                        <ul>
	                            <li><a href="<%=contextPath1%>/shoppingList.me">주문목록 / 배송조회</a></li>
                            	<li><a href="<%=contextPath1%>/cancelList.me">취소 / 교환 내역</a></li>
	                            <li><a href="<%=contextPath1%>/myPayList.me">환불 / 결제 내역</a></li>
	                            <li><a href="<%=contextPath1%>/myReviewList.me">나의 쇼핑 후기</a></li>
	                        </ul>
	                    </li>
	                    <li>
	                        <li><h3>혜택관리</h3></li>
	                        <ul>
	                            <li><a href="<%=contextPath1%>/myCouponList.me">나의 쿠폰</a></li>
	                            <li><a href="<%=contextPath1%>/myPointList.me">나의 적립금</a></li>
	                        </ul>
	                   </li>
	                   <li>
	                        <li><h3>회원정보</h3></li>
	                        <ul>
	                            <li><a href="<%=contextPath1%>/chkPwd.me">회원 정보 수정</a></li>
	                        </ul>
	                   </li>
	                   <li>
	                       <li><h3>고객센터</h3></li>
	                        <ul>
	                            <li><a href="<%=contextPath1%>/myQna.me">나의 문의 내역</a></li>
	                            <li><a href="<%=contextPath1 %>/mafaq.c">FAQ</a></li>
	                            <li><a href="<%=contextPath1 %>/noti.ma?currentPage=1">공지사항</a></li>
	                        </ul>
	                   </li>
	                </ul>
	            </div>
		</div>
	</div>
	
	<script>
		const icon = document.getElementById('proIcon');
		const memberRole = "<%=memberRole%>";
		
		switch(memberRole){
			case '베이직' : icon.style.color = "#74C01B"; icon.style.border = "5px solid #74C01B"; break;
			case "실버" : icon.style.color = "#01A5DB"; icon.style.border = "5px solid #01A5DB"; break;
			case "골드" : icon.style.color = "#DBB201"; icon.style.border = "5px solid #DBB201"; break;
			case "VIP" : icon.style.color = "#DB471F"; icon.style.border = "5px solid #DB471F"; break;
		}
	</script>
</body>
</html>