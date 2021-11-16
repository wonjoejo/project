<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Q&ABoardList</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

	<!-- stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css?ver=20">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=1">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
    $(function name() {
        console.clear();
        console.log('jquery started...');
        
        $('#addBtn').click(function () {
            console.log('click event triggered..');

            self.location = '/board/noticePage';
          }); //onclick

        // 등록 버튼을 마우스로 클릭하면, 이벤트 핸들러가 발생한다
        $('#writeBtn').on('click', function () {
            console.log('onclicked on writeBtn...');

            self.location = '/board/write?board_idx=${board.board_idx}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
        });//onclick

      }); //.jq
    </script>
   
</head>
<body>

<div class="container">

	<jsp:include page="../common/left.jsp"/>

	<div class="main-container">		
		<div class="wrapper">
		
			<div id="top_content">
				<h1 class="title">Q&A</h1>
				
				<input class="search" type="text" placeholder="&nbsp;&nbsp;Search everything"/>
				<button class="searchbtn"><img class="searchimg" src="${pageContext.request.contextPath}/resources/assets/img/search.png" />검색</button>
						
				<a href="/board/write?currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}"><button id="writeBtn" type="button"> + 글 작성</button></a>
			</div>
			
			<div class="noticewrapper" >
				<h2 class="notice">공지사항</h2>
				<div id="notice">
				
					<c:forEach items="${noticeList}" var="board">
						<div class="noticelist">      	
											
							<div class="item">
								<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}" />
							</div> 
							<div class="item">
								<c:out value="${board.member_id}" />
							</div>	 
							<div class="item">
								<a href="/board/noticedetail?board_idx=${board.board_idx}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
								<c:out value="${board.title}" />
								</a>
							</div>	  
							&nbsp;&nbsp;&nbsp;&nbsp;<img class="noticeimg" src="${pageContext.request.contextPath}/resources/assets/img/warning.png" />        
						</div>
			
						
					</c:forEach>
				</div>
				<button id="addBtn" type="button">더보기</button>
			</div>
			
			<div id="boardtable" >

				<div id="boardtitlenone" class="boardlistcontainer">
					<div class="item">No</div>
					<div class="item">Title</div>
					<div class="item">written by</div>
					<div class="item">Register date</div> 
				</div>

				<div class="boardlist">
				<!-- BoardVO를 여러개 담고 있는 리스트 객체를 가지고 
						목록을 만들어 줘야 합니다 -->
					<c:forEach items="${list}" var="board">
					
						<div class="boardlistcontainer">     
							<div class="item">
								<c:out value="${board.board_idx}" />
							</div>	
							
							<div class="item">
								<c:if test="${board.depth > 0}">
									<img class="replyicon" src="${pageContext.request.contextPath}/resources/assets/img/listreply.png">&nbsp;
								</c:if>
								<a href="/board/detail?board_idx=${board.board_idx}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
								<c:out value="${board.title}" />
								</a>
							</div>					
							<div class="item">
								<c:out value="${board.member_id}" />
							</div>						
							<div class="item">
								<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}" />
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
							<li class="page-item"><a class="page-link" href="/board/listPerPage?currPage=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&pagesPerPage=${cri.pagesPerPage}"><i class="fas fa-angle-left"></i></a></li>
						</c:if>

						<!-- 페이지 번호 목록 표시 -->
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
							<c:set var="cp" value="${pageMaker.cri.currPage}" />

							<c:choose>
								<c:when test="${pageNum == cp}">
									<li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/board/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 2. 다음 이동 여부 표시 (next) -->
						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" href="/board/listPerPage?currPage=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}"><i class="fas fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</form>
			</div>
			
		</div>
	</div>
</div>

</body>

</html>
