<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
	<title>GroupList</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

	<!-- stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/group.css?ver=1">
</head>
<body>

<div class="container">
	<jsp:include page="../common/boxleft.jsp" />

<div class="main-container">
	<div class="name" >
	<h1>그룹 리스트</h1>
	</div>
	
	  <div class="buttons"> 
	  <input class="submit-btn hvr-float" id= "grouppermission" type="button" value="권한 설정">
	  <input class="submit-btn hvr-float" type="button" value="그룹 초대">
	  <input class="submit-btn hvr-float" type="button" value="그룹 탈퇴">
	  </div>

	<div class="group-wrapper">
	<div class="group-container">
	<c:forEach items="${list}" var="group">
		<div class="group hvr-grow">
		<img id="profile_img" src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true" style="width: 65%;">
		<c:out value="${group.member_id}"/><br/>
		<c:out value="${group.name}"/><br/>
		<c:out value="${group.phone_number}"/><br/>
		</div>
	</c:forEach>
	</div>

	</div>
</div>

</div>


</body>
			<script>
				//권한 설정페이지로 이동
				$(document).ready(function () {
					$("#grouppermission").click(function () {
						location.href = "${pageContext.request.contextPath}/group/permissionlist?box_no=${box_no}";

					})

				})



			</script>

</html>
