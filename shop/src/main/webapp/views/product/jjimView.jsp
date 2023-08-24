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
	section{
	    width: 1100px;
	    margin: auto;
	    min-height: 700px;
	    margin-top: 50px;
	}
	h3{
		text-align:center;
		font-size: 22px;
	}
	table{
		width: 100%;
		border-spacing: 0;
	}
	table #ft{
	    position: relative;
	    background: #fafafa;
	    height: 45px;
	    font-weight: bold;
	    font-size: 14px;
	}
	table #ft > td{
		 border-top: 1px solid #ddd;
	    border-bottom: 1px solid #ddd;
	}
	table #ft td:nth-child(1){
		text-align: center;
    	width: 30px;
	}
	table #ft td:nth-child(3){
		text-align: center;
	}
	table #ft td:nth-child(4){
		text-align: center;
    	width: 140px;
	}
	table #ft td:nth-child(5){
		text-align: center;
    	width: 90px;
	}
	table .bpri{
		text-align: center;
    	border-left: 1px solid #ddd;
	}
	table .chkb{
		text-align: center;
	}
	table .pri{
		text-align: center;
		border-left: 1px solid #ddd;
	}
	table .st td{
		border-bottom: 5px solid #eee;
		font-size: 14px;
	}
	table .st img{
		width: 120px;
	    height: 110px;
	    object-fit: contain;
	    padding: 10px;
	}
	.tit{
		color:#555;
		font-weight: bold;
		width: 100%;
    	height: 50px;
    	border-bottom: 1px solid #eee;
    	font-size: 15px;
	}
	.probox{
		width: 685px;
    	height: 138px;
    	vertical-align: top;
    	padding: 20px 10px;
    	box-sizing: border-box;
	}
	.tpri{
		width: 100%;
    	height: 60px;
    	margin-top: 7px;
    	text-align: right;
	}
	.tot1{
		background: #f7f7f7;
    	font-size: 12px;
    	height: 60px;
    	text-align: right;
	}
	.pum{
		font-size: 11px;
    	color: #e52528;
	}
	.tot2{
		height: 70px;
		color:#111;
		font-size: 20px;
		border: 4px solid #ccc;
	}
	.tot2 .gry{
		color:#888;
	}
	.alldel{
		display: inline-block;
	    margin-left: 10px;
	    padding: 5px 6px;
	    border: 1px solid #ccc;
	    text-align: center;
	    font-size: 12px;
	    color: #111;
	    background: #fff;
	    cursor: pointer;
	}
	.sbtnbox{
		text-align: center;
	}
	.sbtn{
		font-weight: 700;
	    display: inline-block;
	    position: relative;
	    width: 216px;
	    line-height: 18px;
	    border: 2px solid #0073e9;
	    border-radius: 4px;
	    padding: 22px 0 19px;
	    text-align: center;
	    background: #fff;
	    color:#0073e9;
	    cursor:pointer;
	}
	.sbtn2{
		background: #0073e9;
		color:#fff;
	}
	.danga{
		color: #888;
		font-size: 15px;
	}
	.su1{
		width: 60px;
	    height: 25px;
   		margin-left: 10px;
   		outline: none;
	}
	.su2{
		width: 60px;
	    height: 25px;
    	outline: none;
    	box-sizing: border-box;
    	margin-left: 10px;
    	display: none;
    	padding-left: 3px;
	}
	.subtn{
	    width: 60px;
	    height: 25px;
	    font-size: 10px;
	    background: #fff;
	    text-align: center;
	    border: 1px solid #999;
	    cursor: pointer;
	    display: none;
	}
	.corg{
		color:#888;
	}
	table .st .pri img{
	width: 15px;
	vertical-align: middle;
	display: inline-block;
	cursor: pointer;
	padding: 0;
	position: relative;
	top: -1px;
	height: 20px;
	margin-left: 3px;
}
#chongprice, #chongbae {
	font-weight: 600;
	font-size:20px;
}
#chongjumun {
	font-weight: 600;
	font-size:22px;
	color:red;
}
</style>
<script>
	function jjimDel(pcode,no) {
		var cyd = new XMLHttpRequest();
		cyd.onload = function() {
			alert(cyd.responseText);
			if(cyd.responseText == "1") {
				alert("오류");
			}
		}
		cyd.open("GET","jjimDel?no="+no);
		cyd.send();
	}
	function mainClick(mchk,n) {
		var sub = document.getElementsByClassName("sub");
		var len = sub.length;
		for(i=0; i<len; i++) {
			sub[i].checked = mchk.checked;
		}
		document.getElementsByClassName("main")[n].checked = mchk.checked;
	}
	
	function subClick() {
		var sub = document.getElementsByClassName("sub");
		var len = sub.length;
		var sel = 0;
		for(i=0; i<len; i++) {
			if(sub[i].checked){
				sel++;
			}
			if(len==sel) {
				document.getElementsByClassName("main")[0].checked=true;
				document.getElementsByClassName("main")[1].checked=true;
			}else {
				document.getElementsByClassName("main")[0].checked=false;
				document.getElementsByClassName("main")[1].checked=false;				
			}
		}
	}
	
	function selectDel2() {
		var sub = document.getElementsByClassName("sub");
		var len = sub.length;
		var delsub="";
		var delpro="";
		for(i=0;i<len;i++) {
			if(sub[i].checked) {
				delsub = delsub+sub[i].value+",";
				delpro = delpro+i+",";
			}
			var imsi = delpro.split(",");
			for(i=imsi.length-2;i>=0;i--) {
				document.getElementsByClassName("st")[imsi[i]].remove();
			}
			var cyd = new XMLHttpRequest();
			cyd.onload = function() {
				alret(cyd.responseText);
				if(cyd.responseText=="1"){
					alert("오류");
				}
			}
			cyd.open("GET","selectDel2?nos="+delsub);
			cyd.send();
		}
	}
</script>
</head>
<body>
<section>
	<table width="900" align="center" cellspacing="0">
		<caption><h3>찜 목록</h3></caption>
			<tr>
				<td>
					<input type="checkbox" class="main" onclick="mainClick(this,1)">전체선택
				</td>
			</tr>
			<c:forEach items="${mapall}" var="map">
			<tr class="st">
				<td>
					<input type="checkbox" class="sub" onclick="subClick()">
					<img src="/static/pro/${map.pimg}" width="50">
				</td>
				<td><!-- 상품정보 시작 -->
					<c:if test="${map.bprice==0}">
					무료배송
					</c:if>
					<c:if test="${map.bprice!=0}">
					<fmt:formatNumber value="${map.bprice}" type="number"/>원
					</c:if>
					<br>
					${map.title}
					<br>
					<fmt:formatNumber value="${map.price}" type="number"/>원
				</td><!-- 상품정보 끝 -->
				<td>
					<input type="button" value="장바구니 담기" onclick="location='jjimToCart?pcode=${map.pcode}&no=${map.no}'"> <br>
					<input type="button" value="삭제" onclick="jjimDel(this.${map.pcode},${map.no})">
				</td><!-- 장바구니 담기 -->
				<td></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="3">
					<input type="checkbox" class="main" onclick="mainClick(this,0)"> 전체선택   
            		<input type="button" value="선택삭제" onclick="selectDel2()">  
				</td>
			</tr>
	</table>
</section>
</body>
</html>