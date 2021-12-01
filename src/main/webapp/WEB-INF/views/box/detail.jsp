<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="box_no" value="${box.box_no}"/>
<c:set var="permit" value="${sessionScope.permission}"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=11">

</head>
<body>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="title-container">
        
        	<jsp:include page="../common/boxleftmobile.jsp"/>
        	
            <h1>나의 박스</h1>
            <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
            </a>
        </div>
        <div class="scroll type2">
            <div class="list-wrapper">
                <div class="box-info-container">
                    <div class="box-img">
                        <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/${box.box_photo_path}${box.box_photo_name}"/>
                        <span>${box.box_name}</span>
                    </div>
                    <div class="box-memo">
                        <div class="title">
                            MEMO
                        </div>
                        <div class="memo">
                            ${box.box_memo}
                        </div>
                        <%--  master만 박스 수정 삭제 가능   --%>
                        <c:if test="${permit.master_per eq 0}">
                            <div class="buttons">
                                <button class="btn" onclick="location.href='/box/editview?box_no=${box.box_no}'"><i
                                        class="fas fa-pencil-alt"></i> 수정
                                </button>
                                <button class="btn delete-btn"><i class="fas fa-trash"></i> 삭제</button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="product-list">
                <c:forEach items="${productList}" var="product">
                    <div class="product-list-container" id="product-list">

                        <!-- product_photo의 이름과 경로가 모두 null이 아닐 때 -->
                        <c:if test="${not empty product.product_photo_name && not empty product.product_photo_path}">
                            <div class="item product-img">
                                <img id="product-img"
                                     src="https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}"/>
                            </div>
                        </c:if> <!-- product-img -->

                        <!-- product_photo의 이름과 경로 중 하나라도 null일때 -->
                        <c:if test="${empty product.product_photo_name || empty product.product_photo_path}">
                            <div class="item" id="product-none-img">
                            </div>
                        </c:if> <!-- product-none-img -->


                        <div class="item" id="product-name">
                            <a href="${pageContext.request.contextPath}/product/detail?product_no=${product.product_no}&box_no=${product.box_no}">
                                <c:out value='${product.product_name}'/>
                            </a>
                        </div> <!-- product-name -->

                        <div class="item" id="product-cate">
                            <c:if test="${not empty product.cate_detail1}">
                                <div class="product-cate-1">
                                    <c:out value='${product.cate_name1}│ ${product.cate_detail1}'/>
                                </div>
                            </c:if>

                            <c:if test="${not empty product.cate_detail2}">
                                <div class="product-cate-2">
                                    <c:out value='${product.cate_name2}│ ${product.cate_detail2}'/>
                                </div>
                            </c:if>

                            <c:if test="${not empty product.cate_detail3}">
                                <div class="product-cate-3">
                                    <c:out value='${product.cate_name3}│ ${product.cate_detail3}'/>
                                </div>
                            </c:if>

                            <c:if test="${not empty product.cate_detail4}">
                                <div class="product-cate-4">
                                    <c:out value='${product.cate_name4}│ ${product.cate_detail4}'/>
                                </div>
                            </c:if>
                        </div> <!-- product-cate -->

                        <div class="item" id="product-qtn">
                            <c:out value='${product.product_qtn}'/>
                        </div> <!-- product-qtn-->

                    </div>
                    <!-- product-list -->
                </c:forEach>
                <div class="buttons">
                    <button class="btn" onclick="location.href='/product/listPerPage?box_no=${box.box_no}'">
                        <i class="fas fa-plus"></i> 더보기
                    </button>
                </div>
            </div>
        </div>
    </div>


</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"
        integrity="sha512-nnzkI2u2Dy6HMnzMIkh7CPd1KX445z38XIu4jG1jGw7x5tSL3VBjE44dY4ihMU1ijAQV930SPM12cCFrB18sVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	const box_no = '${box.box_no}';
	const member_id = '${sessionScope.member_id}';
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/box.js?ver=1"></script>
</html>
