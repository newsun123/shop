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
		font-size: 24px;
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
</style>
<script>
    function mainClick(mchk,n){
    	
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	
    	for(i=0;i<len;i++){
    		sub[i].checked=mchk.checked;
    	}	
    	
    	//클릭된 class="main" 말고 다른 main의 인덱스 : n
    	document.getElementsByClassName("main")[n].checked=mchk.checked;
    	
    	//아래 전체선택에 있는 (선택건수/총건수)에 값을 전달한다..
    	document.getElementById("bb").innerText=len;
    	if(mchk.checked)
    		document.getElementById("aa").innerText=len;
    	else
    	    document.getElementById("aa").innerText=0;
    }
    
    function subClick(){
    	
    	//체크된 sub의 갯수를 파악한다.
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	var sel=0;
    	
    	for(i=0;i<len;i++){
    		if(sub[i].checked)
    			sel++; 
    	}
    	//1.모든 sub가 체크되었다면 class="main"을 체크,아니면 해제
    	if(len==sel){
    		document.getElementsByClassName("main")[0].checked=true;
    		document.getElementsByClassName("main")[1].checked=true;
    	}else {
    		document.getElementsByClassName("main")[0].checked=false;
    		document.getElementsByClassName("main")[1].checked=false;
    	}	
    	
    	//3.아래 전체선택에 있는 (선택건수/총건수)에 값을 전달
    	document.getElementById("bb").innerText=len;
    	document.getElementById("aa").innerText=sel;
    }
    
    function changeSu(my,n,s,no){

    	if(my.value==10){
    		my.style.display="none";
    		document.getElementsByClassName("su2")[n].style.display="inline-block";
    		document.getElementsByClassName("su2")[n].value=s;
    		//document.getElementsByClassName("subtn")[n].style.display="inline";
    		
    	}else{//변경된 수량을 DB에 update
    		
    		var su=my.value;
            var chk=new XMLHttpRequest();
   		 	
            chk.onload=function(){

	   			if(chk.responseText=="1")
	   				alert("오류발생");
	   			
	   			var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
   			 	document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
	   		 	
	   		}
            
	   		chk.open("get","changeSu?su="+su+"&no="+no);
	   		chk.send();
    	}
    }
    
    function txtChange(my,n,no){//10미만인지 이상인지 여부를 체크해서 type="text" , select
    	
    	var su=my.value;
    	
    	if(su > 9){
    		document.getElementsByClassName("subtn")[n].style.display="inline-block";
    	}else{
    		document.getElementsByClassName("su2")[n].style.display="none";
    		document.getElementsByClassName("su1")[n].style.display="inline-block";
    		document.getElementsByClassName("subtn")[n].style.display="none";
    		// su의 값을 select태그에 전달
    		
    		document.getElementsByClassName("su1")[n].value=su;
    		
    		var chk=new XMLHttpRequest();
    		
    		chk.onload=function(){
    			 //alert(chk.responseText);
    			if(chk.responseText=="1")
    			    alert("오류발생");
				
    			var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
     			document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
    		}
    		
    		chk.open("get","changeSu?su="+su+"&no="+no);
    		chk.send();
    	}	
    }
    
    function changeSu2(n,no){
    	
    	var su=document.getElementsByClassName("su2")[n].value;
    	
    	var chk=new XMLHttpRequest();
		chk.onload=function(){
			//alert(chk.responseText);
			if(chk.responseText=="1")
				 alert("오류발생");
			 
			document.getElementsByClassName("subtn")[n].style.display="none";
			 
 			var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
 			document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
		}
		chk.open("get","changeSu?su="+su+"&no="+no);
		chk.send();
    }
    
    window.onload=function(){
    	
    	var plen=${mapall.size()}; //상품의 갯수
    	
    	var msu=[${str}];

    	for(i=0;i<plen;i++){
    		
    		if(msu[i]<10){
    			document.getElementsByClassName("su1")[i].value=msu[i];
    		}else{
    			document.getElementsByClassName("su1")[i].style.display="none";
    			document.getElementsByClassName("su2")[i].style.display="inline-block";
    			document.getElementsByClassName("su2")[i].value=msu[i];
    			//document.getElementsByClassName("subtn")[i].style.display="inline-block";
    		}
    	}
    }
    
    function comma(num){
   		return new Intl.NumberFormat().format(num);
    }
    
    function cartDel(no,n) { // index : 출력된 상품의 tr인덱스와 동일
    	var chk = new XMLHttpRequest();
    	chk.onload=function() {
    		if(chk.responseText=="0") {
    			document.getElementsByClassName("st")[n].remove();
    		}else {
    			alert(chk.responseText);
    		}
    	}
    	chk.open("GET","cartDel?no="+no);
    	chk.send();
    }
    
    function selectDel() {
    	// 선택된 체크박스에 해당되는 상품의 no를 가져오기 => DB에서 삭제
    	var sub = document.getElementsByClassName("sub");
    	// var sub2 = querySelectorAll(input[type='checkbox']:checked);
    	var len = sub.length;
    	var delsub="";
    	var delpro="";
    	for(i=0; i<len; i++) {
    		if(sub[i].checked) {
    			delsub = delsub + sub[i].value+",";
    			delpro = delpro + i + ",";
    			
    			// document.getElementsByClassName("st")[i].remove(); 오동작
    		}
    	}
    	
    	// 앞에서 삭제하면 index값이 움직여서 오작동이 나므로, 뒤에서부터 삭제해보자
    	var aaa = delpro.split(",");
    	for (i=aaa.length-2; i>=0; i--) {
    		document.getElementsByClassName("st")[aaa[i]].remove();
    	}
    	
    	var chk = new XMLHttpRequest();
    	chk.onload=function() {
    		
    	}
    	chk.open("GET", "selectDel?nos="+delsub);
    	chk.send();
    	// remove() 시킬 상품의 tr의 index 구하기
    	
    }
