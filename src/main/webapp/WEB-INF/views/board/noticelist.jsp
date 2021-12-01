<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css?ver=3">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=2">

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

                <c:if test="${member_id == 'admin'}">
                    <button id="noticewriteBtn" type="button"> + 공지작성</button>
                </c:if>
            </div>

            <div class="search_pc">
                <form id="searchForm" action="/board/searchlist" method='get'>

                    <input class="search" type='text' name='keyword' placeholder="&nbsp;&nbsp;키워드로 검색"
                           value='<c:out value="${pageMaker.cri.keyword}"/>'/>

                    <input type='hidden' name='currPage' value='${pageMaker.cri.currPage}'>
                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                    <input type='hidden' name='pagesPerPage' value='${pageMaker.cri.pagesPerPage}'>
                    <button class='searchbtn'><img class="searchimg"
                                                   src="${pageContext.request.contextPath}/resources/assets/img/search.png"/>검색
                    </button>
                </form>
            </div>

            <div id="noticelistwrapper" class="noticewrapper noticemainlist">
                <div class="noticetitle">
                    <h2 class="notice"><img class="noticeimg"
                                            src="${pageContext.request.contextPath}/resources/assets/img/warning.png"/>&nbsp;&nbsp;공지사항
                    </h2>
                </div>

                <div id="boardtitlenone" class="boardlistcontainer noticelistcontainer">
                    <div class="item boardno">번호</div>
                    <div class="item title">제목</div>
                    <div class="item writer">작성자</div>
                    <div class="item regdate">작성일</div>
                </div>

                <div id="noticelist">
                    <c:forEach items="${noticeList}" var="board">
                        <div class="noticelist">

                            <div class="item regdate">
                                <fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}"/>
                            </div>
                            <div class="item writer">
                                <img id="admin_btn"
                                     src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/logo6.png"/>
                                인투박스
                            </div>
                            <div class="item title">
                                <a href="/board/noticedetail?board_idx=${board.board_idx}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                                    <c:out value="${board.title}"/>
                                </a>
                            </div>
                            <div class="item boardno">
                                <c:out value="${board.board_idx}"/>
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
                            <li class="page-item"><a class="page-link"
                                                     href="/board/noticePage?currPage=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&pagesPerPage=${cri.pagesPerPage}"><i
                                    class="fas fa-angle-left"></i></a></li>
                        </c:if>

                        <!-- 페이지 번호 목록 표시 -->
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                            <c:set var="cp" value="${pageMaker.cri.currPage}"/>

                            <c:choose>
                                <c:when test="${pageNum == cp}">
                                    <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                                             href="/board/noticePage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- 2. 다음 이동 여부 표시 (next) -->
                        <c:if test="${pageMaker.next}">
                            <li class="page-item"><a class="page-link"
                                                     href="/board/noticePage?currPage=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}"><i
                                    class="fas fa-angle-right"></i></a></li>
                        </c:if>
                    </ul>
                </form>
            </div>

            <button id="noticelistBtn" type="button">돌아가기</button>

        </div>
    </div>
</div>

</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

<script>
    const currPage = ${cri.currPage};
    const amount = ${cri.amount};
    const pagesPerPage = ${cri.pagesPerPage};
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board.js?ver=30"></script>


</html>
