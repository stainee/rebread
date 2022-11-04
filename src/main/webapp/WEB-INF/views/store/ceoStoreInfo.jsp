<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-가게 정보</title>
</head>
<link rel="stylesheet" href="resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/store/ceoStoreInfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="total_wrapper">
        <div class="left_container">
            <div class="memberInfo">
                <p>[사장]</p>
                <p>${sessionScope.m.memberName }<p>님</p></p>
            </div>
            <div class="selectList">
                <ul>
                	<li><a href="/ceoMain.do">내정보</a></li>
                    <li><a href="/ceoStoreInfo.do">가게 정보</a></li>
                    <li><a href="/ceoStoreSalesInfo.do">상품 판매 정보</a></li>
                </ul>
            </div>
        </div>

        <div class="right_container">
            <div class="content_container">
                <div class="navi_box">가게 정보
                    <button class="navi_btn">가게 등록</button>
                </div>
                
                <!-- 가게 리스트를 띄우는 div -->
                <c:forEach items="${list}" var="s">
                <div class="store_info_wrapper">
                    <div class="store_info_wrap_box">
                        <div class="store_info_left">
                            <div class="store_img">
                                <img src="resources/img/store/${s.storeImg }">
                            </div>
                            <div class="store_name">
                            	<input type="text" name="storeName" value="${s.storeName }" readonly>
                            </div>
                        </div>
                        <div class="store_info_right">
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 이름</div>
                                <div class="store_info_content">
                                	<input type="text" name="memberName" value="${sessionScope.m.memberName }" readonly>
                                </div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 번호</div>
                                <div class="store_info_content">
                                	<input type="text" name="storeAccount" value="${s.storeRegistNum }" readonly>
                                </div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 주소</div>
                                <div class="store_info_content">
                                	<input type="text" name="storeAddr" value="${s.storeAddr }" readonly>
                                </div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 번호</div>
                                <div class="store_info_content">
                                	<input type="text" name="storePhone" value="${s.storePhone }" readonly>
                                </div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">계좌 번호</div>
                                <div class="store_info_content">
                                	<input type="text" name="storeAccount" value="${s.storeAccount }" readonly>
                                </div>
                                <button class="store_sale_btn">매출 현황</button>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">영업 시간</div>
                                <div class="store_info_content">
                                	<input type="text" name="openTime" value="${s.openTime }" readonly> ~ <input type="text" name="closeTime" value="${s.closeTime }" readonly>
                                </div>
                                <input type="hidden" name="storeNo" value="${s.storeNo }">
                                <button class="store_edit_btn">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <!-- 가게 등록창을 띄우는 div -->
                <div class="store_insert_wrapper">
	                <form action="/storeInsert.do" method="post" enctype="multipart/form-data">
                	<div class="store_insert_form">
                		<div class="store_insert_title">매장명</div>
                		<div class="store_insert_input">
                			<input type="text" name="storeName" value="${storeName }">
                		</div>
	                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">매장 주소</div>
                		<div class="store_insert_input">
                			<input type="text" name="storeAddr" value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">매장 전화번호</div>
                		<div class="store_insert_input">
                			<input type="text" name="storePhone" value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">매장 이미지</div>
                		<div class="store_insert_input">
                			<input type="file" name="storeImg" multiple value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">계좌 번호</div>
                		<div class="store_insert_input">
                			<input type="text" name="storeRegistNum" value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">사업자 번호</div>
                		<div class="store_insert_input">
                			<input type="text" name="storeAccount" value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">오픈 시간</div>
                		<div class="store_insert_input">
                			<input type="text" name="openTime" value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">마감 시간</div>
                		<div class="store_insert_input">
                			<input type="text" name="closeTime" value="">
                		</div>
                	</div>
                	<div class="store_insert_form">
                		<div class="store_insert_title">매장 정보</div>
                		<div class="store_insert_input">
                			<textarea name="storeContent"></textarea>
                		</div>
                	</div>
                	<div class="store_insert_btn_box">
                		<button type="submit" class="store_insert_btn" >가게 등록하기</button>
                	</div>
                	</form>
                </div>
                
                <div class="navi_box_footer">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- 
                <div class="more_btn_box">
             		<button class="more_btn">더보기</button>
             	</div>
                -->
              
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
});
selectList.eq(0).click();

$(".navi_btn").on("click",function(){
	$(".navi_btn").css("display","none");
	$(".navi_box").text("가게 등록");
	$(".store_insert_wrapper").css("display","block");
	$(".store_info_wrapper").css("display","none");
	$(".navi_box_footer").css("display","none");
});

$(".store_edit_btn").on("click",function(){
	location.href="/storeInfoUpdate.do?storeNo="+$(this).prev().val();
});
</script>
</html>