<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: heewonseo
  Date: 2021/11/05
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BoxCreate</title>

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
</head>
<body>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <h1>나의 박스</h1>
        <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
            <button class="btn btn-primary">박스 리스트</button>
        </a>

        <div class="box-wrapper">
            <form method="post" action="/box/create" enctype="multipart/form-data">
                <input type="hidden" name="member_id" value="${sessionScope.member_id}">
            <div class="form-container">

                    <div class="box-photos">
                        <div class="product-photo">
                        <img src="${box.box_photo_path}/${box.box_photo_name}"/>
                        </div>
                        ${box.box_name}
                        </div>
                <div class="box-memo">
                    ${box.box_memo}
                </div>
            </div>
            </form>

        </div>

        <div class="product-list">
            product!!
            <c:forEach var="product" items="${productList}">

                ${product.product_name}

            </c:forEach>
        </div>
    </div>



</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/box.js?ver=1"></script>
</html>
