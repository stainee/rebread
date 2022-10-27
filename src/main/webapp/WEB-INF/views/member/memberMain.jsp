<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	                <p>방우현님</p>
	                <div class="member-point">내 마일리지 : 1000원</div>
	            </div>
	            <div class="selectList">
	                <ul>
	                	<li>내정보</li> 
	                    <li>최근 주문 내역</li>
	                    <li>내 등록 리뷰</li>
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
							<div>방우현</div>
						</div>
						<div class="content-info">
							<div>연락처</div>
							<div>010-1234-1234</div>
						</div>
						<div class="content-info">
							<div>주소</div>
							<div>서울시 영등포구 주소주소</div>
						</div>
					</div>
					<div class="content-info-wrap">
						<div class="content-update">
							<div>기본 회원 정보</div>
							<div>수정</div>
						</div>
						<div class="content-info">
							<div>이름</div>
							<div>방우현</div>
						</div>
						<div class="content-info">
							<div>이메일</div>
							<div>abc123@naver.com</div>
						</div>
						<div class="content-info">
							<div>비밀번호</div>
							<div>비밀번호 설정</div>
						</div>
						<div class="content-info">
							<div>휴대폰 번호</div>
							<div>010-1234-1234</div>
						</div>
					</div>
					<div class="member-withdraw">
						<a href="#">회원탈퇴</a>
					</div>
					
	            </div>
	            
	            <!-- 최근 주문 내역 -->
	            <div class="content_container" onclick="goToDetailOrder(${o.orderNo})">
	            	<div class="content-box">
	            		<div class="content-img"><img src="/resources/img/common/logo.png"></div>
	            		<div class="content-wrap">
	            			<div class="content-status-date">
		            			<div class="deliver-status">배송완료</div>
		            			<span>ㅣ</span>
		            			<div class="order-date">2022.22.22</div>
	            			</div>
	            			<div class="content-product-name">빵이름상품이름</div>            		
	            		</div>
	            	</div>
	            	<div class="content-box">
	            		<div class="content-img"><img src="/resources/img/common/logo.png"></div>
	            		<div class="content-wrap">
	            			<div class="content-status-date">
		            			<div class="deliver-status">배송완료</div>
		            			<span>ㅣ</span>
		            			<div class="order-date">2022.22.22</div>
	            			</div>
	            			<div class="content-product-name">빵이름상품이름</div>            		
	            		</div>
	            	</div>
	            </div>
	            
	            <!-- 내 등록 리뷰 -->
	            <div class="content_container" onclick="goToDetailReview()">
					<div class="content-box">
	            		<div class="content-img"><img src="/resources/img/common/logo.png"></div>
	            		<div class="content-wrap">
	            			<div class="content-status-date">
		            			<div class="deliver-status">파리바게뜨 당산점</div>
		            			<span>ㅣ</span>
		            			<div class="order-date">2022.22.22</div>
	            			</div>
	            			<div class="content-product-name">리뷰제목너무마싯어용</div>            		
	            		</div>
	            	</div>
	            	<div class="content-box">
	            		<div class="content-img"><img src="/resources/img/common/logo.png"></div>
	            		<div class="content-wrap">
	            			<div class="content-status-date">
		            			<div class="deliver-status">배송완료</div>
		            			<span>ㅣ</span>
		            			<div class="order-date">2022.22.22</div>
	            			</div>
	            			<div class="content-product-name">빵이름상품이름</div>            		
	            		</div>
	            	</div>
	            </div>
	        </div>
	    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
	<script>
		const selectList = $(".selectList li");
		selectList.on("click",function(e){
			selectList.css("background-color","#f5f2f3").css("color","gray");
			$(this).css("background-color","lightgray").css("color","black");
			
			const index = selectList.index(this);
			
			
			
			$(".content_container").hide();
			$(".content_container").eq(index).fadeIn(0.6*1000);
			e.stopPropagation();
		});
		selectList.eq(0).click();
		
		function goToDetailOrder(orderNo){
			loaction.href="/mypageOrderDetail.do?orderNo="+orderNo;
		}
	</script>
</body>
</html>