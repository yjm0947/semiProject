<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.board.inquiry.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("Board");
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
            cursor : default;
        }
       
        /*===============================================================================*/
        /*높이 자동*/
        #content{
            width: 1180px;
            background-color: rgb(240, 240, 240);
            height: 800px;
            margin: auto;
            /* justify-content: center; */
            position: relative;
        }
        /*높이 자동*/
        #re_con{
            width: 1050px;
            /* height: 660px; */
            height: 660px;
            background-color: white;
            margin: auto;
            position: absolute;
            top: 6%;
            /* bottom: 7%; */
            left: 50%;
            margin-left: -44%;
            /* margin-top: -10%; */
            /* vertical-align: auto; */
            
            /* margin: 100px 100px 100px 100px; */
            /* margin: 50px; */
        }
        /*높이 자동*/
        #real_title{
            width: 950px;
            height: 80px;
            position: absolute;
            top: 6%;
            left: 50%;
            margin-left: -45%;
            /* background-color: aqua; */
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: rgb(165, 165, 165);
            /* border: 1px solid red; */
        }
        #re_title_1{
            width: 100%;
            /* background-color: blue; */
            height: 50%;
            font-size: 27px;
            font-weight: 600;
        }
        #re_title_2{
            height: 50%;
            /* background-color: red; */
        }
        #re_title_2>div{
            float: left;
        }
        #re_ti_1{
            height: 100%;
            width: 88%;
            /* background-color: antiquewhite; */
            font-size: 17px;
            color: rgb(158, 158, 158);
            font-weight: 600;
        }
        #re_ti_2{
            height: 100%;
            width: 12%;
            font-size: 17px;
            color: rgb(85, 85, 85);
            font-weight: 600;
            /* background-color: rgb(48, 68, 68); */
        }

        #re_co_table{
            /* background-color: aqua; */
            height: 450px;
            width: 100%;
            position: relative;
            top: 107px;
        }
        #re_co_table_1{
            /* background-color: blue; */
            width: 800px;
            height: 380px;
            margin: auto;
            position: relative;
            top: 30px;
            font-size: 17px;
            font-weight: 400;
            color: rgb(97, 97, 97);
            text-align: center;
            /* top: ; */
        }
        #re_co_page{
            /* background-color: bisque; */
            height: 120px;
            width: 100%;
            position: relative;
            top: 105px;
        }
        #re_co_page_1{
            /* background-color: aqua; */
            height: 40px;
            width: 70px;
            margin: auto;
        }
        #re_co_page_1 button{
            background-color: rgb(255, 255, 255);
            font-size: 15px;
            height: 100%;
            width: 100%;
            border-radius: 8px;
            border: 1px solid rgb(131, 131, 131);
        }
		
		button{
		cursor : pointer;
		}

    </style>
</head>
<body>
	<%@include file = "../common/header.jsp" %>

	<div id="content">
	        <div id="re_con">
	            <div id="real_title">
	                <div id="re_title_1"><%=b.getBoardTitle() %></div>
	                <div id="re_title_2">
	                    <div id="re_ti_1"><%=b.getCreateDate() %></div>
	                    <div id="re_ti_2">조회수 : <%=b.getBoardCount() %></div>
	                </div>
	            </div>
	            <div id="re_co_table">
	                <div id="re_co_table_1">
						<div style="white-space: pre-wrap; word-wrap: break-word;">
<%=b.getBoardContent() %>
						</div>
	                </div>
	            </div>
	            <div id="re_co_page">
	                <div id="re_co_page_1">
	                    <button onclick="history.back()">목록</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	<%@include file = "../common/footer.jsp" %>
</body>
</html>