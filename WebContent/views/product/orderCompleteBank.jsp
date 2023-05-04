<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String p = (String)request.getAttribute("payment");
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
        

        /*==================================================================================*/
        #content_1{
            /* background-color: antiquewhite; */
            width: 1000px;
            height: 600px;
            margin: auto;
            position: relative;
        }
        #context_text{
            /* background-color: aqua; */
            width: 600px;
            height: 420px;
            position: absolute;
            top: 50%;
            margin-top: -21%;
            margin-left: 19%;
            border: 1px solid rgb(201, 201, 201);
            border-radius: 5px;
        } 
        #con_header{
            background-color: rgb(240, 240, 240);
            width: 100%;
            height: 85px;
            position: absolute;
            top: 5%;
            color: rgb(68, 68, 68);
            font-size: 35px;
            font-weight: 600;
            line-height: 2.3;
        }
        #con_info{
            border: 1px solid rgb(177, 177, 177);
            height: 270px;
            width: 80%;
            position: absolute;
            margin-top: 20%;
            margin-left: 9.5%;
            text-align: center;
            border-radius: 5px;
            font-size: 24px;
            color: rgb(78, 78, 78);
        }
        #con_info_1{
            width: 100%;
            height: 60px;
            line-height: 60px;
        }
        #con_info_2{
            width: 90%;
            height: 60px;
            margin: auto;
            font-weight: 600;
            line-height: 60px;
            background-color: rgb(236, 236, 236);
        }
        #con_info_2>div{
            float: left;
            height: 100%;
        }
        #con_info_3{
            width: 100%;
            height: 118px;
        }
        #info_3_1>div{
            float: left;
            height: 33px;
            /* position: absolute; */
            /* margin-left: 500px; */
        }
        #info_3_1{
            position: relative;
            top: -30px;
        }
        #con_info_4{
            width: 100%;
            height: 60px;
            font-size: 13px;
            position: relative;
            top: -30px;
        }
        /* 홈버튼 */
        .home_btn{
            display: inline-block;
            font-size: 21px;
            line-height: 50px;
            width: 200px;
            height: 50px;
            background-color: #365fdd;
            color: #fff;
            font-weight: bold;
            text-decoration: none;
            position: relative;
            top: -80px;
            border: 2px solid white;
        }
        .home_btn:hover{
            cursor: pointer;
        }
</style>
</head>
<body>
<%@include file = "../common/header.jsp" %>
  
    <div id="content">
        <div id="content_1">
            <div id="context_text">
                <div id="con_header">&nbsp;주문 완료</div>
                <div id="con_info">
                    <div id="con_info_1">파란 서점을 이용해 주셔서 감사합니다.</div>
                    <div id="con_info_2">
                        <div style="width: 130px; text-align: right;">고객님,&nbsp;</div>
                        <div style="width: 134px; color: blue;">주문이 완료</div>
                        <div style="width: 130px; text-align: left;">되었습니다.</div>
                    </div>
                    <div id="con_info_3">
                        <div style="line-height: 90px;">고객님이 주문하신 주문번호는</div>
                        <div id="info_3_1">
                            <div style="width: 280px; text-align: right; color: blue; font-weight: 600;"><%=p %></div>
                            <div style="width: 180px; text-align: left;">입니다</div>
                        </div>
                    </div>
                    <div id="con_info_4"><br>입금계좌 : 기업은행 281-016680-01-021 파랑서점<br>
                    *주문내역 확인은 마이페이지의 "주문조회"에서 하실 수 있습니다.</div>
                </div>
            </div>
        </div>
		<div style="text-align: center;">
            <button class="home_btn">홈으로</button>
        </div>
		
    </div>

<script type="text/javascript">
	$(function() {
		$(".home_btn").click(function () {
			location.replace("<%=request.getContextPath()%>");
		});
	});
</script>

<%@include file = "../common/footer.jsp" %>
</body>
</html>