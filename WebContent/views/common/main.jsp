<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    
    <style>
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
        
        /*-----------------콘텐츠------------------------*/
        /*배너------------------------------------------*/
        #banner{
            /* background-color: red; */
            height: 500px;
            width: 1300px;
            margin: auto;
            z-index: 0;
            position: relative;
        }
        #banner>img{
            /* background-color: aqua; */
            z-index: 0;
            width: 1250px;
            height: 430px;
            display: block;
            margin: auto;
            position: relative;
            top: 20px;
        }
        /*메인 콘텐츠 메뉴--------------------------------------*/
        #con_menu{
            /* background-color: aquamarine; */
            height: 80px;
            width: 1200px;
            margin: auto;
            text-align: center;
            font-weight: 500;
            cursor: default;
            font-size: 14px;
        }
        #con_new,#con_pro{
            height: 430px;
            width: 1200px;
            margin: auto;
            /* background-color: aqua; */
        }
        #con_menu>div{
            /* background-color: blue; */
            height: 100%;
            width: 65px;
            margin: 8px;
            position: relative;
            top: -10px;
            display:inline-block;
        }
        #con_menu button{
            border-color: rgb(252, 251, 251);
            background-color: white;
            display:flex;
            width: 65px;
            height: 60px;
            border-radius: 30px;
            cursor: pointer;
        }
        #con_menu button:hover{
            background-color: rgb(240, 238, 238);
        }
        #con_best{
            /* background-color: antiquewhite; */
            height: 430px;
            width: 1280px;
            margin: auto;
        }
        #con_bt{
            /* background-color: aqua; */
            width: 100%;
            height: 23%;
            text-align: center;
            padding : 28px 0;
            font-size: 35px;
            font-weight: 600;
            color: rgb(61, 60, 60);
            border-bottom-style: solid; /*푸터 상 선*/
            border-bottom-width: 1px;
            border-bottom-color: rgb(148, 146, 146);

        }
        #con_bi,#con_new_1,#con_pro_1{
            /* background-color: blue; */
            width: 100%;
            height: 74%;
        }
        #con_bi>div,#con_new_1>div,#con_pro_1>div{
            height: 100%;
            width: 25%;
            /* border: 1px solid red; */
            float: left;
        }
        #con_bi_1a{
            border: 1px solid rgb(215, 218, 215);
            height: 220px;
            width: 220px;
            margin: auto;
            position: relative;
            top: 20px;
        }
        #con_text{
            text-align: center;
            /* background-color: blue; */
            position: relative;
            top: 25px;
            height: 20px;
            width: 100%;
        }
        #con_text>div{
            padding: 1px;
        }
        #con_text_title,#con_pro_name,#con_new_name{
            font-size: 17px;
            font-weight: 600;
            color: rgb(66, 66, 66);
        }
        #con_text_author,#con_pro_pu,#con_new_pu{
            font-size: 14px;
            font-weight: 400;
            color: rgb(133, 131, 131);
        }
        #con_text_pri,#con_pro_pri,#con_new_pri{
            font-weight: 600;
            color: rgb(34, 34, 138);
        }
        
        a{
            text-decoration: none;
        }


    </style>
