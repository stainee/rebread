<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-내정보</title>
</head>
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/member/ceoMain.css">
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
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
                <div class="navi_box">회원 정보 수정</div>
                <form action="/updateCeo.do" method="post">
                <div class="my_info">
                    <div class="my_info_title">
                        <div class="title">기본 회원 정보</div>
                        <div class="title_btn_box">
                            <div class="edit_btn">수정</div>
                            <button type="submit" class="edit_complete_btn">완료</button>
                        </div>
                    </div>
                    <div class="user_info">
                    	<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
                        <div class="user_info_title">이름</div>
                        <div class="user_info_content">
                            <input type="text" name="memberName" value="${sessionScope.m.memberName }" readonly>
                        </div>
                    </div>
                    <div class="user_info">
                        <div class="user_info_title">이메일</div>
                        <div class="user_info_content">
                            <input type="text" name="memberMail" value="${sessionScope.m.memberMail }" readonly>
                        </div>
                    </div>
                    <div class="user_info">
                        <div class="user_info_title">비밀번호</div>
                        <div class="user_info_content">
                            <input type="password" name="memberPw" value="${sessionScope.m.memberPw }" readonly>
                        </div>
                    </div>
                    <div class="user_info">
                        <div class="user_info_title">휴대폰 번호</div>
                        <div class="user_info_content">
                            <input type="text" name="memberPhone" value="${sessionScope.m.memberPhone }" readonly>
                        </div>
                    </div>
                </div>
                </form>
                <div class="footer_box">
                    <button class="footer_box_btn" onclick="deleteMember(${sessionScope.m.memberNo})">회원 탈퇴</button>
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
	
</script>
<script src="resources/js/member/ceoMain.js"></script>
</html>