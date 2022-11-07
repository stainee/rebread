<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/member/memberReview.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="total_wrapper" style="justify-content: center;">
        <div class="left_container" style="max-height: 357px;">
            <div class="memberInfo">
                <p>[고객]</p>
                <p>${sessionScope.m.memberName }님</p>
                <div class="member-point">내 마일리지 : ${sessionScope.memberMileage }원</div>
            </div>
            <div class="selectList">
                <ul>
                	<li><a href="/memberMain.do?memberNo=${sessionScope.m.memberNo }">내정보</a></li>
                    <li><a href="/memberOrderList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1">최근 주문 내역</a></li>
                    <li><a href="/memberReview.do?memberNo=${sessionScope.m.memberNo }">내 등록 리뷰</a></li>
                </ul>
            </div>
        </div>

        <div class="right_container" style="min-height: 357px;">
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
	<script>
		index=2;
		$(function(){
			let total = $(".selectList a").length;
			for(let i=0; i<total; i++){
				$(".selectList a").eq(i).removeClass("index");
			}
			$(".selectList a").eq(index).addClass("index");
		});
	</script>
</body>
</html>