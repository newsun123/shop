<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section h2 {
	width:1100px;
	margin:auto;
}
section table {
	width:1100px;
	margin:auto;
	margin-top:40px;
}
</style>
</head>
<body>
<section>
	<table>
		<h2>회원 관리</h2>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>등급</td>
				<td>상태</td>
				<td>가입일</td>
			</tr>
		<c:forEach items="${mlist}" var="mvo">
			<tr>
				<td>${mvo.userid }</td>
				<td>${mvo.name }</td>
				<td>${mvo.phone}</td>
				<td>${mvo.email}</td>
				<td>
				<c:if test="${mvo.level ==0 }">
				Bronze
				</c:if>
				<c:if test="${mvo.level >= 30 }">
				Silver
				</c:if>
				<c:if test="${mvo.level >= 60 }">
				Platinum
				</c:if>
				<c:if test="${mvo.level >= 90 }">
				Diamond
				</c:if>
				</td>
				<td>
					<c:if test="${mvo.state==0}">
					정상회원
					</c:if>
					<c:if test="${mvo.state==1}">
					<a href="memberout?no=${mvo.no}">탈퇴 신청 중</a> 
					</c:if>
					<c:if test="${mvo.state==2}">
					탈퇴회원
					</c:if>
				</td>
				<td>${mvo.writeday}</td>
			</tr>		
		</c:forEach>
	</table>
</section>
</body>
</html>