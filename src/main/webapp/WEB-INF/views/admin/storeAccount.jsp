<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/storeAccount.css">
<link rel="stylesheet" href="/resources/css/font/font.css">
</head>
<body>
	<div class="account_container">
		<div class="title_wrapper">
			<p>가게 정보</p>
		</div>
		<div class="content_container">
			<table class="membertbl">
				<tr>
				 	<th>회원번호</th>
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
				 	<th>월수익</th>
				 	<td><input type="text"></td>
				</tr>
				<tr>
					<th>플랫폼수익</th>
					<td><input type="text"></td>
				</tr>
				
				<tr>
					<th>실입금내역</th>
					<td><input type="text"></td>
				</tr>
			</table>
			<div class="btn_wrap">
 				<button class="complete" onclick="window.close()">확인</button>
			</div>
		</div>
	</div>
</body>
</html>