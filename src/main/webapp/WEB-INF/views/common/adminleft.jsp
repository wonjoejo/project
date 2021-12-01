<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/left.css?ver=3">
<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/modal.css?ver=3">
-->
<c:set var="member_id" value="${sessionScope.member_id}"/>
<div class="side-menu">
   <div class="profile">

      <c:choose>
        <c:when test="${not empty photo_name}">
           <a href="#">
          <img
            src="https://intobox.s3.ap-northeast-2.amazonaws.com/${photo_path}${photo_name}"
          />
          </a>
        </c:when>
        <c:otherwise>
         <a href="#">
          <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png"/>
          </a>
        </c:otherwise>
      </c:choose>
        <p class="name">${member_id}</p>
      <p class="role">관리자</p>
    </div>
        
    <div class="menu">
    	<span class="menu-item active adminpage"><a
                href="${pageContext.request.contextPath}/admin/listPerPage"><i
                class="far fa-user-circle"></i>회원 관리</a></span>
        <span class="menu-item inactive qnaboard"><a href="${pageContext.request.contextPath}/board/listPerPage"><i
                class="far fa-question-circle"></i> Q&A</a></span>
        <span class="menu-item inactive logout"><a href="/member/logout"><i
                class="fas fa-sign-out-alt"></i> 로그아웃</a></span>
    </div>
</div>


<script type="application/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/modal.js?ver=3"></script>

</html>
