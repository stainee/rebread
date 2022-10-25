<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/storeDetail.css">
<link rel="stylesheet" href="/resources/css/font/font.css">
</head>
<body>
	<div class="detail_container">
		<div class="title_wrapper">
			<p>가게 정보</p>
		</div>
		<div class="content_container">
			<table class="membertbl">
				<tr>
				 	<th>사업자이름</th>
				 	<td><input type="text"></td>
				</tr>
				<tr>
				 	<th>사업자번호</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>매장번호</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>계좌번호</th>
				 	<td><input type="text"></td>
				</tr>
				
				<tr>
				 	<th>영업시간</th>
				 	<td id="hour"><input type="text"> ~ <input type="text"></td>
				</tr>
				
				<tr>
				 	<th>매장주소</th>
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
				<button class="modify" onclick="window.close()">수정</button>
 				<button class="complete" onclick="window.close()">확인</button>
			</div>
		</div>
	</div>
</body>
</html>