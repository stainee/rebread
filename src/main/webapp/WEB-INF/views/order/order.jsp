<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://js.tosspayments.com/v1"></script>
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/order/order.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="content">
        <div class="content-wrap">
            <div class="deliver-wrap" style="width: 40%;">
                <p>배달내역</p>
                
                <div class="deliver-product">
                    <table>
                		<!-- for문 시작 -->
                        <tr>
                            <td rowspan="2"><img src="/resources/img/common/blog.png" style="margin: 10px;"></td>
                            <td style="width: 80%;">빵이름길고길고길어</td>
                            <td style="width: 15%;">1개</td>
                        </tr>
                        <tr>
                            <td style="color: #cbcbcb; font-size: 0.9em;">설명설명설명설명설명설명</td>
                            <td class="product-price" style="color: #cbcbcb; font-size: 0.9em;">20000원</td>
                        </tr>
		                <!-- for문 종료 -->
                    </table>
                </div>

                <div class="product-total">
                    <div class="one">
                        <span>상품가격</span>
                        <span class="product-total-price">20000원</span>
                    </div>
                    <div class="two">
                        <span>배송비</span>
                        <span class="product-delivery-price">3000원</span>
                    </div>
                    <div class="three">
                        <span>적립예정마일리지</span>
                        <span class="product-mileage">100원</span>
                    </div>
                    <div class="four">
                        <span>결제금액</span>
                        <span class="product-final-price">20000원</span>
                    </div>
                </div>

            </div>

            <div class="line"></div>
        
            <div class="deliver-addr-wrap">
                <div class="deliver-addr-content" style="width: 40%;">
                    <p>배송지정보</p>
                    <button type="button" class="deliver-addr-update">수정</button>
                    <button type="button" class="deliver-addr-complete" style="display:none;">완료</button>
                    <div class="deliver-addr">
                    	<div class="addr-box">
                        	<input type="text" id="orderName" value="${sessionScope.m.memberName}" readonly="readonly">
                        </div>
                        <div class="addr-box">
                        	<input type="text" id="orderAddr" value="${sessionScope.m.memberAddr}" readonly="readonly">
                        </div>
                        <div class="addr-box">
                        	<input type="text" id="orderPhone" value="${sessionScope.m.memberPhone}" readonly="readonly">
                        </div>
                        <div class="addr-box">
                        	<input type="text" id="orderEmail" value="${sessionScope.m.memberMail}" readonly="readonly">
                        </div>
                    </div>
                </div>
                <div class="pay-method" style="width: 40%;">
                    <p>결제수단선택</p>
                    <div id="pay-card">
                    	<div class="pay-card-wrap">
                    		<img src="/resources/img/order/card.svg">
                    		<div class="pay-card-comment">신용/체크카드</div>
                    	</div>
                    </div>
                    <button id="pay-card">
                    	<div class="pay-card-comment">결제하기</div>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	<script>
	
		// 배송지정보
		const update = $(".deliver-addr-update");
		const complete = $(".deliver-addr-complete");
		const inputText = $(".addr-box input");
		update.on("click",function(){
			// 수정 버튼 클릭
			update.hide();
			complete.show();
			$(".addr-box input").removeAttr("readonly");
			inputText.css("text-decoration","underline");
			complete.on("click",function(){
				// 완료 버튼 클릭
				update.show();
				complete.hide();
				$(".addr-box input").attr("readonly","readonly");
				inputText.css("text-decoration","none");
			});
		});
	

	
		// 가격
		
		
		// 결제 api
    	var clientKey = 'test_ck_YPBal2vxj81njJPnPLe35RQgOAND'
    	var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
    	
    	// orderId에 들어갈 현재시간
    	var today = new Date();
    	
    	var year = today.getFullYear();
    	var month = ('0' + (today.getMonth() + 1)).slice(-2);
    	var day = ('0' + today.getDate()).slice(-2);
    	
    	var hours = ('0' + today.getHours()).slice(-2);
    	var minutes = ('0' + today.getMinutes()).slice(-2);
    	var seconds = ('0' + today.getSeconds()).slice(-2);
    	
    	// 현재날짜+현재시간까지
    	var todayString = year+month+day+hours+minutes+seconds;
    	
    	const payCard = $("#pay-card");
    	const memberId = $("[name=memberId]").val();
    	
    	payCard.on("click", function(){
    		// 배송지 정보
    		const orderName = $("#orderName").val();
    		const orderAddr = $("#orderAddr").val();
    		const orderPhone = $("#orderPhone").val();
    		const orderEmail = $("#orderEmail").val();
    		
	    	console.log(orderName);
	    	console.log(orderAddr);
	    	console.log(orderPhone);
    		$.ajax({
    			  type: "POST",
    			  url: "/insertOrder.do",
    			  data: 
    			  	{
    					orderName:orderName,
    					orderAddr:orderAddr,
    					orderPhone:orderPhone
    					
    			  	},
    			  success: function(){
				    	tossPayments.requestPayment('카드', { // 결제 수단 파라미터
				    		  // 결제 정보 파라미터
				    		  amount: 200,
				    		  orderId: memberId+'-'+todayString,
				    		  orderName: '토스 티셔츠 외 2건',
				    		  customerName: '박토스',
				    		  successUrl: 'http://localhost:8888/success.do',
				    		  failUrl: 'http://localhost:8888/fail.do'
				    	});
    			  }  
    		});  

    	});
    	
    	
    	
    	
    	
	</script>
    
   	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>