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
section {
	width:1100px;
	margin:auto;
}
#gibon {
	font-size:12px;
	border:2px solid #2E9AFE;
	background:#2E9AFE;
	color:white;
	width:10px;
	border-radius:6px;
}
</style>
<script>
function changePhone() {
	var phone = document.getElementById("myphone").value;
	var cyd = new XMLHttpRequest();
	cyd.onload = function() {
		alert(cyd.responseText);
	}
	cyd.open("GET","chgPhone?phone="+phone);
	cyd.send();
}

function baeOpen() {
	/* window. */open("baelist","","width=500,height=600"); //view,target이름,브라우저 설정(크기)
}
</script>
</head>
<body>
<section>
<h2 align="left"> 주문 결제</h2>
<!-- 구매자정보 -->
<table width="1000" align="center">
  <caption><h3 align="left">구매자 정보</h3></caption>
    <tr>
      <td>이 름</td>
      <td>${mvo.name}</td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>${mvo.email}</td>
 	</tr>
    <tr>
      <td>전화번호</td>
      <td>
      	<input type="text" value="${mvo.phone}" id="myphone">
      	<input type="button" value="변경" onclick="changePhone()">
      </td>
    </tr>
</table>
<!-- 구매자정보 끝 -->
<!-- 배송지정보 -->
<table width="1000" align="center">
  <caption><h3 align="left">배송지 정보
  			<c:if test="${bvo==null}">
  				<span style="color:blue;font-size:14px;">등록된 기본배송지가 없거나 등록된 주소가 없습니다.</span>
  			</c:if>
  			 <input type="button" value="배송지 추가/변경" onclick="baeOpen()">
  		   </h3></caption>
    <tr>
      <td>이 름</td>
      <td class="name">${bvo.name}
	      <c:if test="${bvo.gibon==1}">
	      		<span id="gibon">기본배송지</span>
	      </c:if>
      </td>
    </tr>
    <tr>
      <td>주소</td>
      <td class="juso">${bvo.juso}</td>
 	</tr>
    <tr>
      <td>전화번호</td>
      <td class="phone">${bvo.phone}</td>
    </tr>
    <tr>
      <td>요청사항</td>
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
</table> <!-- 배송지정보 끝 -->
<!-- 구매상품정보 -->
<table width="1100" align="center">
	<caption> <h3>배송 정보</h3> </caption>
		<tr> <!-- 배송 예정일 -->
			<td colspan="2">
				${bpvo.}
			</td>
		</tr>
		<tr> <!-- 상품 정보 -->
			<td></td>
			<td></td>
		</tr>
</table>
<!-- 구매상품정보 끝 -->
<!-- 결제 정보 -->
<!-- 결제 정보 끝 -->
</section>
</body>
</html>