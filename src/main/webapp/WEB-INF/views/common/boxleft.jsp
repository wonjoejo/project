<%--
  Created by IntelliJ IDEA.
  User: heewonseo
  Date: 2021/11/09
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="permit" value="${sessionScope.permission}"/>
<c:set var="box_no" value="${permit.box_no}"/>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/boxleft.css?ver=1">


<div class="side-menu">
    <div class="profile">
        <img src="${pageContext.request.contextPath}/resources/assets/img/logo6.png"/>
        <p class="name">${sessionScope.member_id}</p>
    </div>
    <div class="menu">
    	<span class="menu-item inactive"><a href="${pageContext.request.contextPath}/"><i class="fas fa-home"></i>HOME</a></span>
        <span class="menu-item active"><a
                href="${pageContext.request.contextPath}/box/detail?box_no=${box_no}">
                <i class="fas fa-archive"></i> 나의 박스</a></span>
        <span class="menu-item inactive"><a
                href="${pageContext.request.contextPath}/product/listPerPage?box_no=${box_no}">
                <i class="fas fa-list-alt"></i> 물품 리스트</a></span>
        <span class="menu-item inactive"><a
                href="${pageContext.request.contextPath}/category/detail?box_no=${box_no}"><i class="fas fa-table"></i> 카테고리</a></span>
        <span class="menu-item inactive"><a
                href="${pageContext.request.contextPath}/group/grouplist?box_no=${box_no}"><i
                class="fas fa-user-friends"></i> 그룹</a></span>
        <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/chart/get?box_no=${box_no}"><i
                class="far fa-chart-bar"></i> 차트</a></span>
        <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/member/logout"><i
                class="fas fa-sign-out-alt"></i> 로그아웃</a></span>

        <c:if test="${permit.write_per eq 0}">
            <div class="product-create-btn">
                <a href="${pageContext.request.contextPath}/product/insertview?box_no=${box_no}">
                <span>
                    <i class="fas fa-plus"></i>
                    물품 등록
                </span>
                </a>
            </div>
        </c:if>

    </div>
</div>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>


</html>


