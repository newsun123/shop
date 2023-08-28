<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin:0;
}
#top {
	width:100%;
	height:40px;
	line-height:40px;
	border:2px solid #ccc;
	text-align: center;
	font-size:18px;
	font-weight: 600;
	margin-bottom:30px;
}
.text {
	text-align: center;
}
input[type=text] {
	width: 460px;
    height: 40px;
    margin-bottom: 10px;
}
select {
    width: 470px;
    height: 43px;
    margin-bottom: 10px;
}
input[type=submit] {
    margin-top: 20px;
    width: 468px;
    height: 44px;
    line-height: 44px;
    margin-bottom: 10px;
    background: #2E9AFE;
    color: white;
    font-weight: 600;
    font-size: 17px;
    border: none;
}
input[type=button] {
    margin-top: 5px;
    width: 468px;
    height: 44px;
    line-height: 44px;
    margin-bottom: 10px;
    background: #2E9AFE;
    color: white;
    font-weight: 600;
    font-size: 17px;
    border: none;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function() {
	document.pkc.req.value=${bvo.req};
	var gibon = ${bvo.gibon};
		if(gibon == 1) 
			document.pkc.gibon.checked = true;
}
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.pkc.zip.value = data.zonecode; // 우편번호
        document.pkc.juso.value = addr;  // 주소
        // 커서를 상세주소 필드로 이동한다.
        document.pkc.jusoEct.focus();
    }
  }).open();
}
</script>
</head>
<body>
<form name="pkc" method="post" action="baeUpdateOk">
<input type="hidden" name="no" value="${bvo.no}">
<div id="top"> 주소 설정</div>
	<div class="text"> <!-- 이름 입력칸 -->
		<input type="text" name="name" placeholder="받으시는분" value="${bvo.name}">
	</div>
	<div class="text"> <!-- 전화번호칸 -->
		<input type="text" name="phone" placeholder="전화번호" value="${bvo.phone}">
	</div>
	<div class="text"> <!-- 우편번호칸 -->
		<input type="text" name="zip" placeholder="우편번호" onclick="juso_search()" value="${bvo.zip}">
	</div>
	<div class="text"> <!-- 주소 -->
		<input type="text" name="juso" placeholder="주소" value="${bvo.juso}">
	</div>
	<div class="text"> <!-- 상세주소 -->
		<input type="text" name="jusoEct" placeholder="상세주소" value="${bvo.jusoEct}">
	</div>
	<div class="text"> <!-- 요청사항 -->
		<select name="req">
			<option value="0">문 앞</option>
			<option value="1">직접 받고, 부재시 문 앞</option>
			<option value="2">경비실</option>
			<option value="3">택배함</option>
		</select>
	</div>
	<div class="text"> <input type="checkbox" name="gibon" value="1"> 기본 배송지로 사용 
	
	</div>
	<div class="text"> <input type="submit" value="수정하기"> </div>
	<div class="text"> <input type="button" value="삭제하기" onclick="location='baeDelete?no=${bvo.no}'"> </div>
</form>
</body>
</html>