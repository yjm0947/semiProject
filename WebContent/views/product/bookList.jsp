<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.product.model.vo.Product,com.semi.common.vo.PageInfo,com.semi.product.controller.BookListController"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	/* int cate = Integer.parseInt(String.valueOf((request.getAttribute("cate")))); */
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        
        <style>
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
        /* float 속성 해제 */
        .clearfix{
            clear: both;
        }
        /*-----------------콘텐츠------------------------*/
        #content{
            /* background-color: antiquewhite; */
            width: 1400px;
            margin: auto;
            /*display: flex; /*이미지 중앙 정렬*/
            /*position: relative; /*출석판 위 출석하기 정렬 1단계*/
        }
        #con_1{
            width: 1400px;
            height: 150px;
            /* background-color: aqua; */
        }
        #con_1 p{
            margin: 0px;
            padding: 0px;
        }
        #con_title{
            width: 1150px;
            height: 65%;
            /* background-color: blue; */
            font-size: 30px;
            font-weight: 600;
            position: relative;
            left: 118px;
            top: 15px;
            line-height: 125px;
            color: rgb(14, 10, 41);
            cursor: default;
        }
        #con_subtitle{
            width: 1150px;
            height: 35%;
            /* background-color: blueviolet; */
            font-size: 16px;
            position: relative;
            left: 118px;
            top: 5px;
            color: rgb(148, 146, 146);
            cursor: default;
        }
        /*카테고리 메뉴------------------------*/
        #con_menu{
            /* background-color: aqua; */
            width: 1200px;
            height: 57px;
            margin: auto;
        }
        #con_menu_2,#con_menu_3{
            display: block;
            float: left;
            width: 145px;
            height: 50px;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
            font-weight: 550;
            color: rgb(190, 187, 187);
            line-height: 50px;
            border: 1px solid rgb(221, 219, 219);
            border-bottom: 0px;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        #con_menu_1{
            display: block;
            float: left;
            width: 145px;
            height: 50px;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
            font-weight: 550;
            color: rgb(44, 43, 43);
            line-height: 50px;
            border: 1px solid rgb(44, 43, 43);
            border-bottom-style: none; /*검색 우 선*/
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        #con_menu a:hover{
            border: 1px solid rgb(44, 43, 43);
            border-bottom-style: none;
            color: rgb(44, 43, 43);
        }
        /*리스트 메뉴바------------------------------------------*/
        #list_menu{
            width: 1205px;
            height: 55px;
            /* background-color: antiquewhite; */
            margin: auto;
            border: 1px solid rgb(221, 219, 219);
            border-left: none;
            border-right: none;
            border-bottom: none;
        }
        #list_menu>*{
            float: left;
        }
        #list_menu_1{
            /* background-color: aqua; */
            height: 80%;
            width: 30%;
        }
        #list_num{
            /* background-color: blue; */
            height: 100%;
            width: 40%;
        }
        #list_menu_3{
            /* background-color: aqua; */
            height: 100%;
            width: 30%;
        }
        /*카테고리*/
        #list_menu_1{
            position: relative;
            top: 12px;
            left: 10px;
            font-size: 15px;
        }
        #list_menu_1>button{
            background-color: white;
            border: 1px solid rgb(230, 227, 227);
            height: 30px;
            width: 50px;
            border-radius: 5px;
        }
        #list_menu_1>button:hover{
            background-color: rgb(246, 243, 243);
        }
        /*페이지*/
        /*전체선택, 장바구니*/
        #list_menu_3>input{
            border: 1px solid rgb(202, 195, 195);
        }
        #list_menu_3{
            position: relative;
            left: 173px;
            line-height: 53px;
            font-size: 15px;
        }
        #list_menu_3>button{
            background-color: white;
            border: 1px solid rgb(202, 195, 195);
            width: 100px;
            height: 45px;
            border-radius: 10px;
        }
        #list_menu_3>button:hover{
            background-color: rgb(246, 243, 243);
        }
        /*도서 목록-----------------------------------------*/
        #book{
            /* background-color: aqua; */
            width: 1205px;
            height: 300px;
            margin: auto;
            border: 1px solid rgb(221, 219, 219);
            border-left: none;
            border-right: none;
        }
        #book>div{
            height: 100%;
            float: left;
        }
        #book_1{
            width: 5%;
            /* background-color: blue; */
        }
        #book_2{
            width: 80%;
            /* background-color: blueviolet; */
        }
        #book_3{
            width: 15%;
            /* background-color: brown; */
        }
        #book_2>img{
            width:165px;
            height:210px;
            position: relative;
            top: 40px;
        }
        #book_3>button{
            /* display:inline-block; */
            position: relative;
            top: 90px;
            left: 40px;
            margin: 3px;
            height: 50px;
            width: 100px;
            border-radius: 10px;
            border: 1px solid rgb(148, 146, 146);
            background-color: none;
        }
        
        /*상품 없을시========================*/
		    #none_div{
		      /* background-color: aqua; */
		      width: 1200px;
		      height: 80px;
		      margin: auto;
		      border: 1px solid rgb(214, 211, 211);
		      border-left: none;
		      border-right: none;
		      color: rgb(161, 161, 161);
		      font-size: 15px;
		    }
		    #none_td{
		      /* background-color: blue; */
		      text-align: center;
		      position: relative;
		      top: 28px;
		    }
		    
        /*체크박스-----------------------------------------------------------*/
        #check{
            width: 30px;
            height: 18px;
            /* background-color: aqua; */
            position: relative;
            left: 10px;
            top: 27px;
        }
        /*썸네일----------------------------*/
        #imgthumb{
            position: relative;
            left: -8px;
        }
        #page{
            /* background-color: aqua; */
            width: 1200px;
            height: 50px;
            margin: auto;
            text-align: center;
        }
        #list_num>button,#page>button{
            display:inline-block;
            background-color: white;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 5px;
            position: relative;
            top: 15px;
        }
        #list_num{
        	text-align: center;
        }
        
        #num{
        	cursor: pointer;
        }
        
        /*가격--------------------------------------------------------*/
        #tr_3{
            /* background-color: aqua; */
            position: relative;
            top: 17px;
            font-size: 12px;
            font-weight: 600;
            /* width: 600px; */
        }
        #tr_3>*{
            float: left;
        }
        #tr_3_1{
            color: rgb(120, 171, 196);
            height: 100%;
            width: 35px;
        }
        #tr_3_2{
            height: 100%;
            width: 55px;
        }
        #tr_3_3{
            height: 100%;
            width: 55px;
            color: rgb(148, 146, 146);
        }
        #tr_3_4{
            height: 100%;
            width: 55px;
            color: rgb(148, 146, 146);
        }
        
         /*버튼*/
        button{
        cursor : pointer;
        background-color: white;
        }
        
        /*카테고리 목록 추가================================*/
        #all_content{
            width: 1400px;
            margin: auto;
            /* background-color: aqua; */
         	/*height: 2730px;*/
         	position: relative;
         	left: 260px;
         	height: auto;
         	display: inline-block;
        }
        #all_content>div{
            float: left;
        }
        #all_content_1{
            width: 200px;
            /* height: 1000px; */
            /* background-color: blue; */
        }
        #all_content_2{
            width: 1200px;
            /*height: 1000px;*/
            /* background-color: brown; */
        }
        #all_content_2>*{
        	position: relative;
        	left : -105px
        }
        #all_none{
            width: 200px;
            /* background-color: yellowgreen; */
            height: 205px;
        }
        #all_cate{
            width: 170px;
            border: 1px solid rgb(167, 167, 167);
            /* height: 400px; */
            border-radius: 8px;
            font-size: 20px;
            margin: auto;
            font-weight: 600;
            color: rgb(44, 44, 65);
            position: fixed;
            /* box-sizing: border-box; */
            padding: 9px;
            /* box-shadow: 0 1rem 5rem -2rem rgba(black,0.5); */
            /* transition: transform 100ms linear; */
            /* background-color: rgb(207, 218, 228); */
        }
        #all_cate a{
            text-decoration: none;
            color: rgb(86, 86, 95);
            font-size: 15px;
            font-weight: 500;
        }
        </style>
