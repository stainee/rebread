<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="navi_box">회원 정보 수정</div>
                <form action="/updateCeo.do" method="post" name="updateCeoFrm">
                <div class="my_info">
                    <div class="my_info_title">
                        <div class="title">기본 회원 정보</div>
                        <div class="title_btn_box">
                            <button type="submit" class="edit_btn">수정</button>
                        </div>
                    </div>
                    <div class="user_info">
                    	<input type="hidden" name="user_no" value="1">
                        <div class="user_info_title">이름</div>
                        <div class="user_info_content">
                            <input type="text" name="user_name" value="최선우" disabled>
                        </div>
                    </div>
                    <div class="user_info">
                        <div class="user_info_title">이메일</div>
                        <div class="user_info_content">
                            <input type="text" name="user_email" value="choisw1206@naver.com" disabled>
                        </div>
                    </div>
                    <div class="user_info">
                        <div class="user_info_title">비밀번호</div>
                        <div class="user_info_content">
                            <input type="password" name="user_password" value="111222" disabled>
                        </div>
                    </div>
                    <div class="user_info">
                        <div class="user_info_title">휴대폰 번호</div>
                        <div class="user_info_content">
                            <input type="text" name="user_phone" value="010-8318-1206" disabled>
                        </div>
                    </div>
                </div>
                </form>
                <div class="footer_box">
                    <button class="footer_box_btn">회원 탈퇴</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	let index=0;
	$(function(){
		let total = $(".selectList a").length;
		for(let i=0; i<total; i++){
			$(".selectList a").eq(i).removeClass("index");
		}
		$(".selectList a").eq(index).addClass("index");
	})
	
	$(".edit_btn").on("click",function(){
		const memberName = $("#memberName").val();
		const memberMail = $("#memberMail").val();
		const memberPw = $("#memberPw").val();
		const memberPhone = $("#memberPhone").val();
		
		$.ajax({
			url:"/ceoUpdate.do",
			data:{
				memberName:memberName,
				memberMail:memberMail,
				memberPw:memberPw,
				memberPhone:memberPhone,
			},
			success:function(){
				opener.location.reload();
				//window.close();
			}
		})
	})
</script>
<script src="resources/js/member/ceoMain.js"></script>
</html>