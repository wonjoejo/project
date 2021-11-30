<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/boxleftmobile.css?ver=112">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/modal.css?ver=2">

<c:set var="member_id" value="${sessionScope.member_id}"/>

<input id="toggle_menu" type="checkbox" />

<div id="wrap">
    
    <header id="main_header">
    
    <label class="mobile_menu hambuger" for="toggle_menu">
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
				        <img src="${pageContext.request.contextPath}/resources/assets/img/logo6.png"/>
				        <p class="name">${member_id}</p>
				    </div>
				 
				   	<span class="menu-item_m inactive"><a href="${pageContext.request.contextPath}/">
				   			<i class="fas fa-home"></i>HOME</a></span>
			        <span class="menu-item_m active"><a
			                href="${pageContext.request.contextPath}/box/detail?box_no=${box_no}">
			                <i class="fas fa-archive"></i> 나의 박스</a></span>
			        <span class="menu-item_m inactive"><a
			                href="${pageContext.request.contextPath}/product/listPerPage?box_no=${box_no}">
			                <i class="fas fa-list-alt"></i> 물품 리스트</a></span>
			        <span class="menu-item_m inactive"><a
			                href="${pageContext.request.contextPath}/category/detail?box_no=${box_no}">
			                <i class="fas fa-table"></i> 카테고리</a></span>
			        <span class="menu-item_m inactive"><a
			                href="${pageContext.request.contextPath}/group/grouplist?box_no=${box_no}">
			                <i class="fas fa-user-friends"></i> 그룹</a></span>
			        <span class="menu-item_m inactive"><a href="${pageContext.request.contextPath}/chart/get?box_no=${box_no}">
			        		<i class="far fa-chart-bar"></i> 차트</a></span>
			        <span class="menu-item_m inactive"><a href="${pageContext.request.contextPath}/member/logout">
			        		<i class="fas fa-sign-out-alt"></i> 로그아웃</a></span>
		
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
			<label class="menu_bg_close" for="toggle_menu"></label><!--토글옆부분 검정색닫기-->
		</nav>
	</header>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxleftmobile.js?ver=60"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=3"></script>
<script type="application/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/modal.js?ver=3"></script>

</html>
