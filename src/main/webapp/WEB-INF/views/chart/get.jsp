<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="box_no" value="${box_no}"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/chart.css?ver=2">

</head>
<body>
<input type="text" value="${param.box_no}">

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
                        <c:set var="path" value="${box.box_photo_path}"/>
                        <c:choose>
                            <c:when test="${fn:contains(path,'default')}">
                                <img src="${box.box_photo_path}${box.box_photo_name}"/>
                            </c:when>
                            <c:otherwise>
                                <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/${box.box_photo_path}${box.box_photo_name}"/>
                            </c:otherwise>
                        </c:choose>
                        <span>${box.box_name}</span>
                    </div>
                    <div class="col-md-9 top-right">


                    </div>
                </div>

                <div class="row bottom-section">
                    <div class="col-md-5 bottom-left">

                    </div>
                    <div class="col-md-6 bottom-right">

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

</html>
