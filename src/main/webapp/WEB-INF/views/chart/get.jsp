<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="box_no" value="${param.box_no}"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=3">
    <%-- chart css --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/chart.css?ver=3">

</head>
<body>
<%--<input type="text" value="${param.box_no}">--%>

<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>
    <div class="main-container">
        <div class="title-container">
            <h1>차트</h1>
            <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
            </a>
        </div>

        <div class="scroll type2">

            <div class="body-content">
                <!-- top box -->
                <div class="row top-section">
                    <div class="col-md-2 top-left">
                        <!-- product_photo의 이름과 경로가 모두 null이 아닐 때 -->
                        <!-- img 경로 불러오는거 최신 버전으로 수정 (희원) -->
                        <c:if
                                test="${not empty box.box_photo_path && not empty box.box_photo_name}">
                            <img
                                    src="https://intobox.s3.ap-northeast-2.amazonaws.com/${box.box_photo_path}${box.box_photo_name}"/>
                        </c:if> <!-- product-img -->
                        <span>${box.box_name}</span>
                    </div>
                    <div class="col-md-9 top-right">
                        <div class="box1 text-box">
                            <p class="subject">총 개수</p>
                            <div class="number">${totalAmount}</div>
                        </div>
                        <div class="box2 text-box">
                            <p class="subject">오늘 등록된 물품 개수</p>
                            <div class="number">${regTotalAmount}</div>
                        </div>
                        <div class="box3 text-box">
                            <p class="subject">오늘 수정된 물품 개수</p>
                            <div class="number">${editTotalAmount}</div>
                        </div>
                    </div>
                </div>

                <div class="row bottom-section">
                    <div class="col-md-5 bottom-left">
                        <h3 class="top5-title">물품 수량 TOP 5</h3>
                        <ul class="top5-list">
                            <c:forEach items="${topProductList}" var="topList" varStatus="status">
                                <li class="top5-list-container fadeInUp">
                                    <div class="no">${status.count}</div>
                                    <c:if test="${not empty topList.product_photo_name && not empty topList.product_photo_path}">
                                        <div class="item" id="product-img">
                                            <c:set var="path" value="${topList.product_photo_path}"/>
                                            <c:choose>
                                                <c:when test="${fn:contains(path,'resource')}"> <!-- 기본이미지 사용 -->
                                                    <img id="product-img"
                                                         src="${pageContext.request.contextPath}${topList.product_photo_path}${topList.product_photo_name}"/>
                                                </c:when>
                                                <c:otherwise> <!-- 업로드 이미지 사용 -->
                                                    <img id="product-img"
                                                         src="https://intobox.s3.ap-northeast-2.amazonaws.com/${topList.product_photo_path}${topList.product_photo_name}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:if>

                                    <!-- product_photo의 이름과 경로 중 하나라도 null일때 -->
                                    <c:if test="${empty topList.product_photo_name || empty topList.product_photo_path}">
                                        <div class="item" id="product-none-img"></div>
                                    </c:if> <!-- product-none-img -->

                                    <div class="item" id="product-name-top">
                                        <a href="${pageContext.request.contextPath}/product/detail?product_no=${topList.product_no}&box_no=${topList.box_no}">
                                            <c:out value='${topList.product_name}'/>
                                        </a>
                                    </div> <!-- product-name -->

                                    <div class="item" id="product-qtn-top">
                                        <c:out value='${topList.product_qtn}'/>개
                                    </div> <!-- product-qtn-->
                                </li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div class="col-md-6 bottom-right">
                        <h3 class="top5-title">최신 입고 물품</h3>
                        <ul class="top5-list">
                            <c:forEach items="${dateProductList}" var="dateList" varStatus="status">
                                <li class="top5-list-container fadeInUp">
                                    <div class="no">${status.count}</div>
                                    <c:if test="${not empty dateList.product_photo_name && not empty dateList.product_photo_path}">
                                        <div class="item" id="product-img">
                                            <c:set var="path" value="${dateList.product_photo_path}"/>
                                            <c:choose>
                                                <c:when test="${fn:contains(path,'resource')}"> <!-- 기본이미지 사용 -->
                                                    <img id="product-img"
                                                         src="${pageContext.request.contextPath}${dateList.product_photo_path}${dateList.product_photo_name}"/>
                                                </c:when>
                                                <c:otherwise> <!-- 업로드 이미지 사용 -->
                                                    <!-- src 부분 오타 수정 (희원) -->
                                                    <img id="product-img"
                                                         src="https://intobox.s3.ap-northeast-2.amazonaws.com/${dateList.product_photo_path}${dateList.product_photo_name}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:if>

                                    <!-- product_photo의 이름과 경로 중 하나라도 null일때 -->
                                    <c:if test="${empty dateList.product_photo_name || empty dateList.product_photo_path}">
                                        <div class="item" id="product-none-img"></div>
                                    </c:if> <!-- product-none-img -->

                                    <div class="item" id="product-name-top">
                                        <a href="${pageContext.request.contextPath}/product/detail?product_no=${dateList.product_no}&box_no=${box_no}">
                                            <c:out value='${dateList.product_name}'/>
                                        </a>
                                    </div> <!-- product-name -->

                                    <div class="item" id="product-date">
                                        <fmt:formatDate value="${dateList.reg_date}" pattern="yyyy-MM-dd"/>
                                    </div> <!-- product-qtn-->
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</body>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


<script>
    // fadein효과

    $(document).ready(function(){
        $(window).scroll(function(){
            $('.fadeInUp').each(function(i){

                var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                var bottom_of_window = $(window).scrollTop() + $(window).height();

                if(bottom_of_window > bottom_of_element){
                    $(this).animate({'opacity':'1','margin-left':'0px'},1000);
                }
            });
        });
    });
</script>
</html>
