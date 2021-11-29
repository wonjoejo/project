<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=5">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=1">
</head>
<body>

<div class="container">
    <jsp:include page="../common/left.jsp"/>

    <div class="main-container">

        <jsp:include page="../common/leftmobile.jsp"/>

        <h1>박스 리스트</h1>

        <div class="scroll type2">
            <div class="box-wrapper">
                <div class="box-container">
                    <c:forEach items="${list}" var="box">
                        <a href="${pageContext.request.contextPath}/box/detail?box_no=${box.box_no}">
                            <div class="box hvr-grow">
                                <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/${box.box_photo_path}${box.box_photo_name}"/>
                                    ${box.box_name}
                            </div>
                        </a>
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
                                                     href="/box/list?currPage=${pageMaker.startPage-1}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}&member_id=${member_id}"><i
                                    class="fas fa-angle-left"></i></a></li>
                        </c:if>

                        <!-- 페이지 번호 목록 표시 -->
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                            <c:set var="cp" value="${cri.currPage}"/>

                            <c:choose>
                                <c:when test="${pageNum == cp}">
                                    <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                                             href="/box/list?currPage=${pageNum}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}&member_id=${member_id}">${pageNum}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- 2. 다음 이동 여부 표시 (next) -->
                        <c:if test="${pageMaker.next}">
                            <li class="page-item"><a class="page-link"
                                                     href="/box/list?currPage=${pageMaker.endPage+1}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}&member_id=${member_id}"><i
                                    class="fas fa-angle-right"></i></a></li>
                        </c:if>
                    </ul>
                </form>
            </div>
        </div>
    </div>

</body>
<script>
    const result = '${result}';
    if (result !== '') {
        console.log("???");
        alert("되나????" + result);
    } else {
        console.log("else문 탐");
    }
</script>
</html>
