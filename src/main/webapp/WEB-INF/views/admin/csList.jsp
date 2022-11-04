<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/font/font.css">
<link rel="stylesheet" href="/resources/css/common/admin.css">
<link rel="stylesheet" href="/resources/css/admin/csList.css">
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
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
					
					<c:forEach items="${list}" var="cs">
						<tr>
							<td>${cs.csNo}</td>
							<td>${cs.csCategory}</td>
							<td>${cs.csContent}</td>
							<td>
								<button class="detail" onclick="viewMemberDetail(${cs.memberNo})">정보</button>
							</td>
							<td id="checkTd">
							<c:if test="${cs.csCheck eq 1}">
								<button class="check cancel" onclick="csCheck(this, ${cs.csNo},${cs.csCheck})">취소</button>
							</c:if>
							<c:if test="${cs.csCheck eq 0}">
								<button class="check complete" onclick="csCheck(this, ${cs.csNo},${cs.csCheck})">완료</button>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
       </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
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
	
	function viewMemberDetail(memberNo){
		window.open("/memberDetail.do?memberNo="+memberNo+"", "회원정보", "width=800px, height=600px, top=100px, left=250px");
	}
	
	function csCheck(obj, csNo, csCheck){
		$.ajax({
			url:"/CScheckUpdate.do?csNo="+csNo+"&csCheck="+csCheck+"",
			success:function(updateCheck){
				console.log(updateCheck);
			
				if(updateCheck==1){
					let btn = $("<button>").addClass("check").addClass("cancel");
					btn.html("취소");
					btn.attr("onclick", "csCheck(this, "+csNo+", 1)");
					$(obj).parent().append(btn);
					$(obj).remove();
				}
				else if(updateCheck==0){
					let btn = $("<button>").addClass("check").addClass("complete");
					btn.html("완료");
					btn.attr("onclick", "csCheck(this, "+csNo+", 0)");
					$(obj).parent().append(btn);
					$(obj).remove();
				}
			}
		})
	}
</script>
</html>