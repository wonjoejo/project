<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<c:set var="box_no" value="${product.box_no}"/>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <input type="hidden" name="product_no" value="${product.product_no}">
    <input type="hidden" name="box_no" value="${product.box_no}">
    <div class="main-container">
        <div class="top-content">
            <h1>물품 상세보기</h1>

            <div class="wrapper">
                <div class="hamburger">
                    <ul class="menu__list">
                        <li class="menu__list__item"><a
                                href="${pageContext.request.contextPath}/product/edit?product_no=${product.product_no}&box_no=${product.box_no}"><i
                                class="fas fa-pencil-alt i-style"></i></a></li>
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
                        <!-- product_photo의 이름과 경로가 모두 null이 아닐 때 -->
                        <c:if test="${not empty product.product_photo_name && not empty product.product_photo_path}">
                            <div class="item" id="product-img">
                                <c:set var="path" value="${product.product_photo_path}"/>
                                <c:choose>
                                    <c:when test="${fn:contains(path,'resource')}"> <!-- 기본이미지 사용 -->
                                        <img  id="photo-default" src="${pageContext.request.contextPath}${product.product_photo_path}${product.product_photo_name}"/>
                                    </c:when>
                                    <c:otherwise> <!-- 업로드 이미지 사용 -->
                                        <img  id="photo-upload" src="https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:if> <!-- product-img -->

                        <!-- product_photo의 이름과 경로 중 하나라도 null일때 -->
                        <c:if test="${empty product.product_photo_name || empty product.product_photo_path}">
                            <div class="item" id="photo-none-img">
                            </div>
                        </c:if> <!-- product-none-img -->
                </div>
                <div class="qtn">
                    <span>수량
                        <div class="bar"></div>
                        ${product.product_qtn}
                    </span>
                </div>
                <a href="javascript:sendLink()">
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
<%-- kakao sdk --%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
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
        $('#more').click(function () {
            swal({
                text: "${product.product_memo}"
            });
        });

    }); // document.ready

    // 카카오 공유하기
    Kakao.init('bf8980d064e0888e1bf9f6692ff4951f'); // 초기화

    let detailList = [];
    if ('${category.cate_detail1}' != ""){
        detailList.push('#${category.cate_detail1}');
    }
    if ('${category.cate_detail2}' != ""){
        detailList.push('#${category.cate_detail2}');
    }
    if ('${category.cate_detail3}' != ""){
        detailList.push('#${category.cate_detail3}');
    }
    if ('${category.cate_detail4}' != ""){
        detailList.push('#${category.cate_detail4}');
    }
    if ('${category.cate_detail5}' != ""){
        detailList.push('#${category.cate_detail5}');
    }


    console.log(detailList);

    function sendLink() {
        Kakao.Link.sendDefault({
            objectType: 'feed',
            content: {
                title: '${product.product_name}',
                description: detailList.toString(),
                imageUrl:
                    'https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}',
                link: {
                    mobileWebUrl: window.location.href,
                    webUrl: window.location.href,
                },
            },
            buttons: [
                {
                    title: '웹으로 보기',
                    link: {
                        mobileWebUrl: window.location.href,
                        webUrl: window.location.href,
                    },
                },

            ],
        })
    }
</script>
</html>
