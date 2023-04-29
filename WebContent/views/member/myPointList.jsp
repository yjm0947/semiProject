<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.wrap{
	    
	    width: 1400px;
	    margin: auto;
	}
	#content{
	    width: 100%;
	    margin-top: 20px;
	}
	/*--------------나의 쿠폰 상세 조회 영역-----------------*/
    #my_point{
        margin: 50px 0px 0px 30px;
        box-sizing: border-box;
    }
    #my_point h2{
        margin: 0px 0px 10px 0px;
    }

    #my_point div{
        margin: 0px 30px 0px 0px;
        padding: 10px;
    }

    #my_point table {
        border-collapse: collapse;
        border-left: 0;
        border-right: 0;
        width: 100%;
        margin: auto;
        line-height: 2;
    }
    #my_point table th{
        background-color: lightblue;
    }
    #my_point table th, table td {
        text-align: center;
        border: 1px solid gray;
    }
    #my_point table th:first-child, table td:first-child {
        border-left: 0;
    }
    #my_point table th:last-child, table td:last-child {
        border-right: 0;
    }
    #my_point td{
        cursor: pointer;
    }
    #non_point{
        height: 200px;
        margin: 0px 30px 0px 0px;
        padding: 10px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        display: flex;
    }
    #non_detail{
        text-align: center;
        margin: auto;
    }
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<%@ include file = "../common/myInfo.jsp" %>
	
	<div class="wrap">
		<div id="content">
			<div id="c_1">
				<div id="my_point">
			     	<h2>나의 적립금</h2>
				     <!-- 보유 적립금 없을 때
				     <div id="non_point">
				         <div id="non_detail">
				             <h4>보유한 적립금이 없습니다.</h4>
				         </div>
				     </div>  -->
				     
				     <!-- 보유 적립금 있을 때 -->
				     <div>
				         <table border="1">
				         	<thead>
						         <tr>
						             <th colspan="2">적립날짜</th>
						             <th colspan="2">적립금 내역</th>
						             <th colspan="2">받은 적립금</th>
						             <th colspan="2">총 적립금</th>
					             </tr>
				             </thead>
				             <tbody>
					             <tr>
					                 <td colspan="2">2023/04/01</td>
					                 <td colspan="2">출석체크</td>
					                 <td colspan="2">100 <b>P</b></td>
				                 	 <td colspan="2">100 <b>P</b></td>
					            </tr>
				             </tbody>
						</table>
				    </div>
				 </div>	
			</div>
		</div>
	</div>
	
	 
	<%@ include file = "../common/myPageCate.jsp" %>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>