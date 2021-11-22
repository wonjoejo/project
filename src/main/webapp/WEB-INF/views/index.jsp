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

    <meta charset="UTF-8">
    <title>소중한 물건들을 모아, 인투박스</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon-72x72.png"
          sizes="16x16">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon-72x72.png" sizes="16x16">

    <!-- bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/index.css?ver=1">

</head>

<body>
<!-- header -->
<header>
    <nav id="headerwrap" class="" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container">
            <a href="#" class="main-logo">
                <img src="resources/assets/img/main_logo.png" alt="메인로고">
            </a>
            <div class="top-right">
                <c:choose>
                    <c:when test="${sessionScope.member_id!=null}">
                        <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                            <span class="join-btn btn-scroll-up">내 박스 리스트</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="#">
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
    <div class="main-container">
        <img class="main-image" src="${pageContext.request.contextPath}/resources/assets/img/maincat.png">
        <!-- 지현, 21.11.06 -->
        <div class="pointfont">소중한 물건들을 모아,
            <p class="boxfont">인투박스</p>
            <a href="#"><p class="home-box">지금 무료로 시작<i class="fas fa-arrow-right"></i></p></a>
        </div>
        <!--            <h2 class="boxfont">인투박스</h2>-->
    </div>
</section>


<!-- section2 -->
<section id="section2">
    <div class="section2_wrap">
        <div class="content con1">
            <p class="title1">너는 왜 맨날 똑같은 옷만 사? 👚</p>
            <p class="title1-1">있는 거 또 사고 환불하러 가지 마세요</p>
        </div>
        <div class="content con2">
            <p class="title2">복잡한 재고 관리 프로그램, 엑셀과는 안녕 👋</p>
            <p class="title2-2">우리 매장 재고 관리로 클릭 한 번으로 관리하세요<br><span>입고, 출고</span>도 한 번에 처리하세요</p>
        </div>
        <div class="content con3">
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
            <h3>문의사항은 Q&A 게시판을 이용해주세요.</h3>
        </div>
    </div>

</section>


</body>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/assets/js/index.js?ver=1"></script>
</html>

