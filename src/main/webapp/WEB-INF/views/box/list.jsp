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

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css">
</head>
<body>
<div class="side-menu">
	메뉴

	<button onclick="location.href='${pageContext.request.contextPath}/box/create.jsp'">박스 생성</button>
</div>

<div class="main-container">
	<h1>박스 리스트</h1>

	<c:forEach items="${list}" var="box">
		${box}
	</c:forEach>

	<div class="box-container">
		<div class="box">
			화장품 박스
		</div>
		<div class="box">
			화장품 박스
		</div>
		<div class="box">
			화장품 박스
		</div>
		<div class="box">
			화장품 박스
		</div>
		<div class="box">
			화장품 박스
		</div>
		<div class="box">
			화장품 박스
		</div>
	</div>
</div>



${param.result}



</body>
</html>
