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
<link rel="stylesheet" href="/resources/css/admin/csList.css">
<body>
<div class="total_wrapper">
        <div class="left_container">
            <div class="memberInfo">
                <p>[관리자]</p>
                <p>박예진님</p>
            </div>
            <div class="selectList">
                <ul>
                	<li><a href="/adminMain.do">내정보</a></li> 
                    <li><a href="/storeList.do">가게관리</a></li>
                    <li><a href="/memberList.do">회원관리</a></li>
                    <li><a href="/csList.do">문의관리</a></li>
                </ul>
            </div>
        </div>

        <div class="right_container">
            <div class="content_container">
				<table class="cstbl">
					<tr>
						<th>상담번호</th>
						<th>상담종류</th>
						<th>상담내용</th>
						<th>회원정보</th>
						<th>관리</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="detail" onclick="viewMemberDetail()">정보</button>
						</td>
						<td>
							<button class="complete">완료</button>
						</td>
					</tr>
				</table>
			</div>
       </div>
</div>
</body>
<script>
	let index=3;
	$(function(){
		let total = $(".selectList a").length;
		for(let i=0; i<total; i++){
			$(".selectList a").eq(i).removeClass("index");
		}
		$(".selectList a").eq(index).addClass("index");
	})
	
	function viewMemberDetail(){
		window.open("/memberDetail.do", "회원정보", "width=800px, height=600px, top=100px, left=300px");
	}
</script>
</html>