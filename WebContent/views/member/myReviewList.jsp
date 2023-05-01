<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.semi.board.review.model.vo.Review"%>
<%
	ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
%>
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
/*--------------마이페이지 리뷰 상세 조회 영역-----------------*/
        #my_review{
            margin: 50px 0px 0px 30px;
            box-sizing: border-box;
        }
        #my_review h2{
            margin: 0px 0px 10px 0px;
        }

        #my_review div{
            margin: 0px 30px 0px 0px;
            padding: 10px;
        }

        #my_review table {
            border-collapse: collapse;
            border-left: 0;
            border-right: 0;
            width: 100%;
            margin: auto;
            line-height: 2;
        }
        #my_review table th, table td {
            text-align: center;
            border: 1px solid gray;
        }
        #my_review table th:first-child, table td:first-child {
            border-left: 0;
        }
        #my_review table th:last-child, table td:last-child {
            border-right: 0;
        }
        #my_review td{
            cursor: pointer;
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
        .modal-title{
        	text-align: center;
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
        .modal-body{
            text-align: left;
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
        }
            
        .openModal .closeModal{
            cursor: pointer;
        }
        #detailModal tr:nth-child(1) td:nth-child(1),
        #detailModal tr:nth-child(2) td:nth-child(1),
        #detailModal tr:nth-child(3) td:nth-child(1){
			background-color: #D9D9D9;
		}
		#detailModal tr:nth-child(1) td:nth-child(3),
		#detailModal tr:nth-child(2) td:nth-child(3) {
			background-color: #D9D9D9;
		}
		#detailModal tr:nth-child(1) td,
		#detailModal tr:nth-child(2) td{
			width: 150px;
		}
		#detailModal tr:nth-child(3) td:nth-child(2){
			text-align: left;
			padding: 10px 20px;
		}
		.modal-btn-area{
        	width: 100%;
        	text-align: center;
        	margin: 20px 0px;
        }
        .modal-btn-area button{
        	width: 80px;
        	margin: 5px;
        	cursor: pointer;
        }
		#delete-btn{
            height: 40px;
            border-radius: 10px;
            border: 2px solid rgb(62, 130, 255);
            background-color: white;
            font-size: 15px;
        }
        #delete-btn:hover {
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
	
	<div class="wrap">
		<div id="content">
            <div id="c_1">
			
			<div id="my_review">
                <h2>나의 쇼핑 후기</h2>
                
                <!-- 조회 내용 없을 때 -->
           <%if(rlist.isEmpty()) {%>
                <div id="non_review">
                    <div id="non_detail">
                        <table border="1">
	                    	<thead>
		                    	<tr>
			                        <th>No.</th>
			                        <th colspan="2">작성일</th>
			                        <th colspan="3">구매상품</th>
			                        <th>별점</th>
			                        <th>보기</th>                    		                    	
		                    	</tr>
	                    	</thead>
	                    	<tbody>
	                    		<tr>
	                    			<td colspan="8">
	                    				<div id="non-text">
		                                    <i class="fa-solid fa-circle-exclamation"></i>
		                                    <h4>작성한 리뷰가 없습니다.</h4>
	                                	</div>
                    				</td>
	                    		</tr>
	                    	</tbody>
	                    	
                    	</table>
	                    	
                    </div>
                </div>
           <%}else {%>
				<!-- 조회 내용 있을 때 -->
                <div>
                    <table border="1">
                    	<thead>
	                    	<tr>
		                        <th>No.</th>
		                        <th colspan="2">작성일</th>
		                        <th colspan="3">구매상품</th>
		                        <th>별점</th>
		                        <th>보기</th>                    		                    	
	                    	</tr>
                    	</thead>
                    	<tbody>
                    	<%for(Review r : rlist) {%>
	                        <tr>
	                            <td><%=r.getReviewNo() %></td>
	                            <td colspan="2"><%=r.getCreateDate() %></td>
	                            <td colspan="3"><%=r.getProductNo() %></td>
	                            <td><%=r.getReviewStar() %> 점</td>
	                            <td>
	                            	<button type="button" class="openModal" data-toggle="modal" data-target="#myReviewModal">보기</button>
	                            </td>
	                        </tr>
                        <%} %>                 	
                    	</tbody>
                    </table>
                </div>
           <%} %>
            </div>
			</div>
        </div>
	</div>
	
	<div class="modal" id="myReviewModal">
	    <div class="modal-back">
	        <div class="modal-content">
	            
	            <!-- modal body -->
	           <div class="modal-body">
				<h2 class="modal-title">댓글 상세 조회</h2>
	                <table id="detailModal">
	                    <tbody>
	                    	
	                    </tbody>
	                </table>
	
		            <div class="modal-btn-area">
		            	<button type="submit" class="delete" id="delete-btn" data-dismiss="modal">삭제하기</button>
		                <button type="button" class="closeModal" data-dismiss="modal">닫기</button>
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
	            
	            var result;
	            
	            $(".openModal").on("click",function(){
	            	var rno = $(this).parents("tr").children().eq(0).text();
	            	
	            	$.ajax({
	        			
	        			url : "myReviewList.me",
	        			type : "post",
	        			data : {
	        				reviewNo : rno 
	        				},
	        			async: false,
	        			success : function(r){
	        				result = r.reviewNo;
	        				var detailReview = "<tr>"
	                            +"<td>"+"댓글 번호"+"</td>"
	                            +"<td>"+result+"</td>"
	                            +"<td>"+"댓글 작성일"+"</td>"
	                            +"<td>"+r.createDate+"</td>"
	                        +"</tr>"
	                        +"<tr>"
	                            +"<td>"+"별점"+"</td>"
	                            +"<td>"+r.reviewStar+" 점"+"</td>"
	                            +"<td>"+"작성자"+"</td>"
	                            +"<td>"+"<%=loginUser.getMemberName() %>"+"</td>"
	                        +"</tr>"
	                        +"<tr>"
	                        	+"<td>"+"댓글 내용"+"</td>"
	                            +"<td colspan='3'>"+r.reviewContent+"</td>"
	                        +"</tr>"
	                            
	                       $("#detailModal tbody").html(detailReview);
	                       console.log(r);
	                       return r;
	        			},
	        			error : function(){
	        				console.log(";-;");
	        			}
	        		});
	            });
	            
	            $(".delete").on("click",function(){
		            
					 var reviewNo = result;
					
					$.ajax({
	        			url : "deleteRe.me",
	        			type : "post",
	        			data : {
	        				rno : reviewNo
	       				},
	        			success : function(result){
	        				if(result>0){
	        					alert("댓글을 삭제했습니다.")
	        					history.back();
	        				}else{
	        					alert("댓글 삭제를 실패했습니다.")
	        					history.back();
	        				}
	                       console.log(result);
	        			},
	        			error : function(){
	        				console.log(";-;");
	        			}
	        		});
				});
	      });
	</script>
	
	<%@ include file = "../common/myPageCate.jsp" %>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>