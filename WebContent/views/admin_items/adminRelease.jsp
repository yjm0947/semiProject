<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.product.model.vo.Product"%>
<% 
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_release.css">
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/receive.admin'">입고 조회</td>
						<td id="own" onclick="location.href='<%=contextPath%>/release.admin'">출고 조회</td>
						<td onclick="location.href='<%=contextPath%>/items.admin?currentPage=1'">상품 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<form action="<%=contextPath%>/searchRelease.admin" method="get" onsubmit="return blankSearch()">
					<select name="ms_select" id="ms_select">
						<option value="1">상품 번호</option>
						<option value="2">상품 명</option>
						<option value="3">상품 카테고리</option>
						<option value="4">주문자명</option>
						<option value="5">출고일</option>
					</select>
						<input type="search" name="memberSearch" id="memberSearch">
						<button type="submit" id="ms_img"></button>
				</form>
			</div>
			
			<script>
				function blankSearch(){
					if($("#memberSearch").val().length == 0){
						alert("다시 입력해 주시길 바랍니다.");
						return false;
					}
				};
			</script>
			
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
					<%if(list.isEmpty()) {%>
						<tr>
							<th style="font-size: 18px;">
							현재 출고된 상품이 없습니다.
							</th>
						</tr>
					<%}else {%>
						<tr id="ml_tr">
							<th>상품 번호</th>
							<th>상품 명</th>
							<th>상품 카테고리</th>
							<th>출고량</th>
							<th>주문자 ID</th>
							<th>출고일</th>
						</tr>
					</thead>
					<tbody>
						<%for(Product pr : list) {%>
							<tr>
								<td><%=pr.getProductNo()%></td>
								<td><%=pr.getProductName()%></td>
							<!-- 상품카테고리 문자열 처리 -->
							<%
								String category = "";
							
								switch(pr.getProductCategory()){
									case "1" : category = "소설" ;
										break;
									case "2" : category = "에세이" ;
										break;
									case "3" : category = "자기계발" ;
										break;
									case "4" : category = "경제/경영" ;
										break;
									case "5" : category = "인문학" ;
										break;
									case "6" : category = "정치/사회" ;
										break;
									case "7" : category = "아이템" ;
										break;
								}
							%>
								<td><%=category%></td>
								<td><%=pr.getProductStock()%></td>
								<td><%=pr.getAuthor()%></td>
								<td><%=pr.getCreateDate()%></td>
							</tr>
						<%} %>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>
	</div>	
</body>
</html>