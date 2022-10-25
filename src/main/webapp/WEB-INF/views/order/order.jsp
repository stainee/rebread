<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://js.tosspayments.com/v1"></script>
<link rel="stylesheet" href="/resources/css/order/order.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="content">
        <div class="content-wrap">
            <div class="deliver-wrap" style="width: 40%;">
                <p>배달내역</p>
                
                <!-- for문 시작 -->
                <div class="deliver-product">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="img/koalaLogo.png" style="margin: 10px;"></td>
                            <td style="width: 80%;">빵이름길고길고길어</td>
                            <td style="width: 15%;">1개</td>
                        </tr>
                        <tr>
                            <td style="color: #cbcbcb; font-size: 0.9em;">설명설명설명설명설명설명</td>
                            <td style="color: #cbcbcb; font-size: 0.9em;">20000원</td>
                        </tr>
                    </table>
                </div>
                <!-- for문 종료 -->

                <div class="product-total">
                    <div class="one">
                        <span>상품가격</span>
                        <span>20000원</span>
                    </div>
                    <div class="two">
                        <span>배송비</span>
                        <span>0원</span>
                    </div>
                    <div class="three">
                        <span>적립예정마일리지</span>
                        <span>100원</span>
                    </div>
                    <div class="four">
                        <span>결제금액</span>
                        <span>20000원</span>
                    </div>
                </div>

            </div>

            <div class="line"></div>
        
            <div class="deliver-addr-wrap">
                <div class="deliver-addr-content" style="width: 40%;">
                    <p>배송지정보</p>
                    <a href="#" class="deliver-addr-update">수정</a>
                    <div class="deliver-addr">
                        <p>김철수</p>
                        <p>서울시 영등포구 어쩌구저쩌구</p>
                        <p>010-1234-1234</p>
                        <p>abc123@naver.com</p>
                    </div>
                </div>
                <div class="pay-method" style="width: 40%;">
                    <div>결제수단선택</div>
                    <button id="pay-card">신용카드</button>
                </div>

            </div>
        </div>
    </div>
    
	<script>
    	var clientKey = 'test_ck_YPBal2vxj81njJPnPLe35RQgOAND'
    	var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
    	
    	const payCard = $("#pay-card");
    	payCard.on("click", function(){
	    	tossPayments.requestPayment('카드', { // 결제 수단 파라미터
	    		  // 결제 정보 파라미터
	    		  amount: 1000,
	    		  orderId: 'qAEh-NXsikEBPnZu_ehkn',
	    		  orderName: '토스 티셔츠 외 2건',
	    		  customerName: '박토스',
	    		  successUrl: 'http://localhost:8888/success',
	    		  failUrl: 'http://localhost:8888/fail',
	    	})
    	});
	</script>
    
   	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>