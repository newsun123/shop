<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width:1100px;
	height:600px;
	margin:auto;
	margin-top:50px;
	text-align:center;
}

section textarea {
	margin-top:20px;
	width:400px;
	height:100px;
}
section > form > div > input[type=text] {
	width:400px;
	height:30px;
	border:1px solid gray;
	outline:none;
}
section > form > div > input[type=submit] {
	margin-top:20px;
	width:420px;
	height:30px;
	border:1px solid gray;
	outline:none;
}
section select {
	margin-top:20px;
	width:410px;
	height:30px;
	text-align: center;
}
section .phone {
	width:400px;
	height:30px;
	margin-bottom:20px;
}
section .email {
	width:200px;
	height:30px;
}
#sm {
    width: 105px;
    height: 37px;
}
section .inner {
	display: none;
}
</style>
<script>
function selinner(value) {

		document.getElementsByClassName("inner")[0].style.display="none";
		document.getElementsByClassName("inner")[1].style.display="none";
		
	if(value==1 || value==2) {
		// 값에 따라 보여주기
		document.getElementsByClassName("inner")[value-1].style.display="block";
	}
}

function selemail(v) {
	document.mform.server.value=v;
	
}

function check() {
	var uid = document.mform.uid.value;
	var server = document.mform.server.value;
	document.mform.email.value = uid+"@"+server;
	
	return true;
}
</script>
</head>
<body>
<section>
	<form method="post" action="mtmOk" name="mform" onsubmit="return check()">
	<input type="hidden" name="email">
		<h2> 1:1 문의</h2>
		<div> <input type="text" name="title" placeholder="제목을 입력하세요"> </div>
		<div> <textarea name="content"></textarea> </div>
		<div> 
			<select name="answer" onchange="selinner(this.value)">
				<option value="0">-- 선 택 --</option>
				<option value="1">전화번호</option>
				<option value="2">이메일</option>
				<option value="3">홈페이지</option>
			</select>
			<p>
			<div class="inner"><input type="text" name="phone" placeholder="전화번호를 입력하세요" class="phone"></div>
			<div class="inner">
				<input type="text" name="uid" placeholder="이메일을 입력하세요" class="email">@<input type="text" name="server" class="email">
				<select onchange="selemail(this.value)" id="sm">
					<option value="">직접작성</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="daum.net">다음</option>
					<option value="hotmail.com">야후</option>
				</select>
			</div>
		</div>
		<div> <input type="submit" value="문의하기"> </div>
	</form>
</section>
</body>
</html>