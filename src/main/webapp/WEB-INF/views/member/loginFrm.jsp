<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errMsg = (String)session.getAttribute("errMsg");
	if(errMsg == null) errMsg ="";
	session.invalidate();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/member/loginFrm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz:wght@500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<!--aos라이브러리-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<title>REBREAD LOGIN</title>
</head>
<body>
	<div class="wrap">
		<div class="page-content">
			<div class="content-header">
				<div>
					<span data-aos="fade-top" data-aos-delay="300"
						data-aos-duration="1500">R</span> <span data-aos="fade-top"
						data-aos-duration="1500" data-aos-delay="500">E</span> <span
						data-aos="fade-top" data-aos-duration="1500" data-aos-delay="700">B</span>
					<span data-aos="fade-top" data-aos-duration="1500"
						data-aos-delay="900">R</span> <span data-aos="fade-top"
						data-aos-duration="1500" data-aos-delay="1100">E</span> <span
						data-aos="fade-top" data-aos-duration="1500" data-aos-delay="1300">A</span>
					<span data-aos="fade-top" data-aos-duration="1500"
						data-aos-delay="1500">D</span>
				</div>
				<div>로 그 인</div>
			</div>
			<div class="content">
				<p id="errMsg" style="color:red; text-align:center; font-size: 13px;"><%=errMsg%></p>
				<form action="/login.do" method="post">
				<div class="idpw">
					<div id="id" class="memberIn">
						<span>ID</span>
						<input type="text" name="memberId"> 
					</div>
					<div id="pw" class="memberIn">
						<span>PW</span>
						<input type="password" name="memberPw">
					</div>
				</div>
					<div id="search">
						<a href="/searchId.do">아이디 찾기</a>
						<a href="/seachPw.do">비밀번호 찾기</a>
					</div>
					<div id="login">
						<input type="submit" value="로 그 인">
					</div>
				</form>
				<div class="signKaKao">
					<span><img src="/resources/img/member/icon-itg-kakao.svg"></span> 
					<span>카카오톡으로 로그인</span>
				</div>
				<div class="join">
					<p>아직 회원이 아니신가요?</p>
					<p>고객님을 위한 다양한 해택이 준비되어 있습니다.</p>
					<span>
						<a href="/joinStep.do">회원가입</a>
					</span>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	AOS.init();
</script>
<!-- //AOS 스크립트 초기화 -->
<div aos="fade-up" data-aos-offset="200" data-aos-easing="ease-out-cubic" data-aos-duration="500">
</html>