</script>
</head>
<body>
	<section>
		<h3>장바구니</h3>
   		<table>  
	    	<tr id="ft">
	        	<td><input type="checkbox" class="main" onclick="mainClick(this,1)"></td>
	        	<td>전체선택</td>
	        	<td>상품정보</td>
	        	<td>상품금액</td>
	        	<td>배송비</td>
	        </tr>
	    <c:forEach items="${mapall}" var="map" varStatus="sts"> <!-- 상품별 출력 -->
	      	<tr class="st"> <!-- 상품당 tr이 출력됌 -->
		        <td class="chkb"><input type="checkbox" class="sub" value="${map.no}" onclick="subClick()"></td>
		        <td><img src="/static/pro/${map.pimg}" width="50"></td>
		        <td>
		        	<div class="probox">
		        		<div class="tit">${map.title}</div>
		        		<div class="tpri">
		        		<c:if test="${map.psu<10}">
		        			<span class="pum">품절임박 잔여${map.psu}개</span>
		        		</c:if>
		        		<span class="danga"><fmt:formatNumber value="${map.price}" type="number"/></span><span class="corg">원</span>
			            
			            <select name="su" onchange="changeSu(this,${sts.index},${map.su},${map.no})" class="su1">
			            <c:set var="last" value="10"/>       
			            <!-- 10개 미만인 경우 last변수의 값을 변경 -->
			            <c:if test="${map.psu<10}">
			            	<c:set var="last" value="${map.psu}"/>
			            </c:if>
			            
			            <c:forEach begin="1" end="${last}" var="i" varStatus="no">
			            	<c:set var="aa" value=""/>      	
			            	<c:if test="${map.su!=i}">
			                	<c:if test="${no.count==10}">
			                		<c:set var="aa" value="+"/> 
			                	</c:if> 
			                	<option value="${i}">${i}${aa}</option>
			                </c:if>
			            	<c:if test="${map.su == i}">
			                	<c:if test="${no.count==10}">
			                		<c:set var="aa" value="+"/> 
			                	</c:if> 
			                	<option value="${i}" selected>${i}${aa}</option>
			              	</c:if>  	
			            </c:forEach>     
			            </select>
			            
			            <input type="text" name="su" class="su2" onblur="txtChange(this,${sts.index},${map.no})"><!-- 수량 직접 입력 -->
			            <input type="button" value="수량변경" class="subtn" onclick="changeSu2(${sts.index},${map.no})">
		        		</div>
		        	</div> 
		        </td>
		        <td class="pri">
		        	<span class="sangprice"><fmt:formatNumber value="${map.price*map.su}" type="number" pattern="#,###"/></span>원
		        	<img src="/static/product/del.png" valign="middle" onclick="cartDel(${map.no},${sts.index})">
		        </td>
		        <td class="bpri">
		        <c:if test="${map.bprice==0}">
		        	무료배송
		        </c:if>
		        <c:if test="${map.bprice!=0}">
		        	<fmt:formatNumber value="${map.bprice}" type="number" pattern="#,###"/>원
		        </c:if>
		        </td>
			</tr>
	    </c:forEach>  
	      	<tr >
	        	<td colspan="5">
		        	<input type="checkbox" class="main" onclick="mainClick(this,0)">전체선택<span class="gry">(<span id="aa">0</span>/<span id="bb">${mapall.size()}</span>)</span>
		        	<input type="button" value="전체삭제" class="alldel" onclick="selectDel()">
	        	</td>
	      	</tr>
	      	<tr>
	        	<td colspan="5" align="center" class="tot2">
	        		총 상품가격<span id="chongprice">0</span>원 + 총 배송비 <span id="chongbprice">0</span>원 =
	        		총 주문금액<span id="chongjumun">0</span>원
	        	</td> <!-- 총 상품가격,배송비, 주문금액 -->
	      	</tr>
	      	<tr class="sbtnbox">
		        <td colspan="5">
					<input type="button" value="계속 쇼핑하기" class="sbtn sbtn1">
					<input type="submit" value="구매하기" class="sbtn sbtn2">
		        </td>
	      	</tr>
   		</table>
	</section> 
</body>
</html>







