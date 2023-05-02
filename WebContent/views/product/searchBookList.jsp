<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.product.model.vo.Product,com.semi.common.vo.PageInfo,com.semi.product.controller.SearchBookController"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String search = String.valueOf(request.getAttribute("search"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        div{
            box-sizing: border-box
        }
        #content>*{
            margin: auto;
        }
        /*상 글씨-----------------------------------------------------*/
        #title{
            width: 1180px;
            height: 150px;
            /* background-color: rgb(100, 88, 73); */
        }
        #maintitle{
            /* background-color: aqua; */
            width: 15%;
            height: 67%;
            font-size: 30px;
            font-weight: 600;
            cursor: default;
            position: relative;
            z-index: -1;
            top: 58px;
            color: rgb(14, 10, 41);
            text-align: 100px;
        }
        #subtitle{
            width: 100%;
            height: 33%;
            /* background-color: blue; */
            cursor: default;
            font-size: 16px;
            position: relative;
            color: rgb(148, 146, 146);
        }
        /*컨텐츠 카테고리--------------------------------------------------*/
        #con_menu{
            /* background-color: antiquewhite; */
            height: 58px;
            width: 1180px;
        }
        #con_menu>a{
            /* background-color: rgb(174, 182, 182); */
            height: 100%;
            width: 13.2%;
            display: block;
            text-decoration: none;
            text-align: center;
            line-height: 50px;
            top: 10px;
            font-size: 16px;
            font-weight: 550;
            color: rgb(44, 43, 43);
            border: 1px solid rgb(44, 43, 43);
            border-bottom-style: none; /*검색 우 선*/
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
            float: left;
        }
        #con_menu_1{
            /* background-color: aqua; */
            width: 1180px;
            height: 57px;
            border: 1px solid rgb(221, 219, 219);
            border-left: none;
            border-right: none;
        }
        #con_menu_1>*{
            float:left;
            height: 100%;
            
        }
        #con_menu_1a{
            /* background-color: antiquewhite; */
            height: 100%;
            width: 17%;
        }
        #con_page{
            /* background-color: blue; */
            width: 66%;
        }
        #con_sel{
            /* background-color: blueviolet; */
            width: 17%;
        }
        /*상 페이징----------------------------------------------------*/
        #con_page,#page{
            text-align: center;
            /* background-color: aqua; */
        }
        #con_page>button,#page>button{
            display:inline-block;
            background-color: white;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 5px;
            position: relative;
            top: 15px;
        }
        /*장바구니------------------------------------------------------*/
        #con_sel>input{
            vertical-align: middle;
            /* text-align: center; */
            background-color: aqua;
            height: 100%;
            width: 18px;
            position: relative;
            
        }
        #con_sel>button{
            border-radius: 10px;
            border: 1px solid rgb(148, 146, 146);
            background-color: none;
            height: 50px;
            width: 100px;
            margin: 3px;
            background-color: white;
            float: right;
        }
        /*내용 범위잡기------------------------------------------------------*/
        #con{
            height: 280px;
            width: 1180px;
            /* background-color: aqua; */
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: rgb(231, 231, 231);
        }
        #con_1{
            height: 27px;
            width: 100%;
            /* background-color: rgb(14, 43, 33); */
        }
        #con_2{
            height: 203px;
            width: 100%;
            /* background-color: blue; */
        }
        #con_3{
            height: 70px;
            width: 100%;
            /* background-color: rgb(13, 7, 19); */
        }
        #con_2>div{
            float: left;
        }
        #con_check{
            height: 100%;
            /* background-color: aqua; */
            width: 50px;
        }
        #con_img{
            height: 100%;
            /* background-color: blanchedalmond; */
            width: 135px;
        }
        #con_text{
            height: 100%;
            width: 850px;
            /* background-color: blue; */
        }
        #con_btn{
            height: 100%;
            /* background-color: blueviolet; */
            width: 145px;
        }
        /*내용 체크박스*/
        #con_check>input{
            width: 50px;
            height: 20px;
            position: relative;
            left: -5px;
        }
        /*내용*/
        #con_text>div{
            float: right;
        }
        #ct_title{
            /*background-color: antiquewhite;*/
            width: 420px;
            height: 27%;
            position: relative;
            left: -400px;
        }
        #ct_{
            /* background-color: aqua; */
            width: 820px;
            height: 9%;
            color: rgb(85, 85, 85);
        }
        #ct_price{
            /* background-color: blueviolet; */
            width: 820px;
            height: 25%;
        }
        #ct_text{
            width: 820px;
            /* background-color: brown; */
            height: 41%;
        }
        #ct_title{
            font-size: 16px;
            font-weight: 600;
            line-height: 80px;
        }
        #ct_{
            font-size: 12px;
            font-weight: 300;
        }
        #ct_price{
            font-size: 12px;

            line-height: 50px;
        }
        #ct_price>div{
            float: left;
            margin: 2px;
        }
        #ct_p1{
            color: rgb(120, 171, 196);
            font-weight: 600;
        }
        #ct_p2{
            font-weight: 600;
        }
        #ct_p3{
            text-decoration: line-through;
            color: rgb(114, 110, 110);
        }
        #ct_p4{
            color: rgb(114, 110, 110);
        }
        #ct_text{
            font-size: 12px;
            font-weight: 300;
            border: none;
            resize: none;
        }
        /*내용 버튼*/
        #con_btn>button{
            position: relative;
            top: 45px;
            left: 17px;
            margin: 3px;
            height: 50px;
            width: 100px;
            border-radius: 10px;
            border: 1px solid rgb(148, 146, 146);
            background-color: white;
        }

        /*하 페이징처리--------------------------------------------*/
        #page{
            height: 57px;
            width: 1180px;
            /* background-color: aqua; */
            border: 1px solid rgb(221, 219, 219);
            border-left: none;
            border-right: none;
        }
        
         /*버튼*/
        button{
        cursor : pointer;
        background-color: white;
        }
    </style>
