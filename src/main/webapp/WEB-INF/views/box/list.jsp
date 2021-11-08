<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>BoxList</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

	<!-- stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=1">
</head>
<body>

<div class="container">
<div class="side-menu">
	<div class="profile">
		<img src="${pageContext.request.contextPath}/resources/assets/img/logo6.png"/>
		<p class="name">name</p>
	</div>
	<div class="menu">
		<span class="menu-item"><i class="far fa-list-alt"></i> 박스 리스트</span>
		<span class="menu-item"><i class="far fa-plus-square"></i> 박스 생성</span>
		<span class="menu-item"><i class="far fa-question-circle"></i> Q&A</span>
		<span class="menu-item"><i class="fas fa-sign-out-alt"></i> 로그아웃</span>
	</div>
</div>

<div class="main-container">
	<h1>박스 리스트</h1>

	<div class="box-container">
	<c:forEach items="${list}" var="box">
		<div class="box">
		<img src="${pageContext.request.contextPath}/resources/assets/img/photo_name.png"/>
		${box.box_name}
		</div>
	</c:forEach>
	</div>

	</div>

</div>



</body>
</html>
