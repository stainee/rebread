<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/csChat.css">
<link rel="stylesheet" href="/resources/css/font/font.css">
</head>
<body>
	<h2>1:1 문의</h2>
	<div class="chatting">
		<div class="messageArea"></div>
		<div class="sendBox">
			<input type="text" id="sendMsg">
			<button id="sendBtn" onclick="sendMsg();">전송</button>
		</div>
	</div>
</body>
</html>