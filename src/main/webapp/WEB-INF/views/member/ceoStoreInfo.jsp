<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-가게 정보</title>
</head>
<link rel="stylesheet" href="resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/member/ceoStoreInfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="total_wrapper">
        <div class="left_container">
            <div class="memberInfo">
                <p>[사장]</p>
                <p>최선우님</p>
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
                <div class="navi_box">가게 정보 수정
                    <button class="navi_btn">가게 등록</button>
                </div>
                <div class="store_info_wrapper">
                    <div class="store_info_wrap_box">
                        <div class="store_info_left">
                            <div class="store_img">
                                <img src="resources/img/member/testImg.png">
                            </div>
                            <div class="store_name">파리바게트</div>
                        </div>
                        <div class="store_info_right">
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 이름</div>
                                <div class="store_info_content">최선우</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 번호</div>
                                <div class="store_info_content">111111-222222</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 주소</div>
                                <div class="store_info_content">정보교육원</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 번호</div>
                                <div class="store_info_content">02-111-2222</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">계좌 번호</div>
                                <div class="store_info_content">1002-355-203254</div>
                                <button class="store_sale_btn">매출 현황</button>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">영업 시간</div>
                                <div class="store_info_content">09 : 00 ~ 20 : 00</div>
                                <button class="store_edit_btn">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="store_info_wrapper">
                    <div class="store_info_wrap_box">
                        <div class="store_info_left">
                            <div class="store_img">
                            <img src="resources/img/member/testImg.png">
                            </div>
                            <div class="store_name">파리바게트</div>
                        </div>
                        <div class="store_info_right">
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 이름</div>
                                <div class="store_info_content">최선우</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 번호</div>
                                <div class="store_info_content">111111-222222</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 주소</div>
                                <div class="store_info_content">정보교육원</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 번호</div>
                                <div class="store_info_content">02-111-2222</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">계좌 번호</div>
                                <div class="store_info_content">1002-355-203254</div>
                                <button class="store_sale_btn">매출 현황</button>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">영업 시간</div>
                                <div class="store_info_content">09 : 00 ~ 20 : 00</div>
                                <button class="store_edit_btn">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="store_info_wrapper">
                    <div class="store_info_wrap_box">
                        <div class="store_info_left">
                            <div class="store_img">
                                <img src="resources/img/member/testImg.png">
                            </div>
                            <div class="store_name">파리바게트</div>
                        </div>
                        <div class="store_info_right">
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 이름</div>
                                <div class="store_info_content">최선우</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">사업자 번호</div>
                                <div class="store_info_content">111111-222222</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 주소</div>
                                <div class="store_info_content">정보교육원</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">매장 번호</div>
                                <div class="store_info_content">02-111-2222</div>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">계좌 번호</div>
                                <div class="store_info_content">1002-355-203254</div>
                                <button class="store_sale_btn">매출 현황</button>
                            </div>
                            <div class="store_info_form">
                                <div class="store_info_title">영업 시간</div>
                                <div class="store_info_content">09 : 00 ~ 20 : 00</div>
                                <button class="store_edit_btn">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="navi_box_footer">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	let index=1;
	$(function(){
		let total = $(".selectList a").length;
		for(let i=0; i<total; i++){
			$(".selectList a").eq(i).removeClass("index");
		}
		$(".selectList a").eq(index).addClass("index");
	})
</script>
</html>