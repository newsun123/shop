<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#qForm {
	position:absolute;
	visibility:hidden;
}
#qForm textarea {
	width:300px;
	height:120px;
}
</style>
<script>
function questOk(title,pcode,grp) {
	document.qForm.title.value=title;
	document.qForm.pcode.value=pcode;
	document.qForm.grp.value=grp;
	
	document.getElementById("qForm").style.visibility="visible";
	var x = event.clientX;
	var y = event.clientY;
	document.getElementById("qForm").style.left=(x-400)+"px";
	document.getElementById("qForm").style.top=(y-60)+"px";
}
function close() {
	document.getElementById("qForm").style.visibility="hidden";
}
</script>
</head>
<body>
<section>
<h2>상품평</h2>
	<table width="1000" align="center">
		<tr>
			<th>문의자</th>
			<th>상품명</th>
			<th>문의분류</th>
			<th>문의내용</th>
			<th>등록일</th>
			<th>답변달기</th>
		</tr>
		<c:forEach items="${mapall }" var="map">
			<c:set var="bb" value=""/>
		<c:if test="${map.seq==1}">
			<c:set var="bb" value="style='backgrounde:#eee'"/>
		</c:if>
		<c:if test="${map.title==0}"> 
			<c:set var="title" value="상품관련"/>
		</c:if>
		<c:if test="${map.title==1}"> 
			<c:set var="title" value="결제관련"/>
		</c:if>
		<c:if test="${map.title==2}"> 
			<c:set var="title" value="배송관련"/>
		</c:if>
		<c:if test="${map.title==3}"> 
			<c:set var="title" value="그 외"/>
		</c:if>
		<tr ${bb}>
			<td> ${map.userid} </td>
			<td> ${map.ptitle} </td>
			<td> ${title} </td>
			<td> <div class="cont"> ${map.content} </div> </td>
			<td> ${map.writeday} </td>
			
				<c:if test="${map.seq==0 and map.cnt==0}">
				<td onclick="questOk(${map.title},'${map.pcode}','${map.grp}')">click</td>
				</c:if>
				<c:if test="${map.seq==0 || map.cnt==1}">
				<td></td>
				</c:if>
		</tr>
		</c:forEach>
	</table>
	<h2>1:1문의</h2>
	<table width="800" align="center">
		<tr>
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
			<th>방법</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${mlist }" var="mvo">
		<tr align="center">
			<td>${mvo.userid }</td>
			<td>${mvo.title }</td>
			<td style="text-align:left;"><div>${mvo.content }</div></td>
			<td>
			<c:if test="${mvo.answer==1}">
				전화번호
			</c:if>
			<c:if test="${mvo.answer==2}">
				이메일
			</c:if>
			<c:if test="${mvo.answer==3}">
				<a href="javascript:mtm">홈페이지</a>	
			</c:if>
			</td>
			<td>${mvo.writeday }</td>
		</tr>
		</c:forEach>
	</table>
	<div id="qForm">
	<form method="post" action="questOk" name="qForm">
		<input type="hidden" name="title">
		<input type="hidden" name="pcode">
		<input type="hidden" name="grp">
		<textarea name="content"></textarea><p>
		<input type="submit" value="답변 달기">
		<input type="button" value="닫기" onclick="close()">
	</form>
	</div>
	<div id="mform">
	<form method="post" action="mtmOk">
	
	</form>
	</div>
</section>
</body>
</html>