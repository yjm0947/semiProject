<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
        /*-----------------콘텐츠------------------------*/
        #content{
            /* background-color: antiquewhite; */
            width: 1400px;
            height: 1600px;
            margin: auto;
            display: flex; /*이미지 중앙 정렬*/
            position: relative; /*출석판 위 출석하기 정렬 1단계*/
         
        }

        /*출석판----------------------------------------*/
        #attendance_img{
            display: block;
            margin: auto;
            height: 1450px;
            width: 980px;
            
        }

        /*출석하기-------------------------------------------------*/
        #atten_click{
            /* background-color: antiquewhite; */
            width: 925px;
            height: 100px;
            position: absolute;/*출석판 위 출석하기 정렬 2단계*/
            left: 50%;
            top: 90.5%;
            transform: translate(-50%,-50%);/*출석판 위 출석하기 정렬 3단계*/
        }
        #atten_click_btn{
            width: 100%;
            height: 100%;
            cursor: pointer;
            opacity: 0; /*투명도*/
        }
        #atten_click_btn:hover{
            opacity: 0.2;
        }
        </style>
</head>
<body>
	<%@include file = "../common/header.jsp" %>
        <div id="content">
            <img id="attendance_img" src="resources/출석체크4.png" alt="">
            <div id="attendance_mark">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 34.7%; left: 26.3%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 34.7%; left: 35.7%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 34.7%; left: 45.1%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 34.7%; left: 54.5%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 34.7%; left: 63.9%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/도장_완3.png" alt=""
                     style="position: absolute; width: 285px; height: 95px; top: 35.6%; left: 79.6%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 40%; left: 26.3%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 40%; left: 35.7%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 40%; left: 45.1%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 40%; left: 54.5%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 40%; left: 63.9%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/도장_완3.png" alt=""
                     style="position: absolute; width: 285px; height: 95px; top: 41%; left: 79.6%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 45.3%; left: 26.3%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 45.3%; left: 35.7%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 45.3%; left: 45.1%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 45.3%; left: 54.5%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 45.3%; left: 63.9%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/도장_완3.png" alt=""
                     style="position: absolute; width: 285px; height: 95px; top: 46.2%; left: 79.6%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 50.6%; left: 26.3%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 50.6%; left: 35.7%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 50.6%; left: 45.1%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 50.6%; left: 54.5%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 50.6%; left: 63.9%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/도장_완3.png" alt=""
                     style="position: absolute; width: 285px; height: 95px; top: 51.6%; left: 79.6%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 55.9%; left: 26.3%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 55.9%; left: 35.7%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 55.9%; left: 45.1%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 55.9%; left: 54.5%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 55.9%; left: 63.9%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/도장_완3.png" alt=""
                     style="position: absolute; width: 285px; height: 95px; top: 56.8%; left: 79.6%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 61.2%; left: 26.3%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 61.2%; left: 35.7%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 61.2%; left: 45.1%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 61.2%; left: 54.5%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/출석체크 마크.png" alt=""
                     style="position: absolute; width: 115px; height: 80px; top: 61.2%; left: 63.9%; transform: translate(-50%,-50%); visibility: hidden;">
                <img src="resources/도장_완3.png" alt=""
                     style="position: absolute; width: 285px; height: 95px; top: 62.1%; left: 79.6%; transform: translate(-50%,-50%); visibility: hidden;">
            </div>
            <div id="atten_click">
                <button id="atten_click_btn" onclick="attendanceChk()"></button>
            </div>
            <input type="hidden" value="">
        </div>
        
        <script>
        	
        	<%if(loginUser==null){%> //로그인 안했으면

        		$(function(){//로그인한 회원만 화면 보여주기
        		alert("로그인이 필요한 서비스입니다.");
        		location.href="<%=contextPath%>/logform.me";
        	});
        	
        	<%}else {%>//로그인 했으면
        		
        	$(function(){//각 회원들의 출석체크일 출력
        			$.ajax({
        				url : "atdate.me",
        				data : {memberNo : <%=loginUser.getMemberNo()%>},
        				type : "get",
        				success : function(count){//페이지 로딩시 회원들의 출석체크일 출력하기
        					//console.log(count);
        					var img = document.getElementsByTagName("img");
        					var count2 = parseInt(count)-2;
        					//console.log(count2);
        					
        					for(var i=0; i<count2; i++){
        						if(img[i+3].style.visibility=="hidden"){
        							img[i+3].style.visibility="visible"
        						}
        					}
        				}
        			});
        		});
	        
        	function attendanceChk() {
        		$.ajax({
					url : "atdateOX.me",
					data : {userNo:<%=loginUser.getMemberNo()%>},
					type : "post",
					success: function(result){
						$("input[type=hidden]").val(result);
						console.log($("input[type=hidden]").val());

						if ($("input[type=hidden]").val() == 1) {
		        			attendance();
						}else if($("input[type=hidden]").val() == 0){
							alert("오늘은 이미 출석체크를 하셨습니다.");
							$("#atten_click_btn").attr("disabled", true);
						}
					},
					error : function(result){
						console.log("통신실패");
					}
				});
			}
        	
        	function attendance(){//도장일 업데이트 및 적립금 더해주기
        		
        		/* attendanceChk(); */
	            /*도장변수에 담기.. img 인덱스 3~38번까지임*/
	            var img = document.getElementsByTagName("img");
	            var index = 0;
	            //console.log(img);
	
            	//하루에 한번으로 막기
            	var today = new Date();
            	
            	var year = today.getFullYear();
            	var month = ('0'+(today.getMonth()+1)).slice(-2);
            	var day = today.getDate();
            	
            	var dateString = year+month+day; //오늘 날짜 담기
            	//console.log(dateString);

            	var nextday = parseInt(today.getDate())+1;
            	
            	var nextdateString = year+month+nextday;  //오늘 날짜 +1
            	//console.log(nextdateString);
            	
            	dateString = parseInt(dateString)+1;
            	var atCheck = $("input[type=hidden]").val();
            	console.log(atCheck);
            	//console.log($("input[type=hidden]").val());
            	
	            $(function(){
		        	if(dateString==nextdateString){
		        		//$("#atten_click_btn").attr("disabled", true);
		        		//alert("오늘은 이미 출석체크를 하셨습니다.");
		        	}
		        });
            	//alert("아무거나");
	            for(var i=3;i<39;i++){//클릭시 도장 보이기
	                if(img[i].style.visibility=="hidden"){//visibility가 hidden일시 도장 보이도록
				         img[i].style.visibility="visible"
						 alert("출석이 완료되었습니다. 내일 또 도전해주세요!");
	                
				         $(function(){//출석체크일 db에 +1진행
		                		$.ajax({
		                			url : "attendance.v",
		                			type: "post",
		                			data : {memberNo : <%=loginUser.getMemberNo()%>},
		                			success : function(){
		                			}
		                		});
		                	});
	                	
	                	if((i==7 || i==13 || i==19 || i==25 || i==31 || i==37)){ /* 출첵5회시마다 적립금 300 쏴주기 */
	                        index = i;
	                        //console.log(index);                    
	                        
		                	$(function(){//적립금 300원 주기
		                		$.ajax({
		                			url : "upPoint.me",
		                			data : {memberNo : <%=loginUser.getMemberNo()%>,
		                					addP : 300},
		                			type : "post",
		                			success : function(){
		                				//console.log("성공");
		                				alert("5번의 출석체크로 300원의 적립금이 지급되었습니다.");
				                        img[index+1].style.visibility="visible"
				                        
				                        	$(function(){//도장도 하나 더 찍어주기
						                		$.ajax({
						                			url : "attendance.v",
						                			type: "post",
						                			data : {memberNo : <%=loginUser.getMemberNo()%>},
						                			success : function(){
						                			}
						                		});
						                	});
		                			}
		                		});
		                	});
			                //출석체크 도장 다 찍으면 출석일 다시 0으로 돌리기
			               if(img[37].style.visibility=="visible"){
		            			alert("다 찍음~!!");
		            			
		            			$.ajax({
		            				url : "atdate.me",
		            				data : {memberNo : <%=loginUser.getMemberNo()%>},
		            				type : "post",
		            				success : function(){//회원들의 출석체크일
		            					console.log("출석체크 되돌림")
		            				},
		            				complete : function(){
		            					console.log("출석체크 되돌림 실행만 됨..")
		            				}
		            			});
		            			
		            		}
	                        break;
	                    }
	                	break;
	                }
	            }
	        }
        	
        	
        	<%}%>
        </script>
        
     <%@include file = "../common/footer.jsp" %>
</body>
</html>