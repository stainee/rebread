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
<link rel="stylesheet" href="/resources/css/admin/memberModifyModal.css">
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
								<button class="modalInfo" onclick="viewModal(${m.memberNo})">모달</button>
								<button class="info" onclick="viewMemberDetail(${m.memberNo})">정보</button>
								<button class="remove" onclick="deleteMember(${m.memberNo})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
         </div>
 
</div>
<div class="modal">
	<div class="modal_wrap">
		<div class="title_wrapper">
				<p>정보 수정</p>
			</div>
			<div class="content_container">
				<table class="membertbl modaltbl">
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
								<select id="memberGrade">
									<option value=0>관리자</option>
									<option value=1>일반회원</option>
									<option value=2>판매자</option>
								</select>
							</c:if>
							<c:if test="${m.memberGrade eq 1 }" >
								<select id="memberGrade">
									<option value=1>일반회원</option>
									<option value=0>관리자</option>
									<option value=2>판매자</option>
								</select>
							</c:if>
							<c:if test="${m.memberGrade eq 2 }" >
								<select id="memberGrade">
									<option value=2>판매자</option>	
									<option value=1>일반회원</option>
									<option value=0>관리자</option>
								</select>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<th>마일리지</th>
						<td><input type="text" value="${m.memberMileage}" id="memberMileage"></td>
					</tr>
				</table>
				<div class="btn_wrap">
					<button class="modify">수정</button>
					<button class="complete" onclick="closeModal()">확인</button>
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
	
	function viewModal(memberNo){
		$.ajax({
			url:"/memberModify.do",
			success:function(data){
				console.log(data);
				
			}
		})
		$(".modal").css("display","block");
	}
	function closeModal(){
		$(".modal").css("display","none");
	}
</script>
</html>