<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.product.model.vo.Product,com.semi.common.vo.PageInfo"%>
    
 <%
 	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	int[] relist = (int[])request.getAttribute("relist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int bar = (int)request.getAttribute("bar");
	int barNum = (int)request.getAttribute("barNum");
	String barSearch = (String)request.getAttribute("barSearch");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_items.css">
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/receive.admin'">입고 조회</td>
						<td onclick="location.href='<%=contextPath%>/release.admin'">출고 조회</td>
						<td onclick="location.href='<%=contextPath%>/items.admin?currentPage=1'" id="own" >상품 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<form action="<%=contextPath%>/searchProduct.admin?currentPage=1" method="get" onsubmit="return blankSearch()">
					<input type="hidden" name="currentPage" value="1">
					<select name="ms_select" id="ms_select">
						<option value="1">상품 번호</option>
						<option value="2">상품 카테고리</option>
						<option value="3">상품명</option>
						<option value="4">출판사</option>
						<option value="5">저자</option>
						<option value="6">등록일</option>
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
			
			<div id="noticeBtn">
				<button onclick="location.href='<%=contextPath%>/book.regi'">상품 등록</button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
					<%if(list.isEmpty()) {%>
						<tr>
							<th style="font-size: 18px;">
								현재 등록된 상품이 없습니다.
							</th>
						</tr>
					<%}else {%>
					
						<tr id="ml_tr">
							<th>상품 번호</th>
							<th>상품 카테고리</th>
							<th>상품명</th>
							<th>출판사</th>
							<th>상품설명</th>
							<th>가격</th>
							<th>할인율</th>
							<th>재고수량</th>
							<th>저자</th>
							<th>등록일</th>
							<th>삭제유무</th>
						</tr>
					</thead>
					<tbody>
						<%int j = 0; %>
						<%for(Product i : list){ %>
							<tr>
							<!-- 상품 카테고리 문자열 처리 -->
							<%
								String category = "";
								switch(i.getProductCategory()){
									case "1" : category = "소설";
										break;
									case "2" : category = "에세이";
										break;
									case "3" : category = "자기계발";
										break;
									case "4" : category = "경제/경영";
										break;
									case "5" : category = "인문학";
										break;
									case "6" : category = "정치/사회";
										break;
									case "7" : category = "아이템";
										break;
								};
							%>
								<td><%=i.getProductNo() %></td>
								<td><%=category %></td>
								<td><%=i.getProductName() %></td>
								<td><%=i.getProductPublisher() %></td>
								<td><%=i.getProductText() %></td>
								<td><%=i.getProductPrice() %></td>
								<td><%=i.getProductSalesRate() %></td>
								
								<%if((i.getProductStock() - relist[j]) > 0) {%>
									<td><%=i.getProductStock() - relist[j] %></td>
								<%}else {%>
									<td>0</td>
								<%} %>
								
								<%if(i.getAuthor() == null){%>
									<td></td>
								<%}else{%>
									<td><%=i.getAuthor() %></td>
								<%}%>
								<td><%=i.getCreateDate() %></td>
								<td><%=i.getStatus() %></td>
							</tr>
							<%j+=1; %>
						<%} %>
					<%} %>
					</tbody>
				</table>
			</div>
			
			<!-- 일반 조회 시 페이징 바 -->
			<%if(bar == 0) {%>
				<div align="center" class="paging-area">
				<!-- 이전 버튼 -->
				<%if(pi.getCurrentPage() != 1) {%>
					<button onclick="location.href='<%=contextPath%>/items.admin?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
				<%}%>
				
				<!-- 페이징바 -->
				<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){%>
					<%if(i != pi.getCurrentPage()) {%>
						<button onclick="location.href='<%=contextPath%>/items.admin?currentPage=<%=i%>'"><%=i%></button>
					<%}else {%>
						<button disabled><%=i%></button>
					<%} %>
				<%} %>
				
				<!-- 다음 버튼 -->
				<%if(pi.getCurrentPage() != pi.getMaxPage()){%>
					<button onclick="location.href='<%=contextPath%>/items.admin?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
				<%}%>
				</div>
				
			<!--  ===== ===== ===== 검색기능 사용시 페이징 바 ===== ===== ===== -->
			<%}else{ %>
				<div align="center" class="paging-area">
				<!-- 이전 버튼 -->
				<%if(pi.getCurrentPage() != 1) {%>
					<button onclick="location.href='<%=contextPath%>/searchProduct.admin?currentPage=<%=pi.getCurrentPage()-1%>&barNum=<%=barNum%>&barSearch=<%=barSearch%>'">&lt;</button>
				<%}%>
				
				<!-- 페이징바 -->
				<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){%>
					<%if(i != pi.getCurrentPage()) {%>
						<button onclick="location.href='<%=contextPath%>/searchProduct.admin?currentPage=<%=i%>&barNum=<%=barNum%>&barSearch=<%=barSearch%>'"><%=i%></button>
					<%}else {%>
						<button disabled><%=i%></button>
					<%} %>
				<%} %>
				
				<!-- 다음 버튼 -->
				<%if(pi.getCurrentPage() != pi.getMaxPage() ){%>
					<button onclick="location.href='<%=contextPath%>/searchProduct.admin?currentPage=<%=pi.getCurrentPage()+1%>&barNum=<%=barNum%>&barSearch=<%=barSearch%>'">&gt;</button>
				<%}%>
				</div>
			<%} %>		
		</div>
		
		<div class="bottom">
		
			<%@include file="/views/common/footer.jsp"%>
			
		</div>

				<!-- ========================= 모달 영역 ========================= -->
		
				<div class="modal">
					<div class="modal_content">
						
						<div class="modal_img">
							<img src="resources/adminPage_files/iconFolder/product_icon.png">
						</div>
		
						<div id="modal_member">
							상품 정보
						</div>
		
						<div class="modal_body">
		
							<div id="productN">
								&lt;상품 번호&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;상품 카테고리&gt;
								<div>
		
								</div>
							</div>
		
							<div>
								&lt;상품명&gt;
								<div>
									
								</div>
							</div>	
		
							<div>
								&lt;출판사&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;상품설명&gt;
								<div><pre id="productDescription"></pre>
									
								</div>
							</div>
		
							<div>
								&lt;가격&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;할인율&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;재고수량&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;저자&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;등록일&gt;
								<div>
									
								</div>
							</div>
		
							<div>
								&lt;삭제유무&gt;
								<div>
									
								</div>
							</div>
						</div>
						<form action="<%=contextPath %>/product.md" method="get">
						<div class="modal_footer">
							<input type="hidden" name="ppro" id="ppro" value="">
							<input type="hidden" name="cate" id="cate" value="">
							<button type="submit"">상품 수정</button>
							<button type="button" onclick="deleteProduct()">상품 삭제</button>
						</div>						
						</form>
					</div>
				</div>

			<!-- ==================== 상품 삭제 (모달) ==================== -->
	
			<div class="modal_delete">
				<form action="<%=contextPath%>/deleteProduct.admin" method="post">
					<input type="hidden" id="productNo" name="productNo" value="" >
				<div class="modal_delete_content">
					<div class="modal_delete_header">
						<img src="resources/adminPage_files/iconFolder/delete_icon.png">
					</div>
					<div class="modal_delete_body">
						정말 삭제 하시겠습니까?
					</div>
					<div class="modal_delete_footer">
						<input type="submit" value="삭제" id="delsub">
						<button type="button" id="delbtn" onclick="delbutton()">취소</button>
					</div>
				</div>
				</form>	
			</div>


			<!-- ==================== 스크립트 ==================== -->

			<script>
			
				$(".list-area>tbody>tr").click(function(){
					var rel = $(this).children().eq(7).text();
				
					//상품번호 추출
					var pno = $(this).children().eq(0).text();
					//카테고리번호 추출
					var ca1 = $(this).children().eq(1).text();
					
					//상품 수정시 상품 번호 추출을 위해 클릭시 히든값에 넣어주기
					var ppro = document.getElementById("ppro");
					ppro.value = pno;
					
					var cate = document.getElementById("cate");
					cate.value = ca1;
					
					//검색결과에 따른 조회값 추출 및 삽입
					$.ajax({
						
						url : "detailItems.admin?pno="+pno,
						
						type : "post",
						
						success : function(result){
							
							//상품 카테고리 문자열 처리
							var category = "";
							switch(result.productCategory){
								case '1' : category = "소설"
									break;
								case '2' : category = "에세이"
									break;
								case '3' : category = "자기계발"
									break;
								case '4' : category = "경제/경영"
									break;
								case '5' : category = "인문학"
									break;
								case '6' : category = "정치/사회"
									break;
								case '7' : category = "아이템"
									break;
							};
							
							//해당 영역에 회원 이름 넣기
							$(".modal_header").text(result.memberName);
							
							$(".modal_body").children().children().eq(0).text(result.productNo);
							$(".modal_body").children().children().eq(1).text(category);
							$(".modal_body").children().children().eq(2).text(result.productName);
							$(".modal_body").children().children().eq(3).text(result.productPublisher);
							$("#productDescription").text(result.productText);
							//$(".modal_body").children().children().eq(4).text(result.productText);
							$(".modal_body").children().children().eq(5).text(result.productPrice);
							$(".modal_body").children().children().eq(6).text(result.productSalesRate);
							if(rel > 0){
								$(".modal_body").children().children().eq(7).text(rel);
							}else{
								$(".modal_body").children().children().eq(7).text(0);
							}
							$(".modal_body").children().children().eq(8).text(result.author);
							$(".modal_body").children().children().eq(9).text(result.createDate);
							$(".modal_body").children().children().eq(10).text(result.status);
						},
						
						error : function(){
							console.log("상품조회 실패");
						}
						
					});
				});
				
				//모달 보이기/숨기기 기능
				$(function(){
					$(".list-area>tbody>tr").click(function(){
						$(".modal").fadeIn();
					});
					
					$(".modal_content,.modal").click(function(){
						$(".modal").fadeOut();
					});
					
				});	
				
				//상품삭제 버튼 클릭시
				function deleteProduct(){
					//해당 모달 창 열어주기
					$(".modal_delete").fadeIn();
					
					//상품 번호 추출
					var delPno = $(".modal_body").children().children().eq(0).text();
					
					//form태그안의 hidden값을 넣어줌
					$("#productNo").val(delPno);
				}
				
				// 상품삭제 창에서의 취소버튼 클릭시
				function delbutton(){
					$(".modal_delete").fadeOut();
				}
				
			</script>	
	</div>	
</body>
</html>