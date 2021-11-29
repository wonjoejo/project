<%--
  Created by IntelliJ IDEA.
  User: heewonseo
  Date: 2021/11/17
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <meta charset="UTF-8">
    <title>소중한 물건들을 모아, 인투박스</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
          sizes="16x16">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

    <!-- bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/index.css?ver=89">

</head>

<body>
<!-- header -->
<header>
    <nav id="headerwrap" class="" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="main-logo">
                <img src="resources/assets/img/main_logo.png" alt="메인로고">
            </a>
            <div class="top-right">
                <c:choose>
                    <c:when test="${sessionScope.member_id!=null}">
                        <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                            <span class="join-btn btn-scroll-up">내 박스 리스트</span>
                        </a>
                         <a href="${pageContext.request.contextPath}/member/logout">
                            <span class="login-btn btn-scroll-up">LOGOUT</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/member/register">
                            <span class="join-btn btn-scroll-up">JOIN</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/member/login">
                            <span class="login-btn btn-scroll-up">LOGIN</span>
                        </a>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </nav>
</header>

<!-- home -->
<section id="home">
  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      	<img src="${pageContext.request.contextPath}/resources/assets/img/slide1.png" class="d-block slide1" alt="...">
     	<div class="carousel-caption d-md-block">
	        <div class="pointfont">소중한 물건들을 모아,
		        <p class="boxfont">인투박스</p>
		        <a href="${pageContext.request.contextPath}/member/register"><p class="home-box">지금 무료로 시작<i class="fas fa-arrow-right"></i></p></a>
	        </div>
      	</div>	
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/assets/img/slide2.png" class="d-block slide1" alt="...">
      <div class="carousel-caption d-none d-md-block">
     	 <div class="slidegroub">
      		<p class="groubpoint">그룹 관리,</p>
	        <p>초대는 쉽게<br>권한은 필요한 만큼만</p>
        </div>
     </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/assets/img/slide3.png" class="d-block slide1" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <div class="slidegroub">
       		<p class="groubpoint">물품 리스트,</p>
	        <p>댓글 기능,<br>멘션 기능으로 상황 공유</p>
        </div>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</section>

<!--  -->
<section id="home_m">
  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      	<img src="${pageContext.request.contextPath}/resources/assets/img/slide1_m.png" class="d-block slide1" alt="...">
     	<div class="carousel-caption d-md-block">
        <div class="pointfont">소중한 물건들을 모아,
	        <p class="boxfont">인투박스</p>
	        <a href="${pageContext.request.contextPath}/member/register"><p class="home-box">지금 무료로 시작<i class="fas fa-arrow-right"></i></p></a>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/assets/img/slide2_m.png" class="d-block slide1" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/assets/img/slide3_m.png" class="d-block slide1" alt="...">
      </div>
    </div>
  </div>
</div>

</section>


<!-- section2 -->
<section id="section2">
    <div class="section2_wrap">
        <div class="content con1 fadeinleft">
            <p class="title1">너는 왜 맨날 똑같은 옷만 사? 👚</p>
            <p class="title1-1">있는 거 또 사고 환불하러 가지 마세요</p>
        </div>
        <div class="content con2 fadeinright">
            <p class="title2">복잡한 재고 관리 프로그램, 엑셀과는 안녕 👋</p>
            <p class="title2-2">우리 매장 재고 관리로 클릭 한 번으로 관리하세요<br><span>입고, 출고</span>도 한 번에 처리하세요</p>
        </div>
        <div class="content con3 fadeinleft2">
            <p class="title3">고등어 사놨다 구워먹어라 🐟</p>
            <p class="title3-3">쇼핑 리스트를 바로 바로 <span>가족</span>들과 <span>공유</span>하세요<br>
                <span>댓글 및 공유</span> 기능으로 가족, 친구, 동료들과 소통하세요</p>
        </div>
    </div>
</section>

<!-- section3 -->
<section id="section3">
    <div class="section3_wrap">
        <div class="sec3-title">
            <h1>인투박스 이용 방법</h1>
            <h3>문의사항은 <a href="${pageContext.request.contextPath}/board/listPerPage">Q&A 게시판</a> 을 이용해주세요.</h3>
		</div><!-- class="sec3-title" -->
		
    <div id="tabbar">
		<div class="title">
			<h3 class="active">회원가입</h3>
			<h3 class="">박스생성</h3>
			<h3 class="">그룹초대</h3>
		</div>

		<div class="description">
			<div class="active">
				<ul>
					<li>
						<img class="joinimg" src="${pageContext.request.contextPath}/resources/assets/img/join.png" />
						<div class="jointext">
							<p>
								<h1 class="jointext_p"><i class="fas fa-user"></i> 개인 / 기업 회원 <i class="fas fa-building"></i></h1>
								이용 고객에 맞는 회원 종류로 가입 가능<br>
								원하는 품목을 원하는 대로 정리<br>
								기업회원은 바코드 생성 가능<br>				
							</p>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="">
				<ul>
					<li>
						<img class="boxcreateimg" src="${pageContext.request.contextPath}/resources/assets/img/box.png" />
						<div class="boxcreatetext">
							<p>
								<h1 class="boxcreatetext_p"><i class="far fa-plus-square"></i> 박스생성 / 물품등록</h1>
								1. 원하는 모드로 박스 생성<br>
								2. 박스 , 물품 이미지 등록<br>  
								3. 나만의 카테고리 생성<br> 												
							</p>
						</div>
					</li>
				</ul>
			</div>
			
			<div>
				<ul>
					<li>
						<img class="groupimg" src="${pageContext.request.contextPath}/resources/assets/img/group.png" />
						<div class="grouptext">
							<p>
								<h1 class="grouptext_p"><i class="fas fa-users"></i> 그룹 초대</h1>
								참여 코드로 그룹 초대<br>
								마스터 회원이 그룹 멤버에게 권한부여<br>  											
							</p>
						</div>
					</li>
				</ul>
			</div>		
        </div><!-- description -->     
    </div><!-- section3_wrap -->
</section>

<footer>
	<p>All rights Reserved © 2021</p>

</footer>


</body>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/assets/js/index.js?ver=10"></script>
<script type="text/javascript">
$(document).ready(function() {

    let kakaoInfo = '${kakaoInfo}';

    if(kakaoInfo != ""){
        let data = JSON.parse(kakaoInfo);

        alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
        alert(
        "user : \n" + "email : "
        + data['email']  
        + "\n nickname : " 
        + data['nickname']);
    }
});  
</script>
</html>

