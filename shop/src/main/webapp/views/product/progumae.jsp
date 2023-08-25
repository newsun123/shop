<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <td>${bvo.name}</td>
    </tr>
    <tr>
      <td>주소</td>
      <td>${bvo.juso}</td>
 	</tr>
    <tr>
      <td>전화번호</td>
      <td>${bvo.phone}</td>
    </tr>
    <tr>
      <td>요청사항</td>
      <td>${bvo.req}</td>
    </tr>
</table>
<!-- 배송지정보 끝 -->
<!-- 구매상품정보 -->
<!-- 구매상품정보 끝 -->
<!-- 결제 정보 -->
<!-- 결제 정보 끝 -->
</section>
</body>
</html>