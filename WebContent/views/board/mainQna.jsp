<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.semi.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	
		 div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
       
        /*===============================================================================*/
        /*높이 자동*/
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
       
        /*===============================================================================*/
        /*높이 자동*/
        #content{
            width: 1180px;
            /*background-color: rgb(240, 240, 240);*/
            height: 800px;
            margin: auto;
            /* justify-content: center; */
            position: relative;
        }
        /*높이 자동*/
        #re_con{
            width: 1050px;
            height: 660px;
            background-color: white;
            margin: auto;
            position: absolute;
            top: 6%;
            /* bottom: 7%; */
            left: 50%;
            margin-left: -44%;
            
            /* margin-top: -10%; */
            /* vertical-align: auto; */
            
            /* margin: 100px 100px 100px 100px; */
            /* margin: 50px; */
        }
        /*높이 자동*/
        #real_con{
            width: 950px;
            /* height: 500px; */
            position: absolute;
            top: 6%;
            left: 50%;
            margin-left: -45%;
            /* background-color: aqua; */
            /* border: 1px solid red; */
        }
        #re_co_text{
            width: 100%;
            height: 50px;
            /* background-color: aqua; */
            border-bottom-style: solid;
            border-bottom-color: rgb(219, 218, 218);
            border-bottom-width: 2px;
        }
        #re_co_text>*{
            float: left;
        }
        #re_co_text_img{
            height: 90%;
            width: 6%;
            /* background-color: blue; */
        }
        #re_co_text_1{
            height: 100%;
            width: 94%;
            /* background-color: blueviolet; */
            font-weight: 550;
            font-size: 30px;
            
        }
        #re_co_2{
            height: 40px;
            width: 100%;
            /* background-color: blue; */
        }
        #re_co_table{
            /* background-color: aqua; */
            width: 100%;
            height: 470px;
            border-top-style: solid;
            border-top-color: rgb(163, 163, 163);
            border-top-width: 1px;
        }
        #re_co_table_1{
            width: 100%;
            height: 18%;
            /* background-color: antiquewhite; */
            font-weight: 600;
            font-size: 16px;
            line-height: 85px;
            border-bottom-style: solid;
            border-bottom-color: rgb(163, 163, 163);
            border-bottom-width: 1px;
        }
        #re_co_table_1 input{
            height: 40px;
            width: 775px;
            border: 1px solid rgb(196, 196, 196);
        }
        #re_co_table_2{
            width: 100%;
            height: 62%;
            /* background-color: blueviolet; */
        }
        #re_co_table_2>*{
            float: left;
        }
        #re_co_table_2>div{
            font-weight: 600;
            font-size: 16px;
        }
        #reco_1{
            line-height: 270px;
        }
        #reco_2{
            height: 230px;
            width: 82%;
            line-height: 510px;
            
        }
        #re_co_table_3{
            width: 100%;
            height: 20%;
            /* background-color: rgb(136, 125, 146); */
            border-top-style: solid;
            border-top-color: rgb(163, 163, 163);
            border-top-width: 1px;
        }
        #re_co_table_3 button{
            float: right;
            height: 48px;
            width: 80px;
            margin: 8px;
            position: relative;
            top: 40px;
            border-radius: 8px;
            border: 1px solid rgb(153, 153, 153);
            font-weight: 600;
        }
	
	</style>

</head>
<body>
	
	<%@include file = "../common/header.jsp" %>
	
	 <div id="content">
        <form action="<%=contextPath %>/qna.in" method="get">

            <div id="re_con">
                <div id="real_con">
                    <div id="re_co_text">
                        <div id="re_co_text_img">
                            <img src="<%=contextPath %>/resources/qna0429.png" style="height: 100%; width: 100%;" alt="">
                    </div>
                    <div id="re_co_text_1">&nbsp;&nbsp;1:1 질문</div>
                </div>
                <div id="re_co_2"></div>
                <div id="re_co_table">
                    <div id="re_co_table_1">
                        &nbsp;&nbsp;&nbsp;&nbsp;문의 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="boardTitle">
                    </div>
                    <div id="re_co_table_2">
                        <div id="reco_1">&nbsp;&nbsp;&nbsp;&nbsp;문의 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div id="reco_2">
                            <textarea name="boardContent" id="" cols="30" rows="10" style=" outline: none; resize: none; width: 100%; height: 100%; border: 1px solid rgb(170, 170, 170);"></textarea>
                        <input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo()%>">
                        </div>
                    </div>
                    <div id="re_co_table_3">
                        <button type="submit" style="background-color: rgb(15, 15, 167); color: white;">등록</button>
                        <button type="reset" style="background-color: white; color: rgb(56, 56, 56);">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    </div>
	
	<%@include file ="../common/footer.jsp" %>
	
</body>
</html>