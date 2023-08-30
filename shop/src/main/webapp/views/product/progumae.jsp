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
section {
	width:1100px;
	margin:auto;
	position:relative;
}
section #baeReq {
	position:absolute;
	left:240px;
	top:460px;
	width:180px;
	height:150px;
	border:1px solid white;
	background:white;
	font-size: 14px;
	visibility:hidden;
}
section #baeReq div {
	margin-top:3px;
}
#gibon {
	font-size:12px;
	border:2px solid #2E9AFE;
	background:#2E9AFE;
	color:white;
	width:10px;
	border-radius:6px;
}
h3 {
	height:40px;
	line-height:40px;
	border-bottom:3px solid #ccc;
}
table {
	border-spacing: 0;
}
tr td {
	height:40px;
	border: 1px solid #ccc;
	padding-left:12px;
}
#table1 tr td:first-child,
#table2 tr td:first-child,
#table3 tr td:first-child {
	width:110px;
	background:#f4f4f4;
	font-weight: bold;
	color:#333;
}
.payment {
	display:none;
}
.payment:first-child {
	display:block;
}
#gumaebtn {
   	width:500px;
     height:40px;
	border:2px solid #2E9AFE;
	background:#2E9AFE;
     color:white;
     cursor:pointer;
     border-radius:2px;
     font-size:18px;
     font-weight:900;
     margin-top:40px;
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

function chgPayment(n) {
	var pay = document.getElementsByClassName("payment");
	//다른것 숨기기
	for(i=0;i<pay.length;i++){
		pay[i].style.display="none";
	}
	//n에 해당하는 인덱스 보이게 하기
	pay[n].style.display="block";
}

function chgReq() {
	document.getElementById("baeReq").style.visibility="visible";
}

function setReq() { // baesong테이블에서 req를 변경
	//변경될 req, 변경할 레코드의 no
	var req = document.gform.req.value;
	var no = document.gform.baeno.value;
	alert(req+" "+no);
	var cyd = new XMLHttpRequest();
	cyd.onload=function() {
		if(cyd.responseText==0){
			document.getElementById("req").innerText = document.getElementsByClassName("abc")[req].innerText;
			document.getElementById("baeReq").style.visibility ="hidden";
		}else{
			alert("오류");
		}
	}
	cyd.open("GET","setReq?req="+req+"&no="+no);
	cyd.send();
	
}

function check() {
	
}
</script>
</head>
<body>
<section>
<!-- 배송 요청변경사항 레이어 -->
<form method="post" name="gform" action="progumaeOk" onsubmit="return check(this)">
<input type="hidden" name="pcode" value="${pcode}">
<input type="hidden" name="sus" value="${su}">

<div id="baeReq">
	<div class="abc"><input type="radio" name="req" value="0">문앞</div> <p>
	<div class="abc"><input type="radio" name="req" value="1">직접받고 부재시 문앞</div> <p>
	<div class="abc"><input type="radio" name="req" value="2">경비실</div> <p>
	<div class="abc"><input type="radio" name="req" value="3">택배함</div> <p>
	<div align="center"><input type="button" value="변경" onclick="setReq()"></div>
	
</div>
<h2 align="center"> 주문 결제</h2>
<!-- 구매자정보 -->
<table width="1100" align="center" id="table1">
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
<table width="1100" align="center" id="table2">
  <caption><h3 align="left">배송지 정보
  			<c:if test="${bvo==null}">
  				<span style="color:blue;font-size:12px;">등록된 기본배송지가 없거나 등록된 주소가 없습니다.</span>
  			</c:if>
  			 <input type="button" value="배송지 추가/변경" onclick="baeOpen()">
  		   </h3></caption>
    <tr>
      <td>이 름</td>
      <td class="name">${bvo.name}
	      <c:if test="${bvo.gibon==1}">
	      		<span id="gibon">기본배송지</span>
	      </c:if>
      </td>
    </tr>
    <tr>
      <td>주소</td>
      <td class="juso">${bvo.juso}, ${bvo.jusoEct }</td>
 	</tr>
    <tr>
      <td>전화번호</td>
      <td class="phone">${bvo.phone}</td>
    </tr>
    <tr>
      <td>요청사항</td>
      <td>
      	<span id="req">
      	<c:if test="${bvo.req==0}">
      		문 앞
      	</c:if>
      	<c:if test="${bvo.req==1}">
      		직접 받고 부재시 문 앞
      	</c:if>
      	<c:if test="${bvo.req==2}">
      		경비실
      	</c:if>
      	<c:if test="${bvo.req==3}">	
      		택배함
      	</c:if>
      	</span>
      	<input type="button" value="변경" onclick="chgReq()">
      	<input type="hidden" value="${bvo.no}" name="baeno" id="baeno"> <!-- 배송지테이블 no -->
      </td>
    </tr>
