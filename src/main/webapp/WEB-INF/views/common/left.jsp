<%--
  Created by IntelliJ IDEA.
  User: heewonseo
  Date: 2021/11/09
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

    <!-- stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/left.css?ver=1">


<div class="side-menu">
    <div class="profile">
        <img src="${pageContext.request.contextPath}/resources/assets/img/logo6.png"/>
        <p class="name">name</p>
    </div>
    <div class="menu">
        <span class="menu-item active"><a href="${pageContext.request.contextPath}/box/list?member_id=${member_id}"><i class="far fa-list-alt"></i> 박스 리스트</a></span>
        <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/box/createview"><i class="far fa-plus-square"></i> 박스 생성</a></span>
        <span class="menu-item inactive"><a href="#"><i class="far fa-envelope"></i> 박스 참여</a></span>
        <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/board/listPerPage"><i class="far fa-question-circle"></i> Q&A</a></span>
        <span class="menu-item inactive"><a href="/member/logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a></span>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js"></script>

</html>
