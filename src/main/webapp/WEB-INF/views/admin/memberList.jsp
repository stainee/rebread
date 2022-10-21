<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/admin/memberList.css">
<body>
<div class="totalWrapper">
        <div class="leftContainer">
            <div class="memberInfo">
                <p>[관리자]</p>
                <p>박예진님</p>
            </div>
            <div class="selectList">
                <ul>
                	<li><a href="/adminMain.do">내정보</a></li> 
                    <li><a href="/sellerList.do">판매자관리</a></li>
                    <li><a href="/memberList.do">회원관리</a></li>
                    <li><a href="#">문의관리</a></li>
                </ul>
            </div>
        </div>

        <div class="rightContainer">
            <div class="contentContainer">
				<table class="membertbl">
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>관리</th>
					</tr>
				</table>
			</div>
         </div>
       </div>
</div>
</body>
<script>
	let index=2;
	$(function(){
		let total = $(".selectList a").length;
		for(let i=0; i<total; i++){
			$(".selectList a").eq(i).removeClass("index");
		}
		$(".selectList a").eq(index).addClass("index");
	})
</script>
</html>