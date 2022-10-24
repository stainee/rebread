<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/common/managetemplate.css">
<link rel="stylesheet" href="/resources/css/admin/storeList.css">
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
				<table class="sellertbl">
					<tr>
						<th>판매자번호</th>
						<th>가게이름</th>
						<th>사업자등록번호</th>
						<th>계좌번호</th>
						<th>관리</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="info" onclick="viewStoreInfo()">정보</button>
							<button class="account" onclick="viewAccountInfo()">정산</button>
						</td>
					</tr>
				</table>
			</div>
         </div>
      
</div>
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
	
	function viewStoreInfo(){
		window.open("/storeDetail.do", "가게정보", "width=800px, height=600px, top=100px, left=250px");
	}
	function viewAccountInfo(){
		window.open("/storeAccount.do", "가게정보", "width=800px, height=600px, top=100px, left=250px");
	}
</script>
</html>