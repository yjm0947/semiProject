<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.board.inquiry.model.vo.Board,com.semi.common.vo.PageInfo"%>
<%	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
        /*===============================================================================*/
        /*높이 자동*/
        #content{
            width: 1180px;
            /*background-color: rgb(240, 240, 240);*/
            height: 720px;
            margin: auto;
            /* justify-content: center; */
            position: relative;
        }
        /*높이 자동*/
        #re_con{
            width: 1050px;
            height: 600px;
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
            width: 5%;
            /* background-color: blue; */
        }
        #re_co_text_1{
            height: 100%;
            width: 95%;
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
        #re_co_table table{
            width: 100%;
            text-align: center;
            border-top-style: solid;
            border-top-width: 1.5px;
            border-top-color: rgb(65, 65, 65);
        }
        #re_co_table table td,#re_co_table table th{
            height: 35px;
            border-bottom-style: solid;
            border-bottom-width: 1.5px;
            border-bottom-color: rgb(192, 192, 192);
        }
        #re_co_page{
            width: 1050px;
            /* background-color: brown; */
            height: 80px;
            position: relative;
            left: -50px;
        }
        #re_page_btn{
            text-align: center;
            margin: auto;
            /* background-color: antiquewhite; */
            height: 10px;
            width: 100%;
            position: relative;
            top: 28px;
        }
        #re_page_btn button{
            display: inline-block;
            margin: 1px;
            background-color: white;
            border: 1px solid rgb(175, 175, 175);
            border-radius: 5px;
            font-size: 16px;
        }
        
        #re_co_table>table>tbody>#num, button{
        	cursor : pointer;
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
                        <img src="<%=contextPath %>/resources/notice0429.png" style="height: 100%; width: 100%;" alt="">
                    </div>
                    <div id="re_co_text_1" style="cursor:default;">공지사항</div>
                </div>
                <div id="re_co_2"></div>
                <div id="re_co_table">
                    <table>
                        <tr style="background-color: rgb(241, 241, 241); cursor:default;">
                            <th style="width: 10%; ">-</th>
                            <th style="width: 75%;">제목</th>
                            <th style="width: 15%;">작성일자</th>
                        </tr>
                        <%if(list.isEmpty()) {%>
                        <tr>
                        	<td colspan="3" style="color: reb(124,124,124)">공지사항이 없습니다.</td>
                        </tr>
                        <%}else {%>
                        <%for(Board b : list) {%>
                        <tr id="num">
                            <td>[공지]</td>
                            <td><%=b.getBoardTitle() %></td>
                            <td><%=b.getCreateDate() %></td>
                            <input type="hidden" value="<%=b.getBoardNo()%>">
                        </tr>
                        <%} %>
                        <%} %>
                    </table>
                </div>
                <div id="re_co_page">
                    <div id="re_page_btn">
                        <!-- 왼쪽 가기 버튼 -->
		                <%if(pi.getCurrentPage()!=1) {%>
		                	<button type="button" onclick="location.href='<%=contextPath %>/noti.ma?currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
		                <%} %>
		                
		                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
		                	<%if(i!=pi.getCurrentPage()) {%>
		                		<button type="button" onclick="location.href='<%=contextPath%>/noti.ma?currentPage=<%=i%>';"><%=i %></button>
		                	<%}else {%>
		                		<button type="button" disabled><%=i %></button>
		                	<%} %>
		                <%} %>
		                <!-- 오른쪽으로 가는 버튼 -->
		                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
		                	<button type="button" onclick="location.href='<%=contextPath%>/noti.ma?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
		                <%} %>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<script >
		$("#re_co_table>table>tbody>#num").click(function(){
			//console.log(this);

			//보드 넘버 잡기
			var bno = $(this).children("input[type=hidden]").val();
			//console.log(bno)
			
			location.href="<%=contextPath%>/mano.de?bno="+bno;
		});
	</script>
	
	<%@include file = "../common/footer.jsp" %>
</body>
</html>