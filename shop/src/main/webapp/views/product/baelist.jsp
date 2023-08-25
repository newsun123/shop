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
#chuga {
	width:96%;
	height:40px;
	line-height:40px;
	text-align:center;
	border:3px solid #80FF00;
	font-size:18px;
	margin:auto;
	
}
table {
	width:500px;
	border:1px solid #ccc;	
}
table tr {
	height:30px;

}
table td {
	border:1px solid #ccc;
	outline:none;
}
</style>
<script>

</script>
</head>
<body>
<div id="top">배송지 선택</div>
	<c:if test="${blist.size()==0}">
		<div align="center" style="margin-bottom:20px;">배송주소가 없습니다.</div>
	</c:if>
<c:forEach items="${blist}" var="bvo">
<table>
    <tr>
      <td align="center">이 름</td>
      <td>${bvo.name}</td>
    </tr>
    <tr>
      <td align="center">주소</td>
      <td>(${bvo.zip}) ${bvo.juso},${bvo.jusoEct}</td>
    </tr>
    <tr>
      <td align="center">전화번호</td>
      <td>${bvo.phone} </td>
    </tr>
</table>
</c:forEach>
<div id="chuga" onclick="location='baeWrite'">배송지 추가</div>
</body>
</html>