<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/memberDetail.css">
</head>
<body>
	<div class="detail_container">
		<div class="title_wrapper">
			<p>회원 정보</p>
		</div>
		<div class="content_container">
			<table class="membertbl">
				<tr>
				 	<th>회원번호</th>
				 	<td><input type="text"></td>
				</tr>
				<tr>
				 	<th>아이디</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>이름</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>전화번호</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>이메일</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>주소</th>
				 	<td><input type="text"> <button id="postcode">우편번호</button></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text"></td>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="text"></td>
				</tr>
			</table>
			<div class="btn_wrap">
				<button class="complete" onclick="window.close()">확인</button>
			</div>
		</div>
	</div>
</body>
<script>
	
</script>
</html>