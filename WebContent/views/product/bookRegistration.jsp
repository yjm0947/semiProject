<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <!-- jQuery library -->
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_insertItems.css">
</head>
<body>
	<div class="wrap">
		<%@include file="/views/common/admin_Category.jsp" %>
		<%-- <%@include file="/views/common/admin_Category.jsp" %> --%>
        <div id="content">
            <div id="con_1">도서등록</div>
            <div id="con_2">
                <a href="<%=contextPath%>/book.regi" id="con_2_book">도서 등록</a>
                <a href="<%=contextPath %>/item.regi" id="con_2_pro">상품 등록</a>
            </div>
            <div id="con_3">
                <form action="<%=contextPath %>/book.regi" method="post" enctype="multipart/form-data">
                    <div class="inputArea"> 
                        <label>분류</label>
                        <select id="category1" name="category">
                         <option name="category" value="1">소설</option>
                         <option name="category" value="2">에세이</option>
                         <option name="category" value="3">자기계발</option>
                         <option name="category" value="4">경제/경영</option>
                         <option name="category" value="5">인문학</option>
                         <option name="category" value="6">정치/사회</option>
                        </select>
                    </div>
                    <div class="inputArea">
                        <label for="pro_Name" id="pro_Name1">상품명</label>
                        <input type="text" id="pro_Name2" name="pro_Name" />
                    </div>
                    <div class="inputArea">
                        <label for="pro_Publisher" id="pro_Publisher1">출판사</label>
                        <input type="text" id="pro_Publisher2" name="pro_Publisher"/>
                    </div>
                    <div class="inputArea">
                        <label for="pro_author" id="pro_author1">저자</label>
                        <input type="text" id="pro_author2" name="pro_author"/>
                    </div>
                       
                    <div class="inputArea">
                        <label for="pro_Price" id="pro_Price1">상품가격(원)</label>
                        <input type="number" id="pro_Price2" name="pro_Price" />
                    </div>
                    <div class="inputArea">
                        <label for="pro_sales" id="pro_sales1">할인률(%)</label>
                        <input type="number" id="pro_sales2" name="pro_sales" value="0" />
                    </div>
                    <div class="inputArea">
                        <label for="pro_Stock" id="pro_Stock1">상품수량</label>
                        <input type="number" id="pro_Stock2" name="pro_Stock" />
                    </div>
                    <div class="inputArea">
                        <label for="pro_Des" id="pro_Des1">상품소개</label>
                        <textarea id="pro_Des2" name="pro_Des" style="resize: none;"></textarea>
                    </div>
                    <div class="inputArea">
                        <label for="pro_thumb"  id="thum1">대표이미지</label>
                        <img width="250" height="170" id="thum2" name="pro_thumb">
                    </div>
					 <div class="inputArea">
                        <label id="img">상세이미지</label>
					    <img id="contentImg1" width="150" height="120" name="contentImg1">
				        <img id="contentImg2" width="150" height="120" name="contentImg2">     
				        <img id="contentImg3" width="150" height="120" name="contentImg3">     
                    </div>
                    
				<!--파일 첨부 영역 -->
				<div id="file-area" align="center">
					<input type="file" id="file1" name="file1" onchange="loadImg(this,1);"><!-- 대표이미지라서 필수입력사항 -->
					<input type="file" id="file2" name="file2" onchange="loadImg(this,2);">
					<input type="file" id="file3" name="file3" onchange="loadImg(this,3);">
					<input type="file" id="file4" name="file4" onchange="loadImg(this,4);">
				</div>

                    <button type="submit" id="register_Btn">등록</button>
                    <button type="reset" id="back">취소</button>

                </form>
                
                <script>
               
                $(function(){
    				$("#file-area").hide();
    				$("#thum2").click(function(){
    					$("#file1").click();
    				});
    				$("#contentImg1").click(function(){
    					$("#file2").click();
    				});
    				$("#contentImg2").click(function(){
    					$("#file3").click();
    				});
    				$("#contentImg3").click(function(){
    					$("#file4").click();
    				});
    			});
                
                function loadImg(inputFile,num){

                	if(inputFile.files.length==1){
                		
                		var reader = new FileReader();
                		
                		reader.readAsDataURL(inputFile.files[0]);
                		
                		reader.onload = function(e){
                			switch(num){
							case 1 :$("#thum2").attr("src",e.target.result); break;
							case 2 :$("#contentImg1").attr("src",e.target.result); break;
							case 3 :$("#contentImg2").attr("src",e.target.result); break;
							case 4 :$("#contentImg3").attr("src",e.target.result); break;
                		}
					}
				}else{
					switch(num){
						case 1 :$("#thum2").attr("src",null); break;
						case 2 :$("#contentImg1").attr("src",null); break;
						case 3 :$("#contentImg2").attr("src",null); break;
						case 4 :$("#contentImg3").attr("src",null); break;
					}
                		}
                	}
                </script>
            
            </div>
        </div>
	</div>
		<div class="bottom">
			<%@include file="/views/common/footer.jsp"%>
		</div>
</body>
</html>