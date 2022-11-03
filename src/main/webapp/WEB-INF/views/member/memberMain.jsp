<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/member/memberMain.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="total_wrapper" style="justify-content: center;">
	        <div class="left_container" style="max-height: 357px;">
	            <div class="memberInfo">
	                <p>[고객]</p>
	                <p>${sessionScope.m.memberName }님</p>
	                <div class="member-point">내 마일리지 : ${sessionScope.m.memberMileage }원</div>
	            </div>
	            <div class="selectList">
	                <ul>
	                	<a href="/memberMain.do"><li>내정보</li></a> 
	                    <a href="/memberOrderList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1"><li>최근 주문 내역</li></a>
	                    <a href="/memberReview.do"><li>내 등록 리뷰</li></a>
	                </ul>
	            </div>
	        </div>
	
	        <div class="right_container" style="min-height: 357px;">
	        
	        	<!-- 내 정보 -->
	            <div class="content_container">
	            	<div class="content-title">회원 정보 수정</div>
	            	<div class="content-info-wrap">
		            	<div class="content-update">
			            	<div>배송지정보</div>
			            	<div>주소록수정</div>
		            	</div>
						<div class="content-info">
							<div>이름</div>
							<div>${sessionScope.m.memberName }</div>
						</div>
						<div class="content-info">
							<div>연락처</div>
							<div>${sessionScope.m.memberPhone }</div>
						</div>
						<div class="content-info">
							<div>주소</div>
							<div>${sessionScope.m.memberAddr }</div>
						</div>
					</div>
					<div class="content-info-wrap">
						<div class="content-update">
							<div>기본 회원 정보</div>
							<div>수정</div>
						</div>
						<div class="content-info">
							<div>이름</div>
							<div>${sessionScope.m.memberName }</div>
						</div>
						<div class="content-info">
							<div>이메일</div>
							<div>${sessionScope.m.memberMail }</div>
						</div>
						<div class="content-info">
							<div>비밀번호</div>
							<div>비밀번호 설정</div>
						</div>
						<div class="content-info">
							<div>휴대폰 번호</div>
							<div>${sessionScope.m.memberPhone }</div>
						</div>
					</div>
					<div class="member-withdraw">
						<a href="#">회원탈퇴</a>
					</div>
	            </div>
	        </div>
	    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>