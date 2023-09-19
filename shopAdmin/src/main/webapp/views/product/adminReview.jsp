<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function reviewDel(no) {
		var cyd = new XMLHttpRequest();
		cyd.onload = function()	 {
			// alert(cyd.responseText);
			location.reload();
		}
		cyd.open("GET","reviewDel?no="+no);
		cyd.send();
	}
</script>
</head>
<body>
<section>
	<table width="800" align="center">
		<tr>
			<td>사용자</td>
			<td>별점</td>
			<td>한줄요약</td>
			<td>내용</td>
			<td>신고건수</td>
			<td>등록일</td>
			<td>삭제</td>
		</tr>
		<c:forEach items="${rlist}" var="rvo">
		<tr>
			<td>${rvo.userid}</td>
			<td>${rvo.star}</td>
			<td>${rvo.title}</td>
			<td>${rvo.content}</td>
			<td>${rvo.singo}건</td>
			<td>${rvo.writeday}</td>
			<td><a href="javascript:reviewDel(${rvo.no})">click</a></td>
		</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>