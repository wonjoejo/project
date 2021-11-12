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
	<jsp:include page="../common/left.jsp"/>

<div class="main-container">
	<h1>박스 리스트</h1>

	<div class="box-wrapper">
	<div class="box-container">
	<c:forEach items="${list}" var="box">
		<div class="box hvr-grow">
		<img src="${box.box_photo_path}/${box.box_photo_name}"/>
		${box.box_name}
		</div>
	</c:forEach>
	</div>

	</div>
</div>

</div>



</body>
</html>
