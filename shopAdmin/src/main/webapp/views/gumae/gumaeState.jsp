<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	position:relative;
}
section #layer {
	position:absolute;
	visibility: hidden;
	border: 1px solid red;
	width:200px;
	height:60px;
	z-index: 1;
	background: white;
}
</style>
<script>
function getProduct(pcode) {
 	var x = event.pageX;
 	var y = event.pageY;
	var chk = new XMLHttpRequest();
	chk.onload = function() {
		
		var data=JSON.parse(chk.responseText);
		document.getElementById("layer").style.visibility="visible";
		document.getElementById("layer").style.left=x+"px";
		document.getElementById("layer").style.top=y+"px";
		document.getElementById("layer").innerText= data.title;
		
	}
	chk.open("GET","getProduct?pcode="+pcode);
	chk.send();
}
function getBaesong(no) {
	var x = event.pageX;
 	var y = event.pageY;
	var chk = new XMLHttpRequest();
	chk.onload =  function() {
		var data = JSON.parse(chk.responseText);
		// var juso = data.juso.substring(0,data.juso.indexOf(" "));
		var juso = data.juso.split(" ");
		document.getElementById("layer").style.visibility="visible";
		document.getElementById("layer").style.left=x+"px";
		document.getElementById("layer").style.top=y+"px";
		document.getElementById("layer").innerText= juso[0];
	}
	chk.open("GET","getBaesong?no="+no);
	chk.send();
}
</script>
</head>
<body>
<section>
<div id="layer">
	<div></div>
</div>
	<table width="1000" align="center">
		<caption><h3>구매내역</h3></caption>
			<tr>
				<td>상품코드</td>
				<td>구매자</td>
				<td>결제금액</td>
				<td>수량</td>
				<td>주문일</td>
				<td>배송상태</td>
			</tr>
		<c:forEach items="${glist}" var="gvo">	
			<tr>
				<td onclick="getProduct('${gvo.pcode}')" style="cursor:pointer">${gvo.pcode}</td>
				<td id="userid" onclick="getBaesong('${gvo.baeno}')" style="cursor:pointer">${gvo.userid}</td>
				<td>${gvo.chongprice}</td>
				<td>${gvo.su}</td>
				<td>${gvo.writeday}</td>
				<td>
					<c:choose>
						<c:when test="${gvo.state==0}">
						결제완료
						</c:when>
						<c:when test="${gvo.state==1}">
						배송중
						</c:when>
						<c:when test="${gvo.state==2}">
						배송완료
						</c:when>
						<c:when test="${gvo.state==3}">
						취소신청
						</c:when>
						<c:when test="${gvo.state==4}">
						취소완료
						</c:when>
						<c:when test="${gvo.state==5}">
						교환신청	
						</c:when>
						<c:when test="${gvo.state==6}">
						교환완료
						</c:when>
						<c:when test="${gvo.state==7}">
						반품신청
						</c:when>
						<c:when test="${gvo.state==8}">
						반품완료
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:if test="${gvo.state!=0}">
					<input type="button" value="배송중" disabled>
					</c:if>
					<c:if test="${gvo.state==0}">
					<input type="button" value="배송중" onclick="location='stateChange?state=1&no=${gvo.no}'">
					</c:if>
					<c:if test="${gvo.state!=1}">
					<input type="button" value="배송완료" disabled>
					</c:if>
					<c:if test="${gvo.state==1}">
					<input type="button" value="배송완료" onclick="location='stateChange?state=2&no=${gvo.no}'">
					</c:if>
					<c:if test="${!(gvo.state==3 || gvo.state==5 || gvo.state==7)}">
					<input type="button" value="취소완료" disabled>
					</c:if>
					<c:if test="${gvo.state==3 || gvo.state==5 || gvo.state==7}">
						<c:if test="${gvo.state==3 }"> <!-- state가 3일때 취소신청 -> 4 -->
							<c:set var="aa" value="4"/>
							<c:set var="bb" value="취소"/>
						</c:if>
						<c:if test="${gvo.state==5 }"> <!-- state가 5일때 교환신청 => 6 -->
							<c:set var="aa" value="6"/>
							<c:set var="bb" value="교환"/>
						</c:if>
						<c:if test="${gvo.state==7 }"> <!-- state가 7인경우 반품신청 => 8 -->
							<c:set var="aa" value="7"/>
							<c:set var="bb" value="반품"/>
						</c:if>
							<input type="button" value="취소승인" onclick="location='stateChange?state=${aa}&no=${gvo.no}'">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>