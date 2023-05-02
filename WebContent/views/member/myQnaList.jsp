<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.board.model.vo.Board"%>
<%
	ArrayList<Board> blist = (ArrayList<Board>)session.getAttribute("blist");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/7f4a340891.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
    /*---------------------------------------------------------*/
    #my_qna{
        margin: 50px 0px 0px 30px;
        box-sizing: border-box;
        text-align: center;
    }
    #write-btn{
        float: right;
        margin-bottom: 10px;
        width: 150px;
        height: 40px;
        border: 3px solid rgb(255, 174, 0);
        border-radius: 10px;
        background-color: white;
        font-size: 15px;
    }
    #write-btn:hover{
        border: none;
        border-radius: 10px;
        background-color: rgb(255, 174, 0);
        color: white;
        font-weight: bold;
    }
    #my-qna-area {
        margin-right: 30px;
        width: 100%;
    }
    #my-qna-area table{
        width: 100%;
        border-collapse: collapse;
    }
    #my-qna-area th{
        padding: 10px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
    }
	#my-qna-area td{
		height: auto;
		overflow: hidden;
        padding: 10px;
        border-bottom: 1px solid black;
    }
	.arrowBtn {
		font-size: 20px;
		padding: 5px;
		border: 2px solid white;
		border-radius: 5px;
		font-weight: bold;
	}
	.arrowBtn:hover {
		padding: 5px;
		border: 2px solid rgb(62, 130, 255);
		border-radius: 5px;
		color: rgb(62, 130, 255);
	}
    .plusIcon .minusIcon{
        font-size: 30px;
    }
    #boardContent {
    	margin: 20px 0;
    	border: 3px solid lightblue;
    	border-radius: 10px;
    }
    #boardContent p{
    	margin: 30px 0;
    }
    #boardAnswer {
    	margin: 20px 0;
    	border: 3px solid lightpink;
    	border-radius: 10px;
    }
    #boardAnswer p{
    	margin: 30px 0;
    }
    #chkContent {
    	margin: 20px 0;
    	border: 3px solid #FFC93C;
    	border-radius: 10px;
    }
    #chkContent p{
    	margin: 30px 0;
    }
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<%@ include file = "../common/myInfo.jsp" %>
	<% String memName = loginUser.getMemberName(); %>
	
	<div class="wrap">
		<div id="content">
            <div id="c_1">
            	<div id="my_qna">
                    <h1>1 : 1 문의 내역</h1>
                    
                    <div id="my-qna-area">
                        <table id="my_table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>문의날짜</th>
                                    <th>제목</th>
                                    <th>답변여부</th>
                                    <th>상세보기</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%if(blist.isEmpty()) {%>
                        		<tr>
                        			<td>
	                        			<div id="sh_detail">
				                            <i class="fa-solid fa-circle-exclamation"></i>
				                            <h4>문의 내역이 없습니다.</h4>
				                        </div>
			                        </td>
                        		</tr>
                        <%}else{ %>
                            <%for(Board b : blist) {%>
                                <tr class="show_tr">
                                    <td><%=b.getBoardNo() %></td>
                                    <td><%=b.getCreateDate() %></td>
                                    <td><%=b.getBoardTitle() %></td>
                                <%if(b.getBoardAnswered() == null) {%>
                                	<td>N</td>
                                <%}else {%>
                                	<td>Y</td>
                                <%} %>
                                    <td>
                                        <i class="fa-solid fa-angles-down arrowBtn"></i>
                                        <i class="fa-solid fa-angles-up arrowBtn" style="display: none;"></i>
                                    </td>
                                </tr>
                                <tr style="display: none" class="my_row">
                                    <td colspan="5">
                                    	<div id="boardContent">
	                                    	<p>
	                                    		<b><%=memName %></b> 님의 문의 내용입니다. <br><br>
	                                    		<%=b.getBoardContent() %>
	                                    	</p>
                                    	</div>
                             		<%if(b.getBoardAnswered() != null) {%>
                             			<div id="boardAnswer">
	                                    	<p>
	                                    		<b><%=memName %></b> 님 문의에 대한 답변입니다. <br><br>
	                                    		<%=b.getBoardAnswered() %>
	                                    	</p>                                
                             			</div>
                                	<%}else {%>
                                		<div id="chkContent">
	                                		<p>
	                                			안녕하세요, <b><%=memName %></b> 님. <br><br>
	                                			문의 내역을 검토하는 중입니다. <br>
	                                			답변은 문의 내용에 따라 1주일~2주일 정도 소요될 예정입니다.
	                                		</p>
                                		</div>
                                	<%} %>
                                    </td>
                                </tr>
                            <%} %>
                        <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<script>
        $(function(){
            $(".arrowBtn").on("click",function(){
           	    console.log($("tr.my_row"));
           		
            	if($(this).hasClass("fa-angles-down")){
            		$(this).css("display","none");
            		$(this).next().css("display","block");
            		$(this).parents("tr").next().show();
            	}else{
            		$(this).css("display","none");
            		$(this).prev().css("display","block");
            		$(this).parents("tr").next().hide();
            	}
            	
            });
        });
    </script>
    
	<%@ include file = "../common/myPageCate.jsp" %>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>