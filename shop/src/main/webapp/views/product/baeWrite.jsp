<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div> <!-- 이름 입력칸 -->
		<input type="text" name="name" placeholder="이름">
	</div>
	<div> <!-- 전화번호칸 -->
		<input type="text" name="phone" placeholder="전화번호">
	</div>
	<div> <!-- 우편번호칸 -->
		<input type="text" name="zip" placeholder="우편번호">
	</div>
	<div> <!-- 주소 -->
		<input type="text" name="add" placeholder="주소">
	</div>
	<div> <!-- 상세주소 -->
		<input type="text" name="jusoEtc" placeholder="상세주소">
	</div>
	<div> <!-- 요청사항 -->
		<select name="req">
			<option>문 앞</option>
			<option>직접 받고, 부재시 문 앞</option>
			<option>경비실</option>
			<option>택배함</option>
		</select>
	</div>
	<div> <input type="checkbox" name="gibon" value="1"> 기본 배송지로 사용 </div>
	<div> <input type="submit" value="저장하기"> </div>
</body>
</html>