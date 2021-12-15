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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css?ver=60">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=1">
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
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

			<div id="top_content">
				<h1 class="title">Q&A</h1>

				<button id="listBtn" type="button">돌아가기</button>
			</div>

			<div class="search_pc">
				<form id="searchForm" action="/board/searchlist" method='get'>

					<input onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="search" type='text'
						   name='keyword' placeholder="키워드 입력"
						   value='<c:out value="${pageMaker.cri.keyword}"/>'/>

					<input type='hidden' name='currPage' value='${pageMaker.cri.currPage}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='pagesPerPage' value='${pageMaker.cri.pagesPerPage}'>
					<button class='searchbtn'><img class="searchimg"
												   src="${pageContext.request.contextPath}/resources/assets/img/search.png"/>검색
					</button>
				</form>
			</div>

			<div id="boardtable">

				<div id="boardtitlenone" class="boardlistcontainer">
					<div class="item">번호</div>
					<div class="item titleitem">제목</div>
					<div class="item">작성자</div>
					<div class="item">작성일</div>
				</div>

				<div class="boardlist">
					<!-- BoardVO를 여러개 담고 있는 리스트 객체를 가지고
                            목록을 만들어 줘야 합니다 -->
					<c:forEach items="${searchList}" var="board">

						<div class="boardlistcontainer">
							<div class="item">
								<c:out value="${board.board_idx}"/>
							</div>

							<div class="item titleitem">
								<c:if test="${board.depth > 0}">
									<img class="replyicon"
										 src="${pageContext.request.contextPath}/resources/assets/img/listreply.png">&nbsp;
								</c:if>
								<a href="/board/replydetail?ref=${board.ref}&board_idx=${board.board_idx}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&depth=${board.depth}">
									<c:if test="${member_id == 'admin'}">
									<a href="/board/detail?board_idx=${board.board_idx}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
										</c:if>

										<c:if test="${member_id == null}">
										<a href="#" class="gojoinpage">
											</c:if>

											<c:out value="${board.title}"/>
										</a>
							</div>
								<%--							<div class="item">--%>
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
											${fn:substring(board.member_id,0,2)}

											<%-- 총 4개의 * 붙이기 --%>
											<c:forEach begin="3" end="6" step="1">
												*
											</c:forEach>

										</c:if>
									</c:otherwise>
								</c:choose>
							</div> <!-- 아이디 마스킹 처리 끝 -->
								<%--							</div>--%>
							<div class="item">
								<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}"/>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 페이징 처리 -->
			<div id="pagination">

				<form action="#" id="paginationForm">
					<!-- 1. 이전 이동 여부 표시 (prev) -->
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="/board/searchlist?keyword=${pageMaker.cri.keyword}&currPage=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&pagesPerPage=${cri.pagesPerPage}"><i class="fas fa-angle-left"></i></a></li>
						</c:if>

						<!-- 페이지 번호 목록 표시 -->
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
							<c:set var="cp" value="${pageMaker.cri.currPage}" />

							<c:choose>
								<c:when test="${pageNum == cp}">
									<li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/board/searchlist?keyword=${pageMaker.cri.keyword}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 2. 다음 이동 여부 표시 (next) -->
						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" href="/board/searchlist?keyword=${pageMaker.cri.keyword}&currPage=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}"><i class="fas fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</form>
			</div>
			
		</div>
	</div>
</div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
	const currPage = ${cri.currPage};
	const amount = ${cri.amount};
	const pagesPerPage = ${cri.pagesPerPage};
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board.js?ver=40"></script>

</html>
