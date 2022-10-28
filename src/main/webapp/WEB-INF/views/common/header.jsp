<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<link rel="stylesheet" href="/resources/css/common/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    

<div class="wrap">
    <header>
        <div class="header-wrap1">
            <div class="header-top">
                <div class="header-left">
                    <span><a href="#">입점문의</a></span>
                </div>
                <div class="header-mid">
                    <a href="/">
                        <img src="/resources/img/common/logo.png">
                    </a>
                </div>
                <c:choose>
					<c:when test="${empty sessionScope.m}">
		                <div class="header-right">
		                    <ul>
		                        <li><a href="/loginFrm.do">로그인</a></li>
		                        <li><a href="/joinStep.do">회원가입</a></li>
		                        <li><a href="/loginFrm.do">주문내역</a></li>
		                        <li><a href="#">회원해택</a></li>
		                    </ul>
		                </div>
					</c:when>
					<c:otherwise>
						<div class="header-right">
		                    <ul>
		                        <li><a href="#">마이페이지</a></li>
		                        <li><a href="/logout.do">로그아웃</a></li>
		                        <li><a href="#">주문내역</a></li>
		                        <li><a href="#">회원해택</a></li>
		                    </ul>
		                </div>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </header>   
    <!-- sticky같은 경우는 부모가 body여야지만 작동한다.-->
    <nav class="header-wrap2">
        <div class="header-bottom">
            <a href="/"><img src="/resources/img/common/logo2.png" class="header-img"></a>       
            <div class="header-navi deactive">
                <ul>
                    <li><a href="#">브랜드스토리</a></li>
                    <li><a href="#">구입하기</a></li>
                    <li><a href="#">베스트세일</a></li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#">자주하는 질문</a></li>
                </ul>
            </div>
            <c:choose>
				<c:when test="${empty sessionScope.m }">
		            <div class="header-navi-login"><a href="/loginFrm.do">로그인</a></div>
				</c:when>
				<c:otherwise>
					<div class="header-navi-login"><a href="/loginFrm.do">마이페이지</a></div>		
				</c:otherwise>
			</c:choose>
        </div>
    </nav>
<script src="/resources/js/common/header.js"></script>


















