<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: heewonseo
  Date: 2021/11/09
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/leftmobile.css?ver=102">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/modal.css?ver=1">

<c:set var="member_id" value="${sessionScope.member_id}"/>

<input id="toggle_menu" type="checkbox" />

<div id="wrap">
    
    <header id="main_header">
    
    <label class="mobile_menu hambuger" id="mobile_menu" for="toggle_menu">
    	<span></span>
    	<span></span>
    	<span></span>
    </label><!--//토글메뉴-->
    
		<nav id="main_nav">
 
			<label class="menu_close hambugerclose" for="toggle_menu">
				<span></span>
    			<span></span>
    			<span></span>
			</label>
		 
			 <div class="menu_in">
			 	
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
			 
			   	   <span class="menu-item inactive"><a href="${pageContext.request.contextPath}/"><i class="fas fa-home"></i>HOME</a></span>
			       <span class="menu-item boxlist"><a
			               href="${pageContext.request.contextPath}/box/list?member_id=${member_id}"><i
			               class="far fa-list-alt"></i> 박스 리스트</a></span>
			       <span class="menu-item inactive createview"><a href="${pageContext.request.contextPath}/box/createview"><i
			               class="far fa-plus-square"></i> 박스 생성</a></span>
			       <span class="menu-item inactive joingroup"><a href="#" data-target="group" data-toggle="modal"><i
			               class="far fa-envelope"></i> 박스 참여</a></span>
			       <span class="menu-item inactive qnaboard"><a href="${pageContext.request.contextPath}/board/listPerPage"><i
			               class="far fa-question-circle"></i> Q&A</a></span>
			       <span class="menu-item inactive logout"><a href="/member/logout"><i
			               class="fas fa-sign-out-alt"></i> 로그아웃</a></span>
			   </div>
    
			<label class="menu_bg_close" for="toggle_menu"></label><!--토글옆부분 검정색닫기-->
		</nav>
	</header>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/leftmobilemenu.js?ver=1"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=3"></script>
<script type="application/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/modal.js?ver=3"></script>

</html>
