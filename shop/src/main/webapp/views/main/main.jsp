<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		height:200px;
		margin:auto;
		background:brown;
	}
	#best{
		width:1100px;
		height:200px;
		margin:auto;
		background:red;
	}
	#sale{
		width:1100px;
		height:200px;
		margin:auto;
		background:blue;
	}
	#event{
		width:1100px;
		height:200px;
		margin:auto;
		background:black;
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
		<div id="newpro">
		
		</div>
		<!-- 인기상품 -->
		<div id="best"></div>
		<!-- 특가상품 -->
		<div id="sale"></div>
		<!-- 이벤트 -->
		<div id="event"></div>
	</section>
</body>
</html>