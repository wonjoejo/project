<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/productDetail.css?ver=4">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/mention.css?ver=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
          integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="top-content">

            <jsp:include page="../common/leftmobile.jsp"/><!-- 모바일용메뉴 -->

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
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/food.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/cosmetic.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/pill.png"
                                            class="default-img"></div>
                                </div> <!-- photos -->
                            </div> <!-- carousel-item active -->
                            <div class="carousel-item">
                                <div class="photos">
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/clothes.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/goods.png"
                                            class="default-img"></div>
                                    <div class="cell hvr-grow"><img
                                            src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/photo_name.png"
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
                            <input type="text" name="product_name" class="detail" required>
                        </li>
                        <c:if test="${not empty baseCategory.cate_name1}">
                            <li>
                                <c:choose>
                                    <c:when test="${fn:contains(baseCategory.cate_name1,'일자') || fn:contains(baseCategory.cate_name1,'기한') || fn:contains(baseCategory.cate_name1,'날짜') }">
                                        <div class="title">${baseCategory.cate_name1}</div>
                                        <input type="text" id="datePicker" name="cate_detail1"
                                               class="detail datePicker">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="title">${baseCategory.cate_name1}</div>
                                        <input type="text" name="cate_detail1" class="detail">
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name2}">
                            <li>
                                <c:choose>
                                    <c:when test="${fn:contains(baseCategory.cate_name2,'일자') || fn:contains(baseCategory.cate_name2,'기한') || fn:contains(baseCategory.cate_name2,'날짜') }">
                                        <div class="title">${baseCategory.cate_name2}</div>
                                        <input type="text" id="datePicker" name="cate_detail2"
                                               class="detail datePicker">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="title">${baseCategory.cate_name2}</div>
                                        <input type="text" name="cate_detail2" class="detail">
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name3}">
                            <li>
                                <c:choose>
                                    <c:when test="${fn:contains(baseCategory.cate_name3,'일자') || fn:contains(baseCategory.cate_name3,'기한') || fn:contains(baseCategory.cate_name3,'날짜') }">
                                        <div class="title">${baseCategory.cate_name3}</div>
                                        <input type="text" id="datePicker" name="cate_detail3"
                                               class="detail datePicker">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="title">${baseCategory.cate_name3}</div>
                                        <input type="text" name="cate_detail3" class="detail">
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name4}">
                            <li>
                                <c:choose>
                                    <c:when test="${fn:contains(baseCategory.cate_name4,'일자') || fn:contains(baseCategory.cate_name4,'기한') || fn:contains(baseCategory.cate_name4,'날짜') }">
                                        <div class="title">${baseCategory.cate_name4}</div>
                                        <input type="text" id="datePicker" name="cate_detail4"
                                               class="detail datePicker">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="title">${baseCategory.cate_name4}</div>
                                        <input type="text" name="cate_detail4" class="detail">
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name5}">
                            <li>
                                <c:choose>
                                    <c:when test="${fn:contains(baseCategory.cate_name5,'일자') || fn:contains(baseCategory.cate_name5,'기한') || fn:contains(baseCategory.cate_name5,'날짜') }">
                                        <div class="title">${baseCategory.cate_name5}</div>
                                        <input type="text" id="datePicker" name="cate_detail5"
                                               class="detail datePicker">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="title">${baseCategory.cate_name5}</div>
                                        <input type="text" name="cate_detail5" class="detail">
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/category/detail?box_no=${param.box_no}">
                            <div class="to-category">+ 상세 카테고리 추가하기</div>
                        </a>
                        <li>
                            <div class="title">메모</div>
                            <textarea name="product_memo" class="detail" id="detail-memo-insert"
                                      placeholder="@으로 그룹원 태그가 가능합니다."></textarea>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
        integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datepicker.ko.js"></script>


<%--boxmenu JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>


<script>

	const box_no = '${param.box_no}';
</script>

<%-- mention 기능 실험중 --%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/productEdit.js?ver=4"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/mention.js?ver=5"></script>

</html>