</head>
<body>
	<%@include file = "../common/header.jsp" %>

    <div id="content">

        <div id="title">
            <div id="maintitle" >도서 및 상품</div>
            <div id="subtitle">검색한 도서 및 상품 목록입니다.</div>
        </div>
        <div id="con_menu">
            <a href="">전체 상품</a>
        </div>
        <div id="con_menu_1">
            <div id="con_menu_1a"></div>
            <div id="con_page">
                <!-- 왼쪽 가기 버튼 -->
                <%if(pi.getCurrentPage()!=1) {%>
                	<button onclick="location.href='<%=contextPath %>/search.bo?search=<%=search%>&currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
                <%} %>
                
                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
                	<%if(i!=pi.getCurrentPage()) {%>
                		<button onclick="location.href='<%=contextPath%>/search.bo?search=<%=search%>&currentPage=<%=i%>';"><%=i %></button>
                	<%}else {%>
                		<button disabled><%=i %></button>
                	<%} %>
                <%} %>
                <!-- 오른쪽으로 가는 버튼 -->
                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
                	<button onclick="location.href='<%=contextPath%>/search.bo?search=<%=search%>&currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
                <%} %>
            </div>
            <div id="con_sel">
                <input type="checkbox" id="checkbox" name="cart" value="전체선택" onclick="selectAll(this)">전체선택
                <button>장바구니</button>
            </div>
        </div>
        <%if(list.isEmpty()){ %>
        <div style="height: 80px; width: 1200px; text-align: center;">
            <pre style=" color: rgb(177, 175, 175);">
    
    
   검색하신 도서 및 상품 목록이 없습니다.
            </pre>
        </div>
        <%} else {%>
        <%for(Product p : list){%>
        
        <div id="con">
            <div id="con_1"></div>
            <div id="con_2">
                <div id="con_check">
                    <input type="checkbox" id="check" name="cart" value="상품번호출력">
                </div>
                <div id="con_img">
                    <img src="<%=contextPath + p.getTitleImg() %>" alt="" style="border: 1px solid rgb(204, 204, 204); width: 100%; height: 100%;">
               		<input type="hidden" value="<%=p.getProductNo()%>">
                </div>
                <div id="con_text">
                    <div id="ct_title"><%=p.getProductName() %></div>
                    <div id="ct_"><%=p.getAuthor() %> ⊙ <%=p.getProductPublisher() %> ⊙ <%=p.getCreateDate() %></div>
                    <div id="ct_price">
                        <div id="ct_p1"><%=p.getProductSalesRate() %>%</div>
                        <div id="ct_p2"><%=Math.round((1-(p.getProductSalesRate()*0.01))*p.getProductPrice()) %>원</div>
                        <div id="ct_p3"><s><%=p.getProductPrice() %>원</s></div>
                        <div id="ct_p4"><%=Math.round(((1-(p.getProductSalesRate()*0.01))*p.getProductPrice())*0.01) %>p</div>
                    </div>
                    <div id="ct_text">
                        <p style="position: relative; top: -10px; font-size: 12px; font-weight: 300;">
                            <%if(p.getProductText().length()>=75) {%><!-- 텍스트 글자 250 이상 -->
	                            <%=p.getProductText().substring(0,75)%></p>
                            <%}else {%><!-- 텍스트 글자 250이하 -->
                            	<%=p.getProductText() %>
                            <%} %>
                    </div>
                </div>
                <%if(loginUser!=null){ %>
	            <div id="con_btn">
	                <button id="cart" type="button">장바구니</button>
	                <input type="hidden" value="<%=p.getProductNo()%>"> 
	                <button id="direct" type="button">바로구매</button>
	            </div>
	            <%}else{ %>
	            <div id="con_btn">
	                <button type="button" onclick="q_btn_on()">장바구니</button>
	                <button type="button" onclick="q_btn_on()">바로구매</button>
	            </div>
	            <%} %>
                
            </div>
            <div id="con_3"></div><!--추후 별점 들어갈 예정-->
        </div>
        <%}} %>
        <div id="page">
            <!-- 왼쪽 가기 버튼 -->
                <!-- 왼쪽 가기 버튼 -->
                <%if(pi.getCurrentPage()!=1) {%>
                	<button type="button" onclick="location.href='<%=contextPath %>/search.bo?search=<%=search%>&currentPage=<%=pi.getCurrentPage()-1 %>'">&lt;</button>
                <%} %>
                
                <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
                	<%if(i!=pi.getCurrentPage()) {%>
                		<button type="button" onclick="location.href='<%=contextPath%>/search.bo?search=<%=search%>&currentPage=<%=i%>';"><%=i %></button>
                	<%}else {%>
                		<button type="button" type="button" disabled><%=i %></button>
                	<%} %>
                <%} %>
                <!-- 오른쪽으로 가는 버튼 -->
                <%if(pi.getCurrentPage()!=pi.getMaxPage()) {%>
                	<button type="button" onclick="location.href='<%=contextPath%>/search.bo?search=<%=search%>&currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
                <%} %>
        </div>
        <pre>

        </pre>
    </div>

    <script>

        $(function(){
        	$("#con>#con_2>#con_img").click(function(){
        		//console.log(this);
        		var pno = $(this).children("input[type=hidden]").val();
        		/* console.log(pno); */
        		location.href="<%=contextPath%>/book.de?pno="+pno;
        	});
        });
        
        $(function(){
        	$("#con>#con_2>#con_text").children("#ct_title").click(function(){
        		//console.log(this);
        		var pno = $(this).children("input[type=hidden]").val();
        		//console.log(pno);
        		location.href="<%=contextPath%>/book.de?pno="+pno;
        	});
        });
        
        <%if (loginUser!=null){%> //로그인 되어있으면
        
        //장바구니 버튼 클릭시
        $(function(){
        	$("#con_btn>#cart").click(function(){
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
        	$("#con_btn>#direct").click(function() {
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