</head>
<body>
	<%@include file = "../common/header.jsp" %>
	
      <div id="all_content" >
        <div id="all_content_1">
            <div id="all_none"></div>
            <div id="all_cate">
                <pre></pre>
                &nbsp;&nbsp;&nbsp;카테고리
                <ul>
                    <li><a href="<%=contextPath%>/cate.b?currentPage=1&cate=1">소설</a> </li>
                    <li><a href="<%=contextPath%>/cate.b?currentPage=1&cate=2">에세이</a> </li>
                    <li><a href="<%=contextPath%>/cate.b?currentPage=1&cate=3">자기계발</a></li>
                    <li><a href="<%=contextPath%>/cate.b?currentPage=1&cate=4">경제/경영</a></li>
                    <li><a href="<%=contextPath%>/cate.b?currentPage=1&cate=5">인문학</a> </li>
                    <li><a href="<%=contextPath%>/cate.b?currentPage=1&cate=6">정치/사회</a></li>
                </ul>
            </div>
        </div>
        <div id="all_content_2">
                    <div id="content">
                     <div id="con_1">
                        <p id="con_title">도서 전체 목록</p>
                        <p id="con_subtitle">파란 서점에서 판매되는 전체 도서 목록입니다.</p>
                     </div>
                     <div id="con_menu">
                        <a href="<%=contextPath %>/book.list?currentPage=1" id="con_menu_1">전체 도서</a>
                        <a href="<%=contextPath %>/book.be?currentPage=1" id="con_menu_2">베스트 셀러</a>
                        <a href="<%=contextPath %>/book.new?currentPage=1" id="con_menu_3">신간 도서</a> <!--비동기통신 예정-->
                     </div>
                   
                     <div id="list_menu">
                        <div id="list_menu_1"> 
                            
                        </div>
                        <div id="list_num"><!-- 페이징 처리 -->
                            <!-- 왼쪽 가기 버튼 -->
                <%if(pi.getCurrentPage()!=1) {%>
                	<button type="button" onclick="location.href='<%=contextPath %>/book.list?currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
                <%} %>
                
                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
                	<%if(i!=pi.getCurrentPage()) {%>
                		<button type="button" onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=i%>';"><%=i %></button>
                	<%}else {%>
                		<button type="button" disabled><%=i %></button>
                	<%} %>
                <%} %>
                <!-- 오른쪽으로 가는 버튼 -->
                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
                	<button type="button" onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
                <%} %>

                        </div>
                    </div>
            </div>
         </div>
            	<%if(list.isEmpty()) {%>
            		<div id="none_div">
			        	<div id="none_td">도서 목록이 존재하지 않습니다.</div>
			        </div>
            	<%} else {%>

            	<%for(Product p : list) {%>

         <div class="book_list" id="book"  style="position: relative; background-color:; left: 192px;" >
            <div id="book_1">
                <input type="hidden" value="<%=p.getProductNo()%>">
            </div>
            <div id="book_2" >

                <table>
                    <tr id="num">
                        <td rowspan="4" style="width: 150px; height: 250px;"><img src="<%=contextPath + p.getTitleImg() %>" alt="" style="border: 1px solid rgb(204, 204, 204);" width="135px" height="200px" id="imgthumb">
                        <input type="hidden" value="<%=p.getProductNo()%>">                       
                        </td>
                        <td id="title" style="font-size: 16px; font-weight: 600; position: relative; top: 45px;"><%=p.getProductName() %></td>
                    </tr>
                    <tr>
                        <td style="font-size: 12px; font-weight: 300; position: relative; top: 25px;"><%=p.getAuthor() %> ⊙ <%=p.getProductPublisher() %> ⊙ <%=p.getCreateDate() %></td>
                    </tr>
                        <!--  
                        -->
                    <tr>
                        <td id="tr_3">
                        	<div id="tr_3_1"><%=p.getProductSalesRate() %>%&nbsp;</div>
                            <div id="tr_3_2"><fmt:formatNumber value="<%=Math.round((1-(p.getProductSalesRate()*0.01))*p.getProductPrice()) %>" pattern="#,###"/>원&nbsp;</div>
                            <div id="tr_3_3"><s><fmt:formatNumber value="<%=p.getProductPrice() %>" pattern="#,###"/>원</s>&nbsp;</div>
                            <div id="tr_3_4"><%=Math.round(((1-(p.getProductSalesRate()*0.01))*p.getProductPrice())*0.01) %>p</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p style="position: relative; top: -10px; font-size: 12px; font-weight: 300;">
                            <%if(p.getProductText().length()>=250) {%><!-- 텍스트 글자 250 이상 -->
	                            <%=p.getProductText().substring(0,250)%></p>
                            <%}else {%><!-- 텍스트 글자 250이하 -->
                            	<%=p.getProductText() %>
                            <%} %>
                        </td>
                    </tr>
                </table>
                        </div>
                        <%if(loginUser!=null){ %>
                        <div id="book_3">
                            <button id="cart" type="button">장바구니</button>
                <input type="hidden" value="<%=p.getProductNo()%>"> 
                <button id="direct" type="button">바로구매</button>
            </div>
            <%}else{ %>
            
            <div id="book_3">
                <button type="button" onclick="q_btn_on()">장바구니</button>
                <button type="button" onclick="q_btn_on()">바로구매</button>
            </div>
            <%} %>
        </div>
                <%} %>
			
			<%} %>

                <div id="page" style="position: relative; left: 200px;">
                	<!-- 왼쪽 가기 버튼 -->
                <%if(pi.getCurrentPage()!=1) {%>
                	<button type="button" onclick="location.href='<%=contextPath %>/book.list?currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
                <%} %>
                
                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
                	<%if(i!=pi.getCurrentPage()) {%>
                		<button type="button" onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=i%>';"><%=i %></button>
                	<%}else {%>
                		<button type="button" disabled><%=i %></button>
                	<%} %>
                <%} %>
                <!-- 오른쪽으로 가는 버튼 -->
                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
                	<button type="button" onclick="location.href='<%=contextPath%>/book.list?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
                <%} %>
                        </div>
                    </div>
        <script>
        
		      /* //스크롤 부드럽게 따라오게 하기
		        $(document).ready(function(){
		            var currentPosition = parseInt($("#all_cate").css("top"));
		            $(window).scroll(function() {
		                var position = $(window).scrollTop(); 
		                $("#all_cate").stop().animate({"top":position+currentPosition+"px"},1000);
		            });
	            }); */
        	
        	//디테일 페이지 이동
            $(function(){
            	$("#book_2>table>tbody>#num").click(function(){
            		//console.log(this);
            		var pno = $(this).children().eq(0).children("input[type=hidden]").val();
            		//console.log(pno);
            		location.href="<%=contextPath%>/book.de?pno="+pno;
            	});
            });
        	
            <%if (loginUser!=null){%> //로그인 되어있으면
            
            //장바구니 버튼 클릭시
            $(function(){
            	$("#book_3>#cart").click(function(){
            		var productNo = $(this).parent().children("input[type=hidden]").val()
            		var cartNo = 0;
            		selectCart(productNo);
            		
            		//장바구니 조회
            		function selectCart() {
            			$.ajax({
            				url : "<%=request.getContextPath()%>/select.sc",
            				data : {
            					usernum:<%=loginUser.getMemberNo()%>,
            					productnum:	productNo
            					},
            				type : "get",
            				success: function(result){
            					if (result != null && result.productNo==productNo ) {
            						cartNo = result.cartId;
            						if (confirm("선택한 상품이 이미 장바구니에 있습니다.\n수량을 추가하시겠습니까?")) {
            							plusQty(result.productNo);
            						}
            					}else {
            						addCart(productNo);
            					}
            				},
            				error : function(result){
            					console.log("통신실패");
            				}
            			});
            		 }
            		
            		//장바구니 수량 추가
            		function plusQty() {
            			$.ajax({
            				url : "<%=request.getContextPath()%>/plusQty.sc",
            				data : { 
            					cartId:cartNo,
            					productNo:productNo,
            					cnt:1
            				},
            				type : "post",
            				success: function(result){
            					if (confirm("장바구니로 이동하시겠습니까?")) {
            						location.replace("<%=request.getContextPath()%>/list.sc");
            					}
            				},
            				error : function(result){
            					console.log("통신실패");
            				}
            			});
            		}
            		
            		//장바구니 추가
            		function addCart() {
            			$.ajax({
            				url : "<%=request.getContextPath()%>/insert.sc",
            				data : {
            					usernum:<%=loginUser.getMemberNo()%>,
            					productnum:productNo,
            					cnt:1
            				},
            				type : "post",
            				success: function(result){
            					if (confirm("장바구니로 이동하시겠습니까?")) {
            						location.replace("<%=request.getContextPath()%>/list.sc");
            					}
            				},
            				error : function(result){
            					console.log("통신실패");
            				}
            			});
            		}
            		
            	});
            	
            	//바로구매 버튼 클릭시
            	$("#book_3>#direct").click(function() {
            		var productNo = $(this).parent().children("input[type=hidden]").val()
            		
            		directOrder(productNo);
            		
            		//바로구매
            		function directOrder(){
            	        
            	        //AJAX 서버 업데이트 전송
            			$.ajax({
            				url : "<%=request.getContextPath()%>/directOrder.od",
            				data : {
            					userNo:<%=loginUser.getMemberNo()%>,
            					productNo:productNo
            					},
            				type : "post",
            				success: function(result){
            					location.replace("<%=request.getContextPath()%>/order.od");
            				},
            				error : function(result){
            					console.log("통신실패");
            				}
            			});
            			
            		}
				});
            	
            });	
    		
    		<%}else{%>
    			/*로그인 페이지로 이동*/
          		function q_btn_on(){
   					alert("로그인 후 이용이 가능합니다."); 
   					location.href = "<%=contextPath%>/logform.me"
      			};
    		<%}%>
          </script>
       	<%@include file = "../common/footer.jsp" %>
</body>
</html>