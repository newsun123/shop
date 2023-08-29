<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<h2>주문완료</h2>
	<div>주문이 완료되었습니다. 감사합니다.</div>
	<table width="1100" align="center">
		<caption><h3>상품 배송정보</h3></caption>
		<tr>
			<td>${pvo.writeday}(${pvo.yoil})도착 예정(상품 1개)</td>
		</tr>
		<tr>
			<td><img src="/static/pro/${pvo.pimg}" width="100"></td>
		</tr>
		<tr>
			<td>
				${pvo.title}<p>
				${pvo.price}원<p>
				구매수량: ${gvo.su}개<p>
			</td>
		</tr>
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
			<td>${pvo.price}원(할인율:${pvo.halin}%)</td>
		</tr>
		<tr>
			<td>받는 주소</td>
			<td>(${bvo.zip}) ${bvo.juso}, ${bvo.jusoEct}</td>
			<td>변경하기</td>
			<td>배송비</td>
			<td>${pvo.bprice}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${bvo.phone}</td>
			<td>변경하기</td>
			<td>결제금액</td>
			<td>${gvo.chongprice}원</td>
		</tr>
	</table>
</section>
</body>
</html>