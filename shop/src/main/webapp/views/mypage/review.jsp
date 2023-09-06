<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#outer {
	width:600px;
	margin:auto;
}
input[type=text] {
	width: 500px;
    height: 35px;
}
textarea {
	width: 503px;
    height: 200px;
    margin-top: 15px;
}
</style>
<script>
function chgstar(n)
{
	// 매개변수 n까지 별을 노란색(stat1.png)으로 변경
	for(i=0;i<=n;i++)
	{
		document.getElementsByClassName("star")[i].src="/static/product/star1.png";
	}	
	
	// 클릭된 위치 오른쪽 별은 회색으로 (star2.png)
	for(i=n+1;i<5;i++)
    {
		document.getElementsByClassName("star")[i].src="/static/product/star2.png";
    }    
	
	document.pkc.star.value=n+1; // 별점을 계산하여 reviewOk로 보내는 input태그에 값을 전달
 }
 
 function check() {
	 //submit이 되었을 때, 
	 if(document.pkc.star.value=="0") {
		 alert("별점을 입력해주세요");
		 return false;
	 }else{
		 return true;		 
	 } 
	 
	 
 }
</script>
</head>
<body>
<!-- 별점, 상품평의 제목과 내용 적기 -->
<section>
	<div id="outer">
		<h3>리뷰 작성</h3>
	<form name="pkc" method="post" action="reviewOk" onsubmit="return check()">
	<input type="hidden" name="star">
	<input type="hidden" name="pcode" value="${pcode}">
	<input type="hidden" name="gumaeno" value="${gumaeno}">	
		<div id="star"> 
        <img src="/static/product/star2.png" onclick="chgstar(0)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(1)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(2)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(3)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(4)" class="star">
		</div> <!-- 별점 -->
		<div> <input type="text" name="title" placeholder="한줄요약"></div> <!-- 한줄요약 -->
		<div><textarea name="content" placeholder="내용작성"></textarea></div><!-- 상품평 -->
		<div> <input type="submit" value="상품평 등록"> </div> 
	</form>
	</div>
</section> 
</body>
</html>