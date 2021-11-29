<%-- Created by IntelliJ IDEA. User: heewonseo Date: 2021/11/09 Time: 21:02 To change this template use File | Settings
    | File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <html>


        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
            sizes="16x16">
        <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- font awesome -->
        <script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

        <!-- stylesheets -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/groupleft.css?ver=1">


        <div class="side-menu">
           <div class="profile">

      <c:choose>
      <c:when test="${fn:contains(photo_name, 'kakao')}">
          <a href="${pageContext.request.contextPath}/member/myPage?member_id=${member_id}">
          <img
            src="${photo_name}"
          />
          </a>
      </c:when>
        <c:when test="${not empty photo_path}">
           <a href="${pageContext.request.contextPath}/member/myPage?member_id=${member_id}">
          <img
            src="https://intobox.s3.ap-northeast-2.amazonaws.com/${photo_path}${photo_name}"
          />
          </a>
        </c:when>
        <c:otherwise>
         <a href="${pageContext.request.contextPath}/member/myPage?member_id=${member_id}">
          <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png"/>
          </a>
        </c:otherwise>
      </c:choose>
        <p class="name">${member_id}</p>

    </div>
            <div class="menu">
                <span class="menu-item inactive"><a
                        href="${pageContext.request.contextPath}/box/list?member_id=${member_id}"><i
                            class="far fa-list-alt"></i> 박스 리스트</a></span>
                <span class="menu-item inactive"><a href="#"><i class="far fa-envelope"></i> 박스 참여</a></span>
                <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/group/grouplist?box_no=${box_no}"><i
                            class="far fa-plus-square"></i>그룹원 리스트</a></span>
                <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/group/permissionlist?box_no=${box_no}"><i
                            class="far fa-plus-square"></i> 그룹 권한 리스트</a></span>
                    <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/group/grouppermission?box_no=${box_no}"><i
                            class="far fa-plus-square"></i> 권한 설정</a></span>
                <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/board/list"><i
                            class="far fa-question-circle"></i> Q&A</a></span>
                <span class="menu-item inactive"><a href="/member/logout"><i class="fas fa-sign-out-alt"></i>
                        로그아웃</a></span>
            </div>
        </div>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js"></script>

        </html>