<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin:0;
}
#top {
	left:0px;
	top:0px;
	width:100%;
	height:40px;
	line-height:40px;
	text-align:center;
	border-bottom: 2px solid #ccc;
	font-size: 20px;
	font-weight: 600;
}
table {
	width:500px;
	border-spacing: 0;
	margin-bottom: 10px;
}
table tr {
	height:30px;

}
table td {
	border:1px solid #ccc;
	outline:none;
}
#chuga {
    margin-top: 30px;
	width:96%;
	height:40px;
	line-height:40px;
    background: #2E9AFE;
    color: white;
    font-weight: 600;
    font-size: 17px;
    border: none;
    margin:auto;
    text-align: center;
    cursor: pointer;
}
#gibon {
	font-size:12px;
	border:2px solid #2E9AFE;
	background:#2E9AFE;
	color:white;
	width:10px;
	border-radius:6px;
}
input[type=button] {
	width: 110px;
    height: 30px;
    background: white;
    border: none;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
}
</style>
<script>
function move(n) {
	opener.document.getElementsByClassName("name")[0].innerHTML=document.getElementsByClassName("name")[n].innerHTML;
	opener.document.getElementsByClassName("juso")[0].innerText=document.getElementsByClassName("juso")[n].innerText;
	opener.document.getElementsByClassName("phone")[0].innerText=document.getElementsByClassName("phone")[n].innerText;
	opener.document.getElementsByClassName("req")[0].innerTextt=document.getElementsByClassName("req")[n].innerText;
	close();
}
</script>
</head>
<body>
<div id="top">배송지 선택</div>
	<c:if test="${blist.size()==0}">
		<div align="center" style="margin-bottom:20px;">배송주소가 없습니다.</div>
	</c:if>
<c:forEach items="${blist}" var="bvo" varStatus="sts">
<table>
    <tr>
      <td align="center">이 름</td>
      <td class="name">${bvo.name}
      	<c:if test="${bvo.gibon==1}">
      		<span id="gibon">기본배송지</span>
      	</c:if>
      </td>
    </tr>
    <tr>
      <td align="center">주소</td>
      <td class="juso">(${bvo.zip}) ${bvo.juso},${bvo.jusoEct}</td>
    </tr>
    <tr>
      <td align="center">전화번호</td>
      <td class="phone">${bvo.phone} </td>
    </tr>
    <tr>
      <td align="center">요청사항</td>
      <td class="req">
      	<c:if test="${bvo.req==0}">
      		문 앞
      	</c:if>
      	<c:if test="${bvo.req==1}">
      		직접 받고 부재시 문 앞
      	</c:if>
      	<c:if test="${bvo.req==2}">
      		경비실
      	</c:if>
      	<c:if test="${bvo.req==3}">
      		택배함
      	</c:if>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center" style="border:none;">
        <input type="button" value="수정">
        <input type="button" value="선택" onclick="move(${sts.index})">
      </td>
    </tr>
</table>
</c:forEach>
<div id="chuga" onclick="location='baeWrite'">배송지 추가</div>
</body>
</html>