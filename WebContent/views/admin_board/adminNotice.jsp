<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.semi.board.model.vo.Board,com.semi.product.model.vo.Attachment"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	Integer bno = (Integer)session.getAttribute("bno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminItems</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_category.css">
	<link rel="stylesheet" href="resources/adminPage_files/cssFolder/admin_notice.css">
</head>
<body>
	<div class="wrap">
		
		<%@include file="/views/common/admin_Category.jsp" %>
	
		<div class="top">
				<table>
					<tr>
						<td onclick="location.href='<%=contextPath%>/notice.admin'">공지사항</td>
						<td onclick="location.href='<%=contextPath%>/inquire.admin'">1:1 문의</td>
						<td onclick="location.href='<%=contextPath%>/faq.admin'">FAQ 관리</td>
					</tr>
				</table>
		</div>
		<div class="middle">
			<div id="mid_search">
				<form action="<%=contextPath%>/searchNotice.admin" method="get" onsubmit="return blankSearch()">
					<select name="ms_select" id="ms_select">
						<option value="1">게시글 번호</option>
						<option value="2">제목+내용</option>
					</select>
						<input type="search" name="memberSearch" id="memberSearch">
						<button type="submit" id="ms_img"></button>
				</form>
				<script>
					function blankSearch(){
						if($("#memberSearch").val().length == 0){
							alert("다시 입력해주시길 바랍니다.");
							return false;
						}
					};
				</script>
			</div>
			<div id="noticeBtn">
				<button onclick="location.href='<%=contextPath%>/insertNotice.admin'">공지사항 등록</button>
			</div>
		</div>
		<div class="middle_left">
			<div id="ml_table">
				<table class="list-area">
					<thead>
					<%if(list.isEmpty()) {%>
						<tr>
							<th style="font-size: 18px;">
								현재 등록된 공지사항이 없습니다.
							</th>
						</tr>
					<%}else {%>
						<tr id="ml_tr">
							<th>게시글 번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>내용</th>
							<th>조회수</th>
							<th>작성 일시</th>
						</tr>
					</thead>
					<tbody>
						<%for(Board b : list) {%>
						<tr>
							<td><%=b.getBoardNo()%></td>
							<td><%=b.getMemberNo()%></td>
							<td><%=b.getBoardTitle()%></td>
							<td><%=b.getBoardContent()%></td>
							<td><%=b.getBoardCount()%></td>
							<td><%=b.getCreateDate()%></td>
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
		
		<!-- ========================= 모달 영역 ========================= -->
		
		<div class="modal">
			<div class="modal_content">
				
				<div class="modal_img">
					공지사항
				</div>
				
				<div id="modal_member">
					공지사항 상세조회
				</div>

				<div class="modal_body">

					<div>
						게시글 번호
						<div>
							
						</div>
					</div>
					
					<div>
						작성자
						<div>
							
						</div>
					</div>
					
					<div>
						공지사항 제목
						<div>
							
						</div>
					</div>
					
					<div>
						공지사항 내용
						<div id="noticeContent_area">
						
							<div id="noticeHtml">
							</div>
							<div id="noticeText">
							</div>
						</div>
					</div>
					
					<div>
						조회수
						<div>
							
						</div>
					</div>
					
					<div>
						작성 일시
						<div>
							
						</div>
					</div>
					
				</div>
				<form action="<%=contextPath%>/noticeUpdate.admin" method="get">
				<input type="hidden" name="boardNo" id="boardNo" value="">
					<div class="modal_footer">
						<button type="submit">공지 수정</button>
						<button type="button" onclick="deleteNotice()">공지 삭제</button>
					</div>
				</form>
			</div>
		</div>
		
		<!-- ==================== 스크립트 ==================== -->
		<script>
			
		
			$(function(){
				
				$(".list-area>tbody>tr").click(function(){
					
					//게시글번호 추출
					if(<%=bno%>==null){
						var bno = $(this).children().eq(0).text();
					}else{
						var bno = <%=bno%>;
						$(".modal").fadeIn();
						<%session.removeAttribute("bno");%>
					}
					var bno = $(this).children().eq(0).text();
					
					//hidden에 게시글번호 담기(modal_footer)
					$("#boardNo").val(bno);
					
					//첨부파일 뿌리기
					$.ajax({
						
						url : "detailNotice.admin?bno="+bno,
						
						type : "post",
						
						success : function(result){
							
							var createDiv = '';
							for(var i=0; i<result.length; i++){
								//파일첨부 갯수만큼 div와 img파일 생성해주기
								createDiv += '<div id="imgDiv"><img id="imgNotice'+i+'"></div>';
							}
							$("#noticeHtml").html(createDiv);
							
							for(var i=0; i<result.length; i++){
								//경로 변수처리
								var path = result[i].attachmentPath + result[i].attachmentChange;
								$("#imgNotice"+i).attr('src',"<%=contextPath%>"+path);
							}
						},
						
						error : function(){
							console.log("공지조회 실패");
						}
					});
					
					//결과에 따른 조회값 뿌리기 (모달 상세조회)
						console.log("ajax밖" + bno);
					$.ajax({
						
						
						url : "detailNotice.admin?bno="+bno,
								
						type : "get",
						
						success : function(result){
							console.log($(".modal_body").children().children().eq(0).text());
							$(".modal_body").children().children().eq(0).text(result.boardNo);
							console.log("success : " + $(".modal_body").children().children().eq(0).text());
							$(".modal_body").children().children().eq(1).text(result.memberNo);
							$(".modal_body").children().children().eq(2).text(result.boardTitle);
							$("#noticeText").text(result.boardContent);
							$(".modal_body").children().children().eq(4).text(result.boardCount);
							$(".modal_body").children().children().eq(5).text(result.createDate);
						},
						
						error : function(){
							console.log("공지조회 실패");
						}
					});
				});
			});
			
			//삭제버튼 게시글번호 값 추출
			function deleteNotice(){
				var bno = $(".modal_body").children().children().eq(0).text();
				location.href='<%=contextPath%>/deleteNotice.admin?bno='+bno;
			};
			
			//모달 보이기/숨기기 기능
			$(function(){
				
				$(".list-area>tbody>tr").click(function(){
					$(".modal").fadeIn();
				});
				
				$(".modal_content,.modal").click(function(){
					$(".modal").fadeOut();
				});
			});
		</script>
		
</div>
</body>
</html>