</head>
<body>


    <div id="content">
        <div id="banner" >
            <img  src="resources/mainbanner0429.jpg" alt="" style="position: relative; z-index: 3; cursor: pointer;">        	
        </div>
        <div id="con_menu">
            <div><button type="button" onclick="location.href='/SemiProject/book.new?currentPage=1'" ><img src="resources/메인new.png" alt="" style="width: 25px; height: 25px; margin: auto;"></button>신간</div>
            <div><button onclick="location.href='/SemiProject/book.be?currentPage=1'"><img src="resources/best.png" alt="" style="width: 32px; height: 33px; margin: auto;"></button>베스트</div>
            <div><button onclick="location.href='/SemiProject/attendance.v'" type="button" onclick="location.href='/SemiProject/attendance.v'"><img src="resources/stamp.png" alt="" style="width: 40px; height: 45px; margin: auto;"></button>출석체크</div>
            <div><button onclick="location.href='/SemiProject/map.co'"><img src="resources/location.png" alt="" style="width: 38px; height: 40px; margin: auto;"></button>매장찾기</div>
        </div>
        <div id="con_best">
            <div id="con_bt">
                베스트 셀러
            </div>
            <div id="con_bi">
                
            </div>
        </div>
        <div id="con_new">
            <div id="con_bt">
                화제의 신간
            </div>
            <div id="con_new_1">
                
            </div>
        </div>
        <div id="con_pro">
            <div id="con_bt">
		쇼핑
			</div>
			<div id="con_pro_1">
			
			</div>
        </div>
    </div>
    <pre>

    </pre>
      
      	<script>
      	
      	//배너 이미지 클릭시 해당 도서로 넘어가기
      	$(function(){
      		$("#banner>img").click(function(){
      			//console.log(this);
      			
      			location.href = "/SemiProject/book.de?pno=12"
      		});
      	});
      	
      	function img(){
      		$("#content").click(function(){
      			console.log(this);	
      		});
      	};
      	
      /* $(function(){//베스트도서 4개
      		$.ajax({
      			url : "main.be",
      			data : {currentPage : 1},
      			type : "post",
      			success : function(bestList){
      				
      				var result = "";
      				
      				for(var i in bestList){
  						result += '<div id="con_bi_1">'
		                      	+'<a href="/SemiProject/book.de?pno='+bestList[i].productNo+'">'
		                      +'<div id="con_bi_1a">'
		                          +'<img src="/SemiProject'+bestList[i].titleImg+'" alt="" id="con_pro_img" style="border: 1px solid rgb(204, 204, 204); height: 160px; width: 130px; display: block; margin: auto;'
		                                              +'position: relative; top: 25px;">'
		                      +'</div>'
		                      +'<div id="con_text">'
		                          +'<div id="con_new_name">'+bestList[i].productName+'</div>'
		                        +'<div>'
		                      		+'<div id="con_new_pu">'+bestList[i].productPublisher+'</div>'
		                    		+'</div>'
		                  		+'<div id="con_new_pri">'+Math.round((1-((bestList[i].productSalesRate)*0.01))*bestList[i].productPrice)+'원</div>'
		                      +'</div>'
		                        +'</a>'
		                  +'</div>'
						}
					$("#con_bi").html(result);
      			}
      		});
      	}); */
      	
      	$(function(){
  			$.ajax({
  				url : "main.nb", //신간 4개
  				type : "get",
  				success : function(newBook){
  					
  					var result = "";
  						
  					for(var i in newBook){
  						result += '<div id="con_bi_1">'
		      		                      	+'<a href="/SemiProject/book.de?pno='+newBook[i].productNo+'">'
		      		                      +'<div id="con_bi_1a">'
		      		                          +'<img src="/SemiProject'+newBook[i].titleImg+'" alt="" id="con_pro_img" style="border: 1px solid rgb(204, 204, 204); height: 160px; width: 130px; display: block; margin: auto;'
		      		                                              +'position: relative; top: 25px;">'
		      		                      +'</div>'
		      		                      +'<div id="con_text">'
		      		                          +'<div id="con_new_name">'+newBook[i].productName+'</div>'
		      		                        +'<div>'
		      		                      		+'<div id="con_new_pu">'+newBook[i].productPublisher+'</div>'
		      		                    		+'</div>'
		      		                  		+'<div id="con_new_pri">'+Math.round((1-((newBook[i].productSalesRate)*0.01))*newBook[i].productPrice)+'원</div>'
		      		                      +'</div>'
		      		                        +'</a>'
		      		                  +'</div>'
  					}
  					$("#con_new_1").html(result);
  				}
  			});
  		});
      	
      		$(function(){
      			$.ajax({
      				url : "main.new", //상품 4개
      				type : "get",
      				success : function(newPro){
      					
      					var result = "";
      						
      					for(var i in newPro){
      						
      						result += '<div id="con_bi_1">'
      										+'<a href="/SemiProject/book.de?pno='+newPro[i].productNo+'">'
			      		                      +'<div id="con_bi_1a">'
			      		                          +'<img src="/SemiProject'+newPro[i].titleImg+'" alt="" id="con_pro_img" style="border: 1px solid rgb(204, 204, 204); height: 160px; width: 130px; display: block; margin: auto;'
			      		                                              +'position: relative; top: 25px;">'
			      		                      +'</div>'
			      		                      +'<div id="con_text">'
			      		                          +'<div id="con_pro_name">'+newPro[i].productName+'</div>'
			      		                        +'<div>'
			      		                      		+'<div id="con_pro_pu">'+newPro[i].productPublisher+'</div>'
			      		                    		+'</div>'
			      		                  		+'<div id="con_pro_pri">'+Math.round((1-((newPro[i].productSalesRate)*0.01))*newPro[i].productPrice)+'원</div>'
			      		                      +'</div>'
			      		                    +'</a>'
			      		                  +'</div>'
      					}
      					$("#con_pro_1").html(result);
      				}
      			});
      		});
      	</script>
</body>