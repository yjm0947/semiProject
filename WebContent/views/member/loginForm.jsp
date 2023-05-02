<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="com.semi.member.model.vo.Member"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        *{
       	font-size:13px;
       	font-weight:400px;
        
        }
        
        
        
        html,body{
        box-sizing:border-box;
        overflow:auto;
        }
        
        
        *:focus{
        outline: 2px solid  rgb(11, 95, 221);
        
    }
    
	.outer{
/* 	//line-height: 1.5em; */
        width: 1400px;
        /* border: 3px solid darkgray; */
        margin: auto;
        padding: 0 20px;
         margin-bottom: 20px; */
        height: 95%;
        margin-top: 20px;
        
	}
	
	.loginBox{
        padding-top: 30px;
        padding-bottom: 20px;
        width: 900px;
        margin: 30px auto;
        border: 3px solid #2c7dc9;
        border-radius: 50px;
        display: flex;
        flex-direction: column;   
        align-items: center;
        /* justify-content: center; */
        
        
        /* vertical-align: top; */
    }
   .outer button:not([type=submit]){
        /* margin: auto; */
        /* flex: 1; */
        padding: 20px;
        margin-bottom: 16px;
        width: 500px;
        /* font-size: x-large; */
        border-radius:30px;
    }
    .loginBox>input{
        width: 500px;
        padding: 30px;
        margin-bottom: 16px;
        margin-top: 0;
        border-radius:30px;
    }
     a{
        text-decoration: none;
        color: #222;
    }

    #memberPwd{
    background:url(./images/images2/icon-01.png) no-repeat center right 15px;
    background-size: 20px;
    background-color: #fff;
}
	
	.foot{
        padding: 50px;
        margin: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 8px;
    }
    
    .outer .btn{
     border-radius : 35px;
     font-size:large;
     font-weight : 400px;
     
    
    }
  
	
	:disable{
	color:'red';
	background-color:crimson;
	
	}
	
 
    
    
    </style>
  
    <title>회원가입</title>
 
</head>
<body>
	
<script src="https://accounts.google.com/gsi/client" async defer></script>	
	<%@ include file = "../common/header.jsp" %>
    <div class="outer">
	
        <form action="<%=contextPath%>/login.me" method="post" id="form">
          <div class="loginBox">
            <input type="text" name="memberId" placeholder="아이디를 입력해주세요">
            <input type="password" name="memberPwd" id="memberPwd" placeholder="비밀번호를 입력해주세요">
            <button type="submit" class="btn btn-primary" id="loginBtn" style="padding:20px; margin-bottom: 16px; width: 500px;">로그인</button>


				
			<!--sns로그인연동       <a id="naverIdLogin" href="javascript:void(0)">
			        			<img alt="" src="">
			      </a>
			
				<span onclick="naverLogout(); return false;">
			      <a href="javascript:void(0)">
			          <span>네이버 로그아웃</span>
			      </a>
				</span>
              카카오 로그인
      			 <div onclick="kakaoLogin();">
 		        	 <a href="javascript:void(0)">
      			<span><img src="resources/kakao_login_large_narrow.png"></span>
        		  	</a>
        		</div>
        		<div onclick="kakaoLogout();">
          <a href="javascript:void(0)">
              <span>카카오 로그아웃</span>
          	</a>
        	</div>
      			   <div id="g_id_onload"
						    data-client_id="AIzaSyCFc5nJ1ogPqKH_nFYJe3E-_GLCRLhKjV4"
						    data-callback="handleCredentialResponse"
						    data-auto_select="true"
						    data-login_uri="http://localhost:8888/SemiProject/">
           				 <div class="g_id_signin" data-shape ="pill" data-width="" data-size="x-large" data-theme="filled_black" data-text="파랑서점 Signinwith Google" data-type="standard" >
           				 </div>
					</div> -->
					
	         	  <strong><a href="<%=contextPath%>/searchid.me">아이디 </a> / <a href="<%=contextPath%>/searchpwd.me"> 비밀번호 찾기</a></strong>
	            
	            
          </div>
        
        </form>    

        <div class="foot">
              <button type="button" class ="btn btn-outline-primary" style="padding: 12px; " onclick="enrollPage();">회원가입</button>
              <button class="btn btn-outline-secondary" style="padding: 12px;">비회원 주문 조회</button>

	</div>
 </div>
 <!--카카오 로그인  -->
