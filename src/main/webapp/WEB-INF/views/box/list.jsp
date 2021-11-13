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
	${sessionScope.member_id}

	<div class="box-wrapper">
	<div class="box-container">
	<c:forEach items="${list}" var="box">
		<a href="${pageContext.request.contextPath}/box/get?box_no=${box.box_no}">
		<div class="box hvr-grow">
		<img src="${box.box_photo_path}/${box.box_photo_name}"/>
		${box.box_name}
		</div>
		</a>
	</c:forEach>
	</div>

		<!-- 현재화면 하단부에 , 페이징 처리기준에 맞게 , 페이지번호목록 표시 -->
		<div id="pagination">

			<form action="#" id="paginationForm">
				<input type="hidden" name="currPage">
				<input type="hidden" name="amount">
				<input type="hidden" name="pagesPerPage">

				<ul class="pagination">
					<!-- 1. 이전, 이동여부표시(prev) -->
					<c:if test="${pageMaker.prev}">
						<li class="prev"><a class="prev" href="${pageMaker.startPage - 1}">Prev</a></li>
					</c:if>

					<!-- 페이지번호목록 표시   -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						<li><a class="page" href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
					</c:forEach>

					<!-- 2. 이후, 이동여부표시(next) -->
					<c:if test="${pageMaker.next}">
						<li class="next"><a class="next" href="${pageMaker.endPage + 1}">Next</a></li>
					</c:if>
				</ul>

			</form>
		</div>
	</div>
</div>
</div>

</body>
</html>