</table> <!-- 배송지정보 끝 -->
<!-- 구매상품정보 -->
<table width="1100" align="center" class="gumetable"  id="table4">
	<caption> <h3 align="left">배송 정보</h3> </caption>
	<c:set var="sp" value="0"/>  <!-- 상품별: product.price필드*수량에 상품별로 합을 구함. -->
	<c:set var="bsb" value="0"/> <!-- 배송비: product.bprice의 상품별 합을 구함 -->
	<c:set var="juk" value="0"/> <!-- 적립금: product.juk을 이용하려 상품별 적립금을 구함 -->
	<c:set var="cp" value="0"/>  <!-- 총금액: sp-할인금액, 상품별 합 -->
	<c:set var="jukh" value=""/> <!-- 상품별 적립금을 , 로 구분할 변수 -->
	<c:set var="chongprice" value=""/> <!-- 상품별 결제금액을  , 로 구분할 변수 -->
	<c:forEach items="${plist}" var="bpvo">
		<tr> <!-- 배송 예정일 -->
			<td colspan="2">
				${bpvo.yoil}요일 (${bpvo.writeday}) 도착 예정
			</td>
		</tr>
		<tr> <!-- 상품 정보 -->
			<td>${bpvo.title} ${bpvo.su}개</td>
			<td>
				<c:if test="${bpvo.bprice==0}">
				무료배송
				</c:if>
				<c:if test="${bpvo.bprice!=0}">
				배송비 <fmt:formatNumber value="${bpvo.bprice}" type="number"/>원
				</c:if>
			</td>
		</tr>
	<c:set var="sp" value="${sp+((bpvo.price-(bpvo.price*bpvo.halin/100))*bpvo.su)}"/>  <!-- 포문 안에서 값 누적시키기 -->
	<c:set var="bsb" value="${bsb+bpvo.bprice}"/> 
	<c:set var="juk" value="${juk+(bpvo.price*(bpvo.juk/100))}"/> 
	<c:set var="cp" value="${cp+(((bpvo.price-(bpvo.price*bpvo.halin/100))*bpvo.su)+bpvo.bprice)}"/>  
	<c:set var="jukh" value="${jukh}${bpvo.price*(bpvo.juk/100)},"/>
	<c:set var="chongprice" value="${chongprice}${((bpvo.price-(bpvo.price*bpvo.halin/100))*bpvo.su)+bpvo.bprice},"/>
	</c:forEach>
</table>
<!-- 구매상품정보 끝 -->

<input type="hidden" name="juks" value="${jukh}"> <!-- 구매시 사용한 적립금 -->
<input type="hidden" name="chongprices" value="${chongprice}">

<!-- 결제 정보 -->
<table width="1100" align="center">
	<caption> <h3 align="left"> 결제정보 </h3> </caption>
	<tr>
		<td>총 상품가격</td> <!-- 할인율을 포함시키기 -->
		<td> <fmt:formatNumber value="${sp}" type="Number" pattern="##,###"/>원 </td>
	</tr>
	<tr>
		<td>배송비</td>
		<td><fmt:formatNumber value="${bsb}" type="number"/>원 </td>
	</tr>
	<tr>
		<td>적립금</td>
		<td> <fmt:formatNumber value="${juk}" type="number"/>원 적립예정 </td>
	</tr>
	<tr>
		<td>총 결제가격</td>
		<td>
			<fmt:formatNumber value="${cp}" type="number" pattern="##,###" />원
		</td>
	</tr>
	<tr>
		<td rowspan="2">결제방법</td>
		<td>
			<input type="radio" checked name="pay" value="0"  onclick="chgPayment(0)">계좌이체
			<input type="radio" name="pay" value="1" onclick="chgPayment(1)">신용/체크카드
			<input type="radio" name="pay" value="2" onclick="chgPayment(2)">법인카드
			<input type="radio" name="pay" value="3" onclick="chgPayment(3)">휴대폰
		</td>
	</tr>
	<tr>
		<td style="background:white;">
			<div class="payment">
              <span id="sel"> * 은행선택 </span>  
              <select name="bank">
                <option value="0"> 신한은행 </option>
                <option value="1"> 농협은행 </option>
                <option value="2"> 우리은행 </option>
                <option value="3"> 하나은행 </option>
                <option value="4"> KB은행 </option>
                <option value="5"> 한국은행 </option>
              </select> <p>
              <input type="checkbox" checked value="0" name="sudan">기본 결제 수단으로 사용
           </div>   <!-- document.getElementsByClassName("payment")[0] -->
           <div class="payment">
             <span id="sel"> * 카드선택 </span> 
             <select name="card">
                <option value="0"> 신한카드 </option>
                <option value="1"> 농협카드 </option>
                <option value="2"> 우리카드 </option>
                <option value="3"> 하나카드 </option>
                <option value="4"> KB카드 </option>
                <option value="5"> 한국카드 </option>
             </select> <p>
             <span id="sel"> * 할부기간  </span> 
             <select name="halbu">
                <option value="0"> 일시불 </option>
                <option value="3"> 3개월 </option>
                <option value="6"> 6개월 </option>
                <option value="9"> 9개월 </option>
                <option value="12"> 12개월 </option>
             </select> <p>
             <input type="checkbox" checked value="1" name="sudan">기본 결제 수단으로 사용
           </div>
           <div class="payment">
             <span id="sel">  * 카드선택 </span>  
             <select name="card">
                <option value="0"> 신한카드 </option>
                <option value="1"> 농협카드 </option>
                <option value="2"> 우리카드 </option>
                <option value="3"> 하나카드 </option>
                <option value="4"> KB카드 </option>
                <option value="5"> 한국카드 </option>
             </select> <p>
             <span id="sel"> * 할부기간 </span>  
             <select name="halbu">
                <option value=""> 일시불 </option>
             </select> 법인카드는 일시불 결제만 가능합니다.
             <p>
             <input type="checkbox" checked value="2" name="sudan">기본 결제 수단으로 사용
           </div>
           <div class="payment">
             <span id="sel"> * 통신사 종류 </span> 
             <select name="tongsin">
               <option value="0"> SKT </option>
               <option value="1"> KT </option>
               <option value="2"> LG </option>
               <option value="3"> 그 외 </option>
             </select> <p>
             <input type="checkbox" checked value="3" name="sudan">기본 결제 수단으로 사용
           </div> 
		</td>
	</tr>
</table>
<!-- 결제 정보 끝 -->
<div align="center"> <input type="submit" value="구매하기" id="gumaebtn">  </div>
</form>
</section>
</body>
</html>