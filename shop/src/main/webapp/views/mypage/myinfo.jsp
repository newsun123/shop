<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#chgphone, #chgname, #chgemail {
	display:none;
}
#pwdform {
	display:none;
}
</style>
<script>
function chgNameTag() {
	document.getElementById("chgname").style.display="block";
	document.getElementById("chgn2").style.display="inline-block";
	document.getElementById("chgn1").style.display="none";
}
function cancelChgName() {
	document.getElementById("chgname").style.display="none";
	document.getElementById("chgn2").style.display="none";
	document.getElementById("chgn1").style.display="inline-block";
}
function chgPhoneTag() {
	document.getElementById("chgphone").style.display="block";
	document.getElementById("chgp2").style.display="inline-block";
	document.getElementById("chgp1").style.display="none";
}
function cancelChgPhone() {
	document.getElementById("chgphone").style.display="none";
	document.getElementById("chgp2").style.display="none";
	document.getElementById("chgp1").style.display="inline-block";
}
function chgEmailTag() {
	document.getElementById("chgemail").style.display="block";
	document.getElementById("chge2").style.display="inline-block";
	document.getElementById("chge1").style.display="none";
}
function cancelChgEmail() {
	document.getElementById("chgemail").style.display="none";
	document.getElementById("chge2").style.display="none";
	document.getElementById("chge1").style.display="inline-block";
}
function checkPwd() {
	var pwd = document.getElementById("pwd_old").value;
	//alert(pwd); 밸류값 확인용
	var cyd = new XMLHttpRequest();
	cyd.onload = function() {
		if(cyd.responseText == 0) {
			document.getElementById("pwdform").style.display="block";
			document.getElementById("pd").style.display="none";
			document.getElementById("chgp").style.display="inline-block";
			document.getElementById("pwdmsg").innerText="";
			
		}else {
			document.getElementById("pwdmsg").innerText = "비밀번호를 다시 확인해주세요";
			document.getElementById("pwdmsg").style.color="red";
		}		
	}
	cyd.open("GET","checkPwd?pwd="+pwd);
	cyd.send();
}
function cancelChgPwd() {
	document.getElementById("pwdform").style.display="none";
	document.getElementById("pd").style.display="block";
	document.getElementById("chgp").style.display="none";
	document.getElementById("pwd_old").value="";
}

function chkpwd1() {
	var pwd1 = document.getElementById("pwd1").value;
	//alert(pwd1); pwd1 밸류값 확인
	if(pwd1.length < 6) {
		document.getElementById("pwdmsg").innerText = "비밀번호는 최소 6자리 숫자입니다.";
		document.getElementById("pwdmsg").style.color="red";
	}else {
		document.getElementById("pwdmsg").innerText = "";
	}
}
function chkpwd2()	{
	var pwd1 = document.getElementById("pwd1").value;
	var pwd2 = document.getElementById("pwd2").value;
	//alert(pwd1+"="+pwd2); //확인
	if(pwd1==pwd2) {
		document.getElementById("pwdmsg").innerText = "비밀번호가 같습니다."
		document.getElementById("pwdmsg").style.color="blue";
	}else {
		document.getElementById("pwdmsg").innerText = "비밀번호가 다릅니다."
		document.getElementById("pwdmsg").style.color="red";
	}
}
</script>
</head>
<body>
<section>
	<table width="1100" align="center" border="1">
		<caption><h3>회원정보 수정</h3></caption>
		<tr>
			<td>아이디</td>
			<td colspan="2">
				${mvo.userid} 
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<span id="nametag">${mvo.name}</span> <input type="button" value="이름 변경" onclick="chgNameTag()" id="chgn1"> <input type="button" value="변경 취소" onclick="cancelChgName()" id="chgn2" style="display:none;">
				<div id="chgname">
					<form method="post" action="mynamechg" name="nameform">
						<input type="text" name="name" id="name"> <input type="submit" value="변경하기">
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				${mvo.phone} <input type="button" value="전화번호 변경" onclick="chgPhoneTag()" id="chgp1"> <input type="button" value="변경 취소" onclick="cancelChgPhone()" id="chgp2" style="display:none;">
				<div id="chgphone">
					<form method="post" action="myphonchg">
						<input type="text" name="phone"> <input type="submit" value="변경하기">
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				${mvo.email} <input type="button" value="이메일 변경" onclick="chgEmailTag()" id="chge1"> <input type="button" value="변경 취소" onclick="cancelChgEmail()" id="chge2" style="display:none;">
				<div id="chgemail">
					<form method="post" action="myemailchg">
						<input type="text" name="email"> <input type="submit" value="변경하기">
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<td>비밀번호 변경</td>
			<td colspan="2">
				<span id="pd"><input type="text" name="pwd" placeholder="기존 비밀번호를 입력하세요" id="pwd_old"> <input type="button" value="비밀번호 확인" onclick="checkPwd()"></span> 
				<div id="pwdform">
					<form method="post" action="chgPwd">
						<div>
							<input type="password" name="pwd1" id="pwd1"placeholder="비밀번호를 입력하세요" onkeyup="chkpwd1()">
						</div> 
						<div>
							<input type="password" name="pwd2" id="pwd2" placeholder="비밀번호를 다시 입력하세요" onkeyup="chkpwd2()">
							<input type="submit" value="비밀번호 변경"> <input type="button" value="변경 취소" onclick="cancelChgPwd()" id="chgp" style="display:none;">
						</div> 
					</form>
				</div>
				<span id="pwdmsg" style="font-size:12px;"></span>
			</td>
		</tr>
	</table>
</section>
</body>
</html>