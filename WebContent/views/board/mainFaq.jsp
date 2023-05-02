<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.board.inquiry.model.vo.Board"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("Board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<style>
		div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
       
        /*===============================================================================*/
        /*높이 자동*/
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
       
        /*===============================================================================*/
        /*높이 자동*/
        #content{
            width: 1180px;
            /*background-color: rgb(240, 240, 240);*/
            height: 800px;
            margin: auto;
            /* justify-content: center; */
            position: relative;
            cursor : default;
        }
        /*높이 자동*/
        #re_con{
            width: 1050px;
            height: 660px;
            background-color: white;
            border : 1px solid black;
            border-color : rgb(172, 172, 172);
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
        #real_con{
            width: 950px;
            /* height: 500px; */
            position: absolute;
            top: 6%;
            left: 50%;
            margin-left: -45%;
            /* background-color: aqua; */
            /* border: 1px solid red; */
        }
        #re_co_text{
            width: 100%;
            height: 50px;
            /* background-color: aqua; */
            border-bottom-style: solid;
            border-bottom-color: rgb(219, 218, 218);
            border-bottom-width: 2px;
        }
        #re_co_text>*{
            float: left;
        }
        #re_co_text_img{
            height: 90%;
            width: 6%;
            /* background-color: blue; */
        }
        #re_co_text_1{
            height: 100%;
            width: 94%;
            /* background-color: blueviolet; */
            font-weight: 550;
            font-size: 30px;
            
        }
        #re_co_2{
            height: 40px;
            width: 100%;
            /* background-color: blue; */
        }
        #re_co_table{
            /* background-color: aqua; */
            width: 100%;
        }

       #re_text{
        font-weight: 600;
        font-size: 17px;
        border-bottom-style: solid;
        border-bottom-color: rgb(219, 218, 218);
        border-bottom-width: 1px;
        border-top-style: solid;
        border-top-color: rgb(219, 218, 218);
        border-top-width: 1px;
        height: 50px;
        line-height: 45px;
        cursor : pointer;
       }
       p{
        background-color: rgb(235, 235, 235);
        border-radius: 8px;
        margin: 10px;
        padding: 15px;
        display: none; /*처음에는 안보여지도록*/
        box-sizing: border-box;
       }
	</style>

</head>
<body>
	<%@include file = "../common/header.jsp" %>

	<div id="content">
        <div id="re_con">
            <div id="real_con">
                <div id="re_co_text">
                    <div id="re_co_text_img">
                        <img src="<%=contextPath %>/resources/faq0429.png" style="height: 100%; width: 100%;" alt="">
                    </div>
                    <div id="re_co_text_1">&nbsp;&nbsp;자주하는 질문 BEST5</div>
                </div>
                <div id="re_co_2"></div>
                <div id="re_co_table">
                <%for(Board b : list ) {%>
                    <div id="re_text">Q. <%=b.getBoardTitle() %></div>
                    <p><%=b.getBoardContent() %></p>
                <%} %>
                </div>
                
            </div>
        </div>
    </div>

    <script>

        $(function(){
            $("#re_co_table>div").click(function(){

                //해당 뒤에있는 요소가르킴.. 변수명에도 제이쿼리라고 표시해서 알려줌
                var $p = $(this).next();

                if($p.css("display")=="none"){
                	$(this).siblings("p").slideUp(1000);
                    $p.slideDown(1000);
                    //$(this).siblings("p").slideUp(1000); 열려있는 시간.. 호버로 하고싶은데..?
                }else{
                    $p.slideUp(1000);
                }
            });
        });

    </script>
    
	<%@include file = "../common/footer.jsp" %>
</body>
</html>