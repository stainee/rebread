<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/admin/memberModify.css">
</head>
<body>
	<div class="detail_container">
		<div class="title_wrapper">
			<p>정보 수정</p>
		</div>
		<div class="content_container">
			<table class="membertbl">
				<tr>
				 	<th>회원번호</th>
				 	<td><input type="text" value="${m.memberNo}" id="memberNo" readonly></td>
				</tr>
				<tr>
				 	<th>아이디</th>
				 	<td><input type="text" value="${m.memberId }" id="memberId"></td>
				</tr>
				
				<tr>
				 	<th>이름</th>
				 	<td><input type="text"value="${m.memberName }" id="memberName"></td>
				</tr>
				
				<tr>
				 	<th>전화번호</th>
				 	<td><input type="text" value="${m.memberPhone}" id="memberPhone"></td>
				</tr>
				
				<tr>
				 	<th>이메일</th>
				 	<td><input type="text" value="${m.memberMail}" id="memberMail"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input type="text" value="${m.memberAddr}" id="memberAddr"></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>
						<c:if test="${m.memberGrade eq 0}">
							<input type="text" value="관리자">
							<input type="hidden" value=0 id="memberGrade">
						</c:if>
						<c:if test="${m.memberGrade eq 1 }" >
							<input type="text" value="일반회원">
							<input type="hidden" value=1 id="memberGrade">
						</c:if>
						<c:if test="${m.memberGrade eq 2 }" >
							<input type="text" value="판매자">
							<input type="hidden" value=2 id="memberGrade">
						</c:if>
					</td>
				</tr>
				
				<tr>
					<th>마일리지</th>
					<td><input type="text" value="${m.memberMileage}" id="memberMileage"></td>
				</tr>
			</table>
			<div class="btn_wrap">
				<button type="submit" class="modify">수정</button>
				<button class="complete" onclick="window.close()">확인</button>
			</div>
		</div>
	</div>
</body>
<script>
	$(".modify").on("click",function(){
		const memberNo = $("#memberNo").val();
		const memberId = $("#memberId").val();
		const memberName = $("#memberName").val();
		const memberPhone = $("#memberPhone").val();
		const memberMail = $("#memberMail").val();
		const memberAddr = $("#memberAddr").val();
		const memberGradeVal = $("#memberGrade").val();
		const memberMileage = $("#memberMileage").val();
		let memberGrade;
		if(memberGradeVal=="관리자"){
			memberGrade = 0;
		}else if(memberGradeVal=="일반회원"){
			memberGrade = 1;
		}else if(memberGradeVal=="판매자"){
			memberGrade = 2;
		}
		$.ajax({
			url:"/memberUpdate.do",
			data:{
				memberNo:memberNo,
				memberId:memberId,
				memberName:memberName,
				memberPhone:memberPhone,
				memberMail:memberMail,
				memberAddr:memberAddr,
				memberGrade:memberGrade,
				memberMileage:memberMileage
			},
			success:function(){
				opener.location.reload();
				window.close();
			}
		})
	})
</script>

</html>