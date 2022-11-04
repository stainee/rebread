<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/order/orderFail.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="content-wrap">
        <div class="content">
            <p>주문이 정상적으로 되지 않았습니다</p>
            <p>다시 확인해줭</p>
            <button class="order-detail" onclick="goToHome()">홈으로 가기</button>
            <button class="order-mypage" onclick="goToMyPage()">마이페이지</button>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		function goToHome(){
			location.href="/"
		}
		function goToMyPage(){
			location.href="/memberMain.do"
		}
	</script>
</body>
</html>