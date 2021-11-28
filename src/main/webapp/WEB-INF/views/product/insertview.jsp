<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!-- box.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=3">
    <!-- productDetail.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/productDetail.css?ver=2">
</head>
<body>
<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="top-content">
            <h1>물품 등록</h1>

            <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
            </a>
        </div> <!-- top-content -->

        <form method="POST" action="/product/insert" enctype="multipart/form-data">
            <input type="hidden" name="member_id" value="${sessionScope.member_id}">
            <input type="hidden" name="box_no" value="${box_no}">
 
            <div class="product-detail-wrap">
                <div class="left-box" id="left-box">
                    <div class="photo">

                        <div class="product-photo" id="photo-upload">
                            <input type="file" name="file" id="box-photo">
                            <input type="hidden" name="product_photo_name" id="default">
                            <input type="hidden" name="product_photo_path"
                                   value="default">
                            <span id="img-file-upload"><i class="fas fa-upload"></i>파일 업로드</span>
                        </div> <!-- product-photo -->

                    </div> <!-- photo -->

                    <div class="default-photos carousel slide" data-bs-ride="carousel" data-bs-touch="false"
                         data-bs-interval="false" id="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="photos">
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/7ad6dbbb-cc54-453f-9cd0-8195cbe2f729_food.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/3cf2e166-cfc6-493f-bedd-912c0523f34d_cosmetic.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/54f377cb-c909-4084-affe-ba178a14221e_pill.png"
                                            class="default-img"></div>
                                </div> <!-- photos -->
                            </div> <!-- carousel-item active -->
                            <div class="carousel-item">
                                <div class="photos">
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/b7221ced-af23-4b74-aa45-721576e61034_clothes.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/5b151509-c695-4d76-951a-c788228e2456_goods.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/a1338ab6-7cca-4d58-8f42-1aec03e36a3d_photo_name.png"
                                            class="default-img"></div>
                                </div> <!-- photos -->
                            </div> <!-- carousel-item -->
                        </div> <!-- carousel-inner -->

                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div> <!-- default-photos carousel slide -->

                    <div class="qtn">
                        <span>수량
                            <div class="bar"></div>
                            <input type="number" name="product_qtn" value="0">
                        </span>
                    </div> <!-- qtn -->
                </div> <!-- left-box -->

                <div class="right-box">
                    <ul>
                        <li>
                            <div class="title">이름</div>
                            <input type="text" name="product_name" class="detail">
                        </li>
                        <c:if test="${not empty baseCategory.cate_name1}">
                            <li>
                                <div class="title">${baseCategory.cate_name1}</div>
                                <input type="text" name="cate_detail1" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name2}">
                            <li>
                                <div class="title">${baseCategory.cate_name2}</div>
                                <input type="text" name="cate_detail2" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name3}">
                            <li>
                                <div class="title">${baseCategory.cate_name3}</div>
                                <input type="text" name="cate_detail3" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name4}">
                            <li>
                                <div class="title">${baseCategory.cate_name4}</div>
                                <input type="text" name="cate_detail4" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name5}">
                            <li>
                                <div class="title">${baseCategory.cate_name5}</div>
                                <input type="text" name="cate_detail5" class="detail">
                            </li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/category/detail?box_no=${param.box_no}">
                            <div class="to-category">+ 상세 카테고리 추가하기</div>
                        </a>
                        <li>
                            <div class="title">메모</div>
                            <textarea name="product_memo" class="detail detail-memo"></textarea>
                        </li>
                        <ul class="suggestions">
                        </ul>
                    </ul>
                </div> <!-- right-box -->
            </div> <!-- product-detail-wrap -->

            <div class="buttons btn-product">
                <button class="submit-btn hvr-float" type="submit">완료</button>
                <a href="${pageContext.request.contextPath}/product/listPerPage?box_no=${param.box_no}"><input
                        class="cancel-btn hvr-float" type="button" value="취소"></a>
            </div> <!-- buttons btn-product -->
        </form>
    </div> <!-- main-container -->

</div>
</body>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


<%--boxmenu JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>


<script>

	const box_no = '${param.box_no}';


</script>

<%-- mention 기능 실험중 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/productEdit.js?ver=3"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/mention.js?ver=3"></script>

</html>
