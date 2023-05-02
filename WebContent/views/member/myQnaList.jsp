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
    	overflow: scroll;
    	-ms-overflow-style: none;
       	scrollbar-width: none;
    	height: 800px;
        margin-right: 30px;
        width: 100%;
    }
    #my-qna-area::-webkit-scrollbar {
    	display: none;
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
    i {
    	font-size:25px;
    	color: rgb(62, 130, 255);
    }
    i:hover {
    	color: #FFC93C;
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
        .modal-title{
        	text-align: center;
        }
        .modal-content{
            background-color: white;
            padding: 30px;
            position: relative;
            border-radius: 10px;
            width: 700px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        .modal-body{
            text-align: left;
        }
        .modal-footer {
            text-align: center;
            margin-top: 20px;
        }
        .modal-footer button{
            margin-left: 5px;
            margin-right: 5px;
        }
        .openModal{
            cursor: pointer;
        }
        .closeModal {
            width: 100px;
            height: 40px;
            border-radius: 10px;
            border: 2px solid rgb(255, 50, 50);
            background-color: white;
            color: rgb(255, 50, 50);
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }
        .closeModal:hover {
            border: none;
            background-color: rgb(255, 50, 50);
            color: white;
            font-weight: bolder;
        }
        
        #qna-enroll-btn{
        	width: 100px;
            height: 40px;
            border-radius: 10px;
            border: 2px solid rgb(62, 130, 255);
            background-color: white;
            color: rgb(62, 130, 255);
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }
        #qna-enroll-btn:hover {
        	border: none;
        	background-color: rgb(62, 130, 255);
        	color: white;
            font-weight: bolder;
            font-size: 15px;
        }
        
        #my-qna-table {
        	border-top: 1px solid lightgray;
        	border-bottom: 1px solid lightgray;
        	border-collapse:collapse;
        	width: 100%;
        	height: 300px;
        }
        #my-qna-table td{
        	border: 1px solid lightgray;
        	text-align: center;
        }
        #my-qna-table td:nth-child(1){
        	width: 100px;
        	font-weight: 600;
        	border-left: none;
        }
        #my-qna-table td:nth-child(2){
        	padding: 10px;
        	border-right: none;
        }
        #my-qna-table input {
        	border: 1px solid lightgray;
        	width: 500px;
        	height: 30px;
        	font-size: 15px;
        }
        
        #qnaContent{
        	border: 1px solid lightgray;
        	outline: none;
        	width: 500px;
        	height: 300px;
        	resize: none;
        	font-size: 20px;
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
                    
                    <button type="button" class="openModal" id="write-btn" data-toggle="modal" data-target="myQnaModal">1:1 문의하기</button>
                    
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
                                    	<i class="fa-regular fa-square-plus checkBtn"></i>
                                    	<i class="fa-regular fa-square-minus checkBtn" style="display: none;"></i>
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
	
	<div class="modal" id="myQnaModal">
        <div class="modal-back">
            <div class="modal-content">

                <!-- modal body -->
               <div class="modal-body">
                    <h2 class="modal-title">1 : 1 문의 등록</h2>
                    
                     <table id="my-qna-table">
                         	<tr>
                         		<td>제목</td>
                         		<td><input type="text" id="qnaTitle" name="qnaTitle" required="required"></td>
                         	</tr>
                         	<tr>
                         		<td rowspan="3">내용</td>
                         		<td rowspan="3" colspan="3" ><textarea id="qnaContent" name="qnaContent" required="required"></textarea></td>                         		
                         	</tr>
                     </table>
 
                </div>
                 <div class="modal-footer">
                 	<button type="submit" id="qna-enroll-btn">등록하기</button>
                    <button type="button" class="closeModal" data-dismiss="modal">닫기</button>
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
	            
	            $("#qna-enroll-btn").on("click",function(){
	            	
	            	var memNo =  "<%=loginUser.getMemberNo()%>";
	            	
	            	$.ajax({
	        			
	        			url : "enrollQna.me",
	        			type : "post",
	        			data : {
	        				memNo : memNo,
	        				title : $('input[name=qnaTitle]').val(),
	        				content : $('textarea[name=qnaContent]').val()
        				},
	        			success : function(result){
	        				if(result>0){
	        					alert("1:1 문의가 등록되었습니다.");
	        					location.reload();
	        				}else{
	        					alert("1:1 문의 등록을 실패했습니다.");
	        					history.back();
	        				}
	        			},
	        			error : function(){
	        				console.log("error");
	        			}
	        		});
	            	
	            });
	      });
	</script>
	
	<script>
        $(function(){
            $(".checkBtn").on("click",function(){
           		
            	if($(this).hasClass("fa-square-plus")){
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