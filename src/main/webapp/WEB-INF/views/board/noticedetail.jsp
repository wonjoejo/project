<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Q&ANoticeDetail</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

	<!-- stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css?ver=1">

</head>
<body>

<div class="container">

	<c:choose>
        <c:when test="${member_id eq 'admin'}">
            <jsp:include page="../common/adminleft.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="../common/left.jsp"/>
        </c:otherwise>
    </c:choose>

	<div class="main-container">		
		<div class="wrapper">
		
			<jsp:include page="../common/leftmobile.jsp"/>
			
			<div id="detailtop">			
				<h1 class="title">Q&A</h1>						
				<button id="noticepagelistBtn" type="button">돌아가기</button>			
			</div>

			<div id="detailcontent">
				<form action="/board/edit" method="post">
					<input type="hidden" name="board_idx" value="${board.board_idx}"/>

					<div class="detailwrapper">
						<div class="detailtitle">
							<input class="noline" type="text" name="title" value="${board.title}" readonly/>
						</div>

						<div class="detailid">
							<img id="admin_btn"
								 src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/logo6.png"/>
							인투박스
							<input class="noline" type="hidden" name="member_id" value="${board.member_id}" readonly/>
						</div>

						<div class="detaildate">
							<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}"/>
						</div>

						<div class="detailcontent">
							<textarea class="noline detailcon" name="content" cols="50" rows="10"
									  readonly>${board.content}</textarea>
						</div>
					</div>
			
					<c:if test="${member_id == board.member_id}">
						<div>
							<button type="button" id="editBtn">수정</button>
			                <button type="button" id="deleteBtn">삭제</button>
						</div>	
					</c:if>
				</form>		
			</div>		
		</div>
	</div>
</div>

</body>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
	
    <script>
    	const board_idx = ${board.board_idx};
		
		const currPage = ${cri.currPage};
		const amount = ${cri.amount};
		const pagesPerPage = ${cri.pagesPerPage};
    </script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board.js?ver=10"></script>
       
</html>
