<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/admin/memberList.css">
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
				<table class="membertbl">
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>관리</th>
					</tr>				
					<c:forEach items="${list}" var="m">
						<tr>
							<td>${m.memberNo }</td>
							<td>${m.memberId }</td>
							<td>${m.memberName}</td>
							<td>${m.memberPhone}</td>
							<td>
								<button class="info" onclick="viewMemberDetail(${m.memberNo})">정보</button>
								<button class="remove" onclick="deleteMember(${m.memberNo})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
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
	
	function viewMemberDetail(memberNo){
		window.open("/memberModify.do?memberNo="+memberNo+"", "회원정보", "width=800px, height=600px, top=100px, left=250px");
	}
	
	function deleteMember(memberNo){
		$.ajax({
			url:"/memberDelete.do?memberNo="+memberNo+"",
			success:function(){
				window.location.reload();
			}
			
		})
	}
</script>
</html>