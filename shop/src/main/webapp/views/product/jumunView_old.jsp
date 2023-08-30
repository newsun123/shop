<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<h2 align="center">주문완료</h2>
	<div align="center">주문이 완료되었습니다. 감사합니다.</div>
	<table width="1100" align="center">
		<caption><h3>상품 배송정보</h3></caption>
		<c:set var="happrice" value="0"/>
     	<c:set var="baeprice" value="0"/>
		<c:forEach items="${plist}" var="pvo">
			<tr>  
				<td colspan="2">
					${pvo.writeday}(${pvo.yoil})도착 예정(상품 1개)
				</td>
			</tr>
			<tr>
				<td><img src="/static/pro/${pvo.pimg}" width="100"></td>
			</tr>
			<tr>
				<td>
					${pvo.title}<p>
					<fmt:formatNumber value="${pvo.price}"/>원 <span id="chg">(할인율 : ${pvo.halin}%) </span> <p>
					구매수량: ${pvo.su}개<p>
				</td>
			</tr>
		<c:set var="happrice" value="${happrice+pvo.price}"/>
		<c:set var="baeprice" value="${baeprice+pvo.bprice}"/>	
		</c:forEach>
	</table>
<!-- 받는 사람과 결제정보 테이블 -->
	<table width="1100" align="center">
		<tr>
			<td colspan="3">받는사람 정보</td>
			<td colspan="2">결제 정보</td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<td>${bvo.name}/${bvo.phone}</td>
			<td></td>
			<td>주문금액</td>
			<td>
				<fmt:formatNumber value="${happrice}"/>원 <br>
			</td>
		</tr>
		<tr>
			<td>받는 주소</td>
			<td>(${bvo.zip}) ${bvo.juso}, ${bvo.jusoEct}</td>
			<td>변경하기</td>
			<td>배송비</td>
			<td><fmt:formatNumber value="${baeprice}"/>원</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${bvo.phone}</td>
			<td>변경하기</td>
			<td>결제금액</td>
			<td><fmt:formatNumber value="${happrice+baeprice}"/>원</td>
		</tr>
	</table>
	<div id="bottom">
      <input type="button" value="주문 내역보기">
      <input type="button" value="계속 쇼핑하기" onclick="location='../main/main'">
    </div>
</section>
</body>
</html>