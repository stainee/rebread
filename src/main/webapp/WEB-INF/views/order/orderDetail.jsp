<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/order/orderDetail.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="total_wrapper" style="justify-content: center;">
	        <div class="left_container" style="max-height: 357px;">
	            <div class="memberInfo">
	                <p>[고객]</p>
	                <p>방우현님</p>
	                <div class="member-point">내 마일리지 : 1000원</div>
	            </div>
	            <div class="selectList">
	                <ul>
	                	<a href="/memberMain.do"><li>내정보</li></a> 
	                    <a href="/memberOrderList.do"><li>최근 주문 내역</li></a>
	                    <a href="/memberReview.do"><li>내 등록 리뷰</li></a>
	                </ul>
	            </div>
	        </div>
	
	        <div class="right_container" style="min-height: 357px;">
	        	<div class="content_container">
	        		<div class="content-box1">
	        			<div class="content-title-comment">← 배송완료</div>
	        			<div class="content-title-date">2022년22월22일</div>
	        		</div>
	        		<div class="content-box2">
	        			<div class="content-addr">배송지 정보</div>
	        			<div class="content-info">
	        				<div>이름</div>
	        				<div>방우현</div>
	        			</div>
	        			<div class="content-info">
	        				<div>연락처</div>
	        				<div>010-1234-1234</div>
	        			</div>
	        			<div class="content-info">
	        				<div>주소</div>
	        				<div>서울시 영등포구 주소주소 주소주송</div>
	        			</div>
	        		</div>
	        		<div class="content-box3">
	        			<div class="content-product">
	        				<div class="content-img-box">
	        					<div class="content-img"><img src="/resources/img/common/logo.png"></div>
	        					<div class="content-img-info">
	        						<div>빵이름제목</div>
	        						<div>1개</div>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	        		<div class="content-box4">
	        			<div class="content-price">
							<div class="content-info">
		        				<div>상품 가격</div>
		        				<div>10,000원</div>
		        			</div>
							<div class="content-info">
		        				<div>적립예정마일리지</div>
		        				<div>100원</div>
		        			</div>
							<div class="content-info">
		        				<div>배송비</div>
		        				<div>3,000원</div>
		        			</div>
							<div class="content-info">
		        				<div>최종 결제 금액</div>
		        				<div>13,000원</div>
		        			</div>
	        			</div>
	        		</div>
	        		<div class="content-box5">
	        			<div class="order-cancel">
	        				<a href="/orderCancel.do?orderNo=${o.orderNo }">
	        					<div>주문 취소</div>
	        				</a>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		const selectList = $(".selectList li");
		selectList.on("click",function(){
			selectList.css("background-color","#f5f2f3").css("color","gray");
			$(this).css("background-color","lightgray").css("color","black");
		});
	</script>
</body>
</html>