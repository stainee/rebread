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
<link rel="stylesheet" href="/resources/css/member/memberOrderList.css">
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
	                    <a href=/memberOrderList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1><li>최근 주문 내역</li></a>
	                    <a href="/memberReview.do"><li>내 등록 리뷰</li></a>
	                </ul>
	            </div>
	        </div>
	
	        <div class="right_container" style="min-height: 357px;">
	            <div class="content_container">
	            	<c:forEach items="${list }" var="o">
	           		<a href="/orderDetail.do?orderNo=${o.orderNo }">
						<div class="content-box">
		            		<div class="content-img"><img src="/resources/img/common/logo.png"></div>
		            		<div class="content-wrap">
		            			<div class="content-status-date">
			            			<div class="deliver-status">${o.orderState }</div>
			            			<span>ㅣ</span>
			            			<div class="order-date">${o.orderDate }</div>
		            			</div>
		            			<div class="content-product-name">빵이름상품이름</div>            		
		            		</div>
		            	</div>
	            	</a>
	            	</c:forEach>
	            </div>
	            <div class="order-page-wrap">
		            <div class="order-page">${pageNavi }</div>
				</div>
	        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	
	</script>
</body>
</html>