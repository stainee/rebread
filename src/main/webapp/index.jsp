<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리브레드</title>
<link rel="icon" href="/resources/img/common/">
<link rel="stylesheet" href="/resources/css/common/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!--aos라이브러리-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!--메인 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@100&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<!--상단의 빵 슬라이드-->
		<div class="topSlide">
			<ul id="slider1">
				<li><a href="#"><img src="/resources/img/main/mainslide1.jpg"></a></li>
				<li><a href="#"><img src="/resources/img/main/mainslide2.jpg"></a></li>
				<li><a href="#"><img src="/resources/img/main/mainslide3.jpg"></a></li>
			</ul>
		</div>
		<div class="main-section-ment">
			<ul>
				<li>
					<p style="margin-bottom: 15px;">
						<font size="5em" color="#785c37"> <span
							data-aos="fade-down" data-aos-duration="1000"
							data-aos-delay="500">R </span> <span data-aos="fade-down"
							data-aos-duration="1000" data-aos-delay="750">E </span> <span
							data-aos="fade-down" data-aos-duration="1000"
							data-aos-delay="1000">B </span> <span data-aos="fade-down"
							data-aos-duration="1000" data-aos-delay="1250">R </span> <span
							data-aos="fade-down" data-aos-duration="1000"
							data-aos-delay="1500">E </span> <span data-aos="fade-down"
							data-aos-duration="1000" data-aos-delay="1750">A </span> <span
							data-aos="fade-down" data-aos-duration="1000"
							data-aos-delay="2000">D </span>
						</font>
					</p>
					<h2 id="section-mid" data-aos="fade-right" data-aos-duration="2000"
						data-aos-delay="1500">
						판매자와 소비자 모두 입장을 생각해 <br> 환경보호를 먼저 앞장서 나아가는 <br> 리브레드입니다.
					</h2>
					<p id="section-bottom">
						건강하고 친환경적인 비건문화 <br> 리브레드를 통해 만나보세요
					</p>
				</li>
			</ul>
		</div>

		<div class="best-item">
			<div class="item-title">
				<p>BEST-ITEM</p>
			</div>
			<div class="item-pic">
				<a href="#">
					<div>
						<img src="/resources/img/main/b-bread1.jpg">
						<div class="price-about">
							<div class="bread-name">소금빵</div>
							<div class="bread-price">
								3,000<span>원</span>
							</div>
						</div>
					</div>
				</a> <a href="#">
					<div>
						<img src="/resources/img/main/b-bread2.jpg">
						<div class="price-about">
							<div class="bread-name">타르트</div>
							<div class="bread-price">
								2,500<span>원</span>
							</div>
						</div>
					</div>
				</a> <a href="#">
					<div>
						<img src="/resources/img/main/b-bread3.jpg">
						<div class="price-about">
							<div class="bread-name">식 빵</div>
							<div class="bread-price">
								4,500<span>원</span>
							</div>
						</div>
					</div>
				</a> <a href="#">
					<div>
						<img src="/resources/img/main/b-bread4.jpg">
						<div class="price-about">
							<div class="bread-name">마늘바게트</div>
							<div class="bread-price">
								8,000<span>원</span>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="main-search">
			<div class="search-bar">
				<form action="#" method="post">
					<input id="searchText" type="text" name="searchText" placeholder="원하는 빵을 입력해보세요"> <span><img
						src="/resources/img/main/loupe.png"></span>
				</form>
			</div>
			<div id="frequent-word">
				<a href="#">#케이크</a> 
				<a href="#">#소금빵</a> 
				<a href="#">#로스빵</a> 
				<a href="#">#마늘바게트</a>
			</div>
		</div>

		<div class="main-mid">
			<div class="mid-pic">
				<a href="#"><img src="/resources/img/main/mid1.jpg" data-aos="fade-up"
					data-aos-duration="1500" data-aos-offset="500"></a>
				<p class="mid-title">비건 스타터</p>
				<p>환경을 생각하는 비건문화</p>
			</div>
			<div class="mid-pic">
				<a href="#"><img src="/resources/img/main/mdi2.jpg" data-aos="fade-down"
					data-aos-duration="1500" data-aos-offset="500"></a>
				<p class="mid-title">비건 헬스</p>
				<p>비건과 함께 하는 헬스문화</p>
			</div>
			<div class="mid-pic">
				<a href="#"><img src="/resources/img/main/mid3.jpg" data-aos="fade-up"
					data-aos-duration="1500" data-aos-offset="500"></a>
				<p class="mid-title">회원등급에 따른 혜택보장</p>
				<p>회원에 따른 혜택을 확인해보세요</p>
			</div>
		</div>

		<div class="pic-scroll">
			<ul>
				<div class="scroll-title">
					<h2>B R A N D</h2>
					<p class="bar">
						<img src="/resources/img/main/straight-w.png">
					</p>
				</div>
			</ul>
			<ul class="banner">
				<li class="scroll-fade" data-aos="fade-up" data-aos-duration="1500"
					data-aos-offset="500"><a href="#"> <img
						src="/resources/img/main/main-banner-img.jpg">
				</a></li>
				<li class="text-scroll-fade" data-aos="fade-down"
					data-aos-duration="1500" data-aos-offset="500">
					<h2>리브레드가 드리는 일상속의 편리함</h2>
					<p class="ment">
						빵을 다시 굽는다는 뜻으로, "빵 주문·통판 플랫폼"입니다. <br> 전국의 엄선된 빵집이 만든 빵을 주문할
						수 있으며, <br> 남는 빵을 플랫폼을 통해 순환하는 구조로 환경보호와 함께 <br> 빵 최저가를
						보장하고 있습니다. <br> 맛과 환경보호를 함께하는 '리브레드' 지금 당장 함께 하세요!
					</p> <a href="#" id="brand-story"> BRAND STORY → </a>
				</li>
			</ul>
		</div>

		<div class="review">
			<div class="review-title">
				<h2>BEST-REVIEW</h2>
			</div>
			<p class="bar" id="bar">
				<img src="/resources/img/main/straight-b.png">
			</p>
			<ul>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread1.jpg">
							<div class="description">
								<p class="subject">만족</p>
								<p class="reContent">맛있습니다. 여기나오는 소금빵은 정말 제 최애 소금빵 감동입니다.. 꼭
									시켜먹으세요</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread2.jpg">
							<div class="description">
								<p class="subject">정말 맛있습니다</p>
								<p class="reContent">환경도 생각하고 기부도 하고 배송도 빠르고 친절합니다 정말</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread3.jpg">
							<div class="description">
								<p class="subject">리브레드 저의 최애 빵</p>
								<p class="reContent">정말 맛있습니다 매일매일 시켜먹고 싶고 또 먹고싶어요.</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread4.jpg">
							<div class="description">
								<p class="subject">만족</p>
								<p class="reContent">맛있습니다.</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread5.jpg">
							<div class="description">
								<p class="subject">냉동 빵은 정말 별로다..</p>
								<p class="reContent">냉동빵은 정말 시켜먹는게 아닌거 같습니다...</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread6.jpg">
							<div class="description">
								<p class="subject">만족</p>
								<p class="reContent">맛있습니다. 또 시켜먹을게요</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread7.jpg">
							<div class="description">
								<p class="subject">별로입니다..</p>
								<p class="reContent">무슨 맛인지 모르겠어요 유통기한 지난빵은 버립시다..</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point1.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread8.jpg">
							<div class="description">
								<p class="subject">언제시켜먹어도 맛있습니다.</p>
								<p class="reContent">늘시키는 빵인데 정말 맛있다?</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread9.jpg">
							<div class="description">
								<p class="subject">상태보세요</p>
								<p class="reContent">맛있는데 상태가 좀 이상해요 다른것도 그런건 아니겠죠?</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point2.gif">
								</p>
							</div>
						</div>
				</a></li>
				<li><a href="#">
						<div class="review-wrap">
							<img src="/resources/img/main/b-bread2.jpg">
							<div class="description">
								<p class="subject">만족</p>
								<p class="reContent">맛있습니다.</p>
								<p class="reDate">2022-10-24</p>
								<p class="point">
									<img src="/resources/img/main/ico_point5.gif">
								</p>
							</div>
						</div>
				</a></li>

			</ul>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<!-- AOS 스크립트 초기화 -->
<script>
	AOS.init();
</script>
<!-- //AOS 스크립트 초기화 -->
<div aos="fade-up" data-aos-offset="200" data-aos-easing="ease-out-cubic" data-aos-duration="500"></div>
<script src="/resources/js/common/main.js"></script>

</html>