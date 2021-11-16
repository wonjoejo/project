<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/productDetail.css?ver=2">
</head>
<body>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <input type="hidden" name="product_no" value="${product.product_no}">
    <input type="hidden" name="box_no" value="${product.box_no}">
    <div class="main-container">
        <div class="top-content">
            <h1>물품리스트</h1>

            <div class="wrapper">
                <div class="hamburger">
                    <ul class="menu__list">
                        <li class="menu__list__item"><a href="${pageContext.request.contextPath}/product/edit?product_no=${product.product_no}&box_no=${product.box_no}"><i class="fas fa-pencil-alt i-style"></i></a></li>
                        <li class="menu__list__item"><a href="#"><i class="fas fa-trash-alt i-style"></i></a></li>
                        <li class="menu__list__item"><a href="#"><i class="far fa-list-alt i-style"></i></a></li>
                    </ul>
                </div>
                <div class="button" id="nav-icon4">
                    <span class="button__line"></span>
                    <span class="button__line"></span>
                    <span class="button__line"></span>
                </div>
            </div>
        </div>

        <div class="product-detail-wrap">
            <div class="left-box">
                <div class="photo">
                    <%-- 사진 넣는 란 --%>
                </div>
                <div class="qtn">
                    <span>수량
                        <div class="bar"></div>
                        ${product.product_qtn}
                    </span>
                </div>
                <a href="#">
                    <div class="share">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/kakao_icon.png" alt="카카오톡">
                        공유하기
                    </div>
                </a>
            </div>
            <div class="right-box">
                <ul>
                    <li>
                        <div class="title">이름</div>
                        <div class="detail">${product.product_name}</div>
                    </li>
                    <c:if test="${not empty baseCategory.cate_name1}">
                        <li>
                            <div class="title">${baseCategory.cate_name1}</div>
                            <c:choose>
                                <c:when test="${not empty category.cate_detail1}">
                                    <div class="detail">${category.cate_detail1}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="detail">-</div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:if>
                    <c:if test="${not empty baseCategory.cate_name2}">
                        <li>
                            <div class="title">${baseCategory.cate_name2}</div>
                            <c:choose>
                                <c:when test="${not empty category.cate_detail2}">
                                    <div class="detail">${category.cate_detail2}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="detail">-</div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:if>
                    <c:if test="${not empty baseCategory.cate_name3}">
                        <li>
                            <div class="title">${baseCategory.cate_name3}</div>
                            <c:choose>
                                <c:when test="${not empty category.cate_detail3}">
                                    <div class="detail">${category.cate_detail3}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="detail">-</div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:if>
                    <c:if test="${not empty baseCategory.cate_name4}">
                        <li>
                            <div class="title">${baseCategory.cate_name4}</div>
                            <c:choose>
                                <c:when test="${not empty category.cate_detail4}">
                                    <div class="detail">${category.cate_detail4}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="detail">-</div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:if>
                    <c:if test="${not empty baseCategory.cate_name5}">
                        <li>
                            <div class="title">${baseCategory.cate_name5}</div>
                            <c:choose>
                                <c:when test="${not empty category.cate_detail5}">
                                    <div class="detail">${category.cate_detail5}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="detail">-</div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:if>
                    <li>
                        <div class="title">메모</div>
                        <div class="detail">
                            ${product.product_memo}
                                <span class="more">
                                    <a href="#" id="more">더보기</a>
                                </span>
                        </div>
                    </li>
                </ul>
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


<%--detail JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>
<%-- sweet alert --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
        $('#nav-icon3').click(function () {
            $(this).toggleClass('open');
        });

        document.querySelector('.button').addEventListener('click', () => {
            document.querySelector('.menu__list')
                .classList.toggle('menu__list--animate');
        });

        $('#nav-icon4').click(function () {
            $(this).toggleClass('open');
        });

        // sweetalert
        $('#more').click(function (){
           swal({
              text: "${product.product_memo}"
           });
        });



    });
</script>
</html>
