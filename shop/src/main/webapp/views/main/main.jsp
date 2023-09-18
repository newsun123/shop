<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		margin:auto;
	}
	#slideimg{
		width:100%;
		margin:auto;
	}
	#slideimg img{
		width:100%;
		display:block;
	}
	#newpro{
		width:1100px;
		height:300px;
		margin:auto;
		display: flex;
    	justify-content: space-evenly;
	}
	#best{
		width:1100px;
		height:300px;
		margin:auto;
		display: flex;
    	justify-content: space-evenly;
	}
	#sale{
		width:1100px;
		height:300px;
		margin:auto;
		display: flex;
    	justify-content: space-evenly;
	}
	#event{
		width:1100px;
		height:300px;
		margin:auto;
		display: flex;
    	justify-content: space-evenly;
	}
	section .pro {
		display: table-cell;
	}
	section .pro div {
		width:200px;
	}
	section h2 {
		width:1100px;
		margin:auto;
		margin-top:20px;
		padding-bottom:10px;
	}
</style>
</head>
<body>
	<section>
		<!-- 메인슬라이드 -->
		<div id="slideimg">
			<img src="/static/main/1.jpg">
		</div>
		<!-- 신규상품 -->
		<h2>신규 상품</h2>
		<div id="newpro">
		<c:forEach items="${newlist}" var="pvo">
			<div class="pro">
				<div><img src="/static/pro/${pvo.pimg}" width="200" height="200"></div>
				<div>${pvo.title}</div>
				<div>${pvo.price}</div>
			</div>
		</c:forEach>
		</div>
		<!-- 인기상품 -->
		<h2>인기 상품</h2>
		<div id="best">
		<c:forEach items="${bestlist}" var="bvo">
			<div class="pro">
				<div class="inner">
					<div><img src="/static/pro/${bvo.pimg}" width="200" height="200"></div>
					<div>${bvo.title}</div>
					<div>${bvo.price}</div>
				</div>
			</div>
		</c:forEach>
		</div>
		<!-- 특가상품 -->
		<h2>할인 상품</h2>
		<div id="sale">
		<c:forEach items="${salelist}" var="svo">
			<div class="pro">
				<div><img src="/static/pro/${svo.pimg}" width="200" height="200"></div>
				<div>${svo.title}</div>
				<div>${svo.price}</div>
			</div>
		</c:forEach>		
		</div>
		<!-- 이벤트 -->
		<h2>이벤트 상품</h2>
		<div id="event">
		<c:forEach items="${eventlist}" var="evo">
			<div class="pro">
				<div><img src="/static/pro/${evo.pimg}" width="200" height="200"></div>
				<div>${evo.title}</div>
				<div>${evo.price}</div>
			</div>
		</c:forEach>		
		</div>
	</section>
</body>
</html>