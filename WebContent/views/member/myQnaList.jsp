<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
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
    /*---------------------------------------------------------*/
    #my_qna{
        margin: 50px 0px 0px 30px;
        box-sizing: border-box;
        text-align: center;
    }
    #write-btn{
        float: right;
        margin-right: 30px;
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
        margin: 0px 0px 0px 30px;
    }
    #my-qna-area th, td{
        padding: 8px;
    }
    #my-qna-area th:nth-child(2){
        width: 100px;
    }
    #my-qna-area th:nth-child(3){
        width: 300px;
    }
    #my-qna-area th:nth-child(4){
        width: 500px;
    }

    .plusIcon .minusIcon{
        font-size: 30px;
    }
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<%@ include file = "../common/myInfo.jsp" %>
	
	<div class="wrap">
		<div id="content">
            <div id="c_1">
            	<div id="my_qna">
                    <h1>1 : 1 문의 내역</h1>
                    
                    <button type="button" id="write-btn">1:1 문의하기</button>

                    <div id="my-qna-area">
                        <table>
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
                                <tr>
                                    <td>1</td>
                                    <td>2023/04/04</td>
                                    <td>재입고 언제 되나요?</td>
                                    <td>답변완료</td>
                                    <td>
                                        <i class="fa-solid fa-angles-down arrowBtn"></i>
                                        <i class="fa-solid fa-angles-up arrowBtn" style="display: none;"></i>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td colspan="5">
                                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaatest
                                    </td>
                                </tr>
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

                var show = $(this);

                if(show.hasClass("fa-angles-down")){
                    show.hide();
                    show.next().show();
                    show.parent().parent().next().show();
                }else{
                    show.hide();
                    show.prev().show();
                    show.parent().parent().next().hide();
                }
            });
            
        });
    </script>
	<%@ include file = "../common/myPageCate.jsp" %>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>