<%--  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
    Kakao.init('774a7908df1b6d2a60aaa424fa0bbff7'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인
    function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response) {
        	  
            Kakao.API.request({
              url: '/v2/user/me',
              success: function (response) {
                  console.log(response)
                  
                  alert("로그인 성공 : "+response.nickName);
                  location.href="<%=contextPath%>";
              },
              fail: function (error) {
                console.log(error);
                alert("카카오로그인 실패");
              },
            })
          },
          fail: function (error) {
            console.log(error)
            alert('카카오로그인 실패');
          },
        })
      }
    //카카오로그아웃  
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response)
                alert("카카오로그아웃 성공");
                	location.href="<%=contextPath%>";
            },
            fail: function (error) {
              console.log(error)
              alert("카카오 로그아웃 실패");
            },
          })
          Kakao.Auth.setAccessToken(undefined)
        }
      }  
    </script>  --%>
 
 
 
 
 <!--네이버 로그인  -->
 <%-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
 
  <script type="text/javascript">

  const naverLogin = new naver.LoginWithNaverId(
   {
    clientId: "KxCpwkE_YfRfjI6u2r3e",
    callbackUrl: "http://localhost:8888/SemiProject",
    loginButton: {color: "green", type: 3, height: 75
    	
    }
   	,isPopup : true
   	,callbackHandle : true
    }
   );
  naverLogin.init();

  window.addEventListener('load', function () {
  	naverLogin.getLoginStatus(function (status) {
  		if (status) {
  			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
      		
  			console.log(naverLogin.user); 
  			alert(email);
  			location.replace("<%=contextPath%>");
              if( email == undefined || email == null) {
  				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
  				naverLogin.reprompt();
  				return;
  			}
  		} else {
  			console.log("callback 처리에 실패하였습니다.");
  		}
  	});
  });


    var testPopUp;
    function openPopUp() {
        testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=500px,height=500px");
     
    }
    function closePopUp(){
        testPopUp.close();
    }

    function naverLogout() {
    	openPopUp();
    	setTimeout(function() {
    		closePopUp();
    		}, 1500);
    	location.replace("<%=contextPath%>");
                  alert:("로그인 성공 : "+response)
                  location.href="<%=contextPath%>";
              },
              fail: function (error) {
                console.log(error)
                alert("로그인 실패")
              },
            })
          },
          fail: function (error) {
            console.log(error)
          },
        })
      }
 </script>  --%>
<script>
$(document).ready(function(){

	$(".outer")
	   	.css('opacity',0)
		.slideDown(650 ,'swing' )
		.animate(
		{ opacity : 1 }
		,{ queue : false , duration : 900}
		);
});
    function enrollPage(){
		//location.href = "<%=contextPath%>/views/member/memberEnrollForm.jsp";
		//웹 애플리케이션의 디렉토리 구조가 그대로 url에 노출되어 보안에 취약해진다.
		//단순 페이지 이동이여도 servlet을 거쳐서 매핑값이 노출되어 갈수있도록 작업하기.
		
		location.href ="<%=contextPath%>/enrollForm.me";
		
	}
    </script>
    
            <!-- 최상위로 이동하는 버튼 top -->
            <input type="button" value="top" onclick='location.href="#"' class="btn btn-info" id="topbtn" 
            style="cursor:pointer; border-radius:50px; opacity:0.5;  
            display:inline-block; position:fixed; right:5px; bottom:10px; font-weight:700; font-size:16px; padding:10px; width:70px;">
        
       <%@ include file = "../common/footer.jsp"%>
</body>
</html>