<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>소중한 물건들을 모아, 인투박스</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

	<!-- stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css?ver=71">
 
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
				<button id="listBtn" type="button">돌아가기</button>
			</div><!-- detailtop -->

			<div id="detailcontent">
				<form action="/board/replydetail" method="post">

					<div class="detailwrapper">
						<div class="detailtitle">
							<input class="noline" type="text" name="title" value="${board.title}" readonly/>
						</div>

						<div class="detailid">
							<div class="item">
								<!-- 작성자 아이디 마스킹 처리 -->
								<c:choose>
									<%-- admin은 관리자라고 그대로 보여줌 --%>
									<c:when test="${board.member_id eq 'admin'}">
										<img id="admin_btn"
											 src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/logo6.png"/>
										인투박스
									</c:when>
									<c:otherwise>
										<%-- 아이디가 null이 아닐 때 --%>
										<c:if test="${board.member_id ne null && board.member_id !='' }">

											<%-- 아이디의 앞 2자리까지 보여 주고 --%>
											<input class="noline" type="text" name="member_id"
												   value="${board.member_id}" readonly/>
										</c:if>
									</c:otherwise>
								</c:choose>
							</div> <!-- 아이디 마스킹 처리 끝 -->
						</div>

						<div class="detaildate">
							<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}"/>
						</div>

						<div class="detailcontent">
							<textarea class="noline detailcon" name="content" cols="50" rows="10"
									  readonly>${board.content}</textarea>
						</div>
					</div><!-- detailwrapper -->

					<div>
						<c:if test="${member_id == 'admin'}">
							<c:if test="${board.depth == 0}">
								<button id="replyWriteBtn" type="button">답글작성</button>
							</c:if>
						</c:if>

						<c:if test="${member_id ==  board.member_id}">
							<button type="button" id="editBtn">수정</button>
			                <button type="button" id="replydeleteBtn">삭제</button>
			            </c:if> 
		                <input type="hidden" name="board_idx" value="${board.board_idx}" >
		                 <input type="hidden" name="ref" value="${board.ref}" >
					</div>	
				</form>	
				
			</div><!-- detailcontent -->	
		</div><!-- wrapper -->
	</div><!-- main-container -->
</div><!-- container -->

</body>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script>
		const ref = ${board.ref};
		const title = '${board.title}';
		const member_id ='${board.member_id}';
		
		const board_idx = ${board.board_idx};
		
		const currPage = ${cri.currPage};
		const amount = ${cri.amount};
		const pagesPerPage = ${cri.pagesPerPage};
    </script> 
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board.js?ver=200"></script>
</html>

