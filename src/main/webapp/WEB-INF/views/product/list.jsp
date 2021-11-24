<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<c:set var="box_no" value="${box_no}"/>

<html>
<head>
    <title>물품 리스트</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
          sizes="16x16">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

    <%--auto complete--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- stylesheets -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/product.css?ver=21">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=1">

</head>
<body>
    <div class="container">
        <jsp:include page="../common/boxleft.jsp" />
        <div class="main-container">
            <div id="top-content">
                <h1 class="title">물품 리스트</h1>
            </div> <!-- top_content -->

            <div class="product-main-container">

                <div id="top-search">
                    <input class="search" type="text" placeholder="&nbsp;&nbsp;Search everything" id="search" value=""/>
                    <button class="searchbtn">
                        <img class="searchimg"
                             src="${pageContext.request.contextPath}/resources/assets/img/search.png"/>검색
                    </button>
                </div> <!-- top-search -->


                <div class="product-container">
                    <c:forEach items="${list}" var="product">
                        <div class="product-list-container" id="product-list">

                            <!-- product_photo의 이름과 경로가 모두 null이 아닐 때 -->
                            <c:if
                                test="${not empty product.product_photo_name && not empty product.product_photo_path}">
                                <div class="item" id="product-img">
                                    <c:set var="path" value="${product.product_photo_path}" />
                                    <c:choose>
                                        <c:when test="${fn:contains(path,'resource')}">
                                            <!-- 기본이미지 사용 -->
                                            <img id="product-img"
                                                src="${pageContext.request.contextPath}${product.product_photo_path}${product.product_photo_name}" />
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 업로드 이미지 사용 -->
                                            <img id="product-img"
                                                src="https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}" />
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:if> <!-- product-img -->

                            <!-- product_photo의 이름과 경로 중 하나라도 null일때 -->
                            <c:if test="${empty product.product_photo_name || empty product.product_photo_path}">
                                <div class="item" id="product-none-img">
                                </div>
                            </c:if> <!-- product-none-img -->


                            <div class="item" id="product-name">
                                <a href="${pageContext.request.contextPath}/product/detail?product_no=${product.product_no}&box_no=${product.box_no}">
                                    <c:out value='${product.product_name}' /> </a>
                            </div> <!-- product-name -->

                            <div class="item" id="product-cate">
                                <c:if test="${not empty product.cate_detail1}">
                                    <div class="product-cate-1">
                                        <c:out value='${product.cate_name1}│ ${product.cate_detail1}' />
                                    </div>
                                </c:if>

                                <c:if test="${not empty product.cate_detail2}">
                                    <div class="product-cate-2">
                                        <c:out value='${product.cate_name2}│ ${product.cate_detail2}' />
                                    </div>
                                </c:if>

                                <c:if test="${not empty product.cate_detail3}">
                                    <div class="product-cate-3">
                                        <c:out value='${product.cate_name3}│ ${product.cate_detail3}' />
                                    </div>
                                </c:if>

                                <c:if test="${not empty product.cate_detail4}">
                                    <div class="product-cate-4">
                                        <c:out value='${product.cate_name4}│ ${product.cate_detail4}' />
                                    </div>
                                </c:if>

                            </div> <!-- product-cate -->

                            <div class="item" id="product-qtn">
                                <c:out value='${product.product_qtn}' />
                            </div> <!-- product-qtn-->

                        </div>
                        <!-- product-list -->
                    </c:forEach>
                </div> <!-- product-container -->

                <!-- 페이징 처리 -->
                <div id="pagination">
                    <form action="#" id="paginationForm">
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">
                        <input type="hidden" name="pagesPerPage">
                        <input type="hidden" name="box_no">

                        <!-- 1. 이전 이동 여부 표시 (prev) -->
                        <ul class="pagination">
                            <c:if test="${pageMaker.prev}">
                                <li class="page-item"><a class="page-link" href="/product/listPerPage?
											currPage=${pageMaker.startPage-1}
											&amount=${pageMaker.cri.amount}
											&pagesPerPage=${cri.pagesPerPage}
											&box_no=${pageMaker.cri.box_no}">
                                        <i class="fas fa-angle-left"></i></a></li>
                            </c:if>

                            <!-- 페이지 번호 목록 표시 -->
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                                <c:set var="cp" value="${pageMaker.cri.currPage}" />

                                <c:choose>
                                    <c:when test="${pageNum == cp}">
                                        <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="/product/listPerPage?
												currPage=${pageNum}
												&amount=${pageMaker.cri.amount}
												&pagesPerPage=${pageMaker.cri.pagesPerPage}
												&box_no=${pageMaker.cri.box_no}">${pageNum}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- 2. 다음 이동 여부 표시 (next) -->
                            <c:if test="${pageMaker.next}">
                                <li class="page-item"><a class="page-link" href="/product/listPerPage?
										currPage=${pageMaker.endPage+1}
										&amount=${pageMaker.cri.amount}
										&pagesPerPage=${pageMaker.cri.pagesPerPage}
										&box_no=${pageMaker.cri.box_no}">
                                        <i class="fas fa-angle-right"></i></a></li>
                            </c:if>
                        </ul>
                    </form>
                </div> <!-- page -->

                <button type="button" id="excel-btn">EXCEL</button>
            </div> <!-- product-main-container -->
        </div> <!-- main-container -->
    </div> <!-- container -->

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<script>
	const boxNo = '${box_no}';
	const currPage = '${cri.currPage}';
	const amount = '${cri.amount}';
	const pagesPerPage = '${cri.pagesPerPage}';
</script>
<%-- autocomplete(자동완성) 기능 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%-- product list js 파일 --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/productList.js?ver=8"></script>
</html>
