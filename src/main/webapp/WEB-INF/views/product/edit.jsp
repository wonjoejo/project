<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="box_no" value="${sessionScope.permission.box_no}"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=4">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/productDetail.css?ver=2">
</head>
<body>
<c:set var="box_no" value="${product.box_no}"/>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="top-content">
        
        	<jsp:include page="../common/leftmobile.jsp"/><!-- 모바일용메뉴 -->
        
            <h1>물품 정보 수정</h1>

            <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
            </a>
        </div> <!-- top-content -->

        <form method="POST" action="/product/edit" enctype="multipart/form-data">
            <input type="hidden" name="product_no" value="${product.product_no}">
            <input type="hidden" name="box_no" value="${product.box_no}">
<%--            <input type="hidden" name="update_date" value="${product.update_date}">--%>

            <div class="product-detail-wrap">
                <div class="left-box" id="left-box">
                    <div class="photo">
                        <div class = "product-photo" id="photo-upload"
                            style="background-image: url(https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name});">  
                            <input type="file" name="file" id="box-photo">
                            <input type="hidden" name="product_photo_name" id="default" value="${product.product_photo_name}">
                            <input type="hidden" name="product_photo_path"
                                    value="${product.product_photo_path}">
                            <span><i class="fas fa-upload"></i>파일 업로드</span>
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
                                </div> <!-- photos-->
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
                            <input type="number" name="product_qtn" value="${product.product_qtn}" required>
                        </span>
                    </div> <!-- qtn -->
                </div> <!-- left-box -->

                <div class="right-box">
                    <ul>
                        <li>
                            <div class="title">이름</div>
                            <input type="text" name="product_name" value="${product.product_name}" class="detail">
                        </li>
                        <c:if test="${not empty baseCategory.cate_name1}">
                            <li>
                                <div class="title">${baseCategory.cate_name1}</div>
                                <input type="text" name="cate_detail1" value="${category.cate_detail1}" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name2}">
                            <li>
                                <div class="title">${baseCategory.cate_name2}</div>
                                <input type="text" name="cate_detail2" value="${category.cate_detail2}" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name3}">
                            <li>
                                <div class="title">${baseCategory.cate_name3}</div>
                                <input type="text" name="cate_detail3" value="${category.cate_detail3}" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name4}">
                            <li>
                                <div class="title">${baseCategory.cate_name4}</div>
                                <input type="text" name="cate_detail4" value="${category.cate_detail4}" class="detail">
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name5}">
                            <li>
                                <div class="title">${baseCategory.cate_name5}</div>
                                <input type="text" name="cate_detail5" value="${category.cate_detail5}" class="detail">
                            </li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/category/detail?box_no=${product.box_no}">
                            <div class="to-category">+ 상세 카테고리 추가하기</div>
                        </a>
                        <li>
                            <div class="title">메모</div>
                            <textarea id="detail-memo" name="product_memo"
                                      class="detail detail-memo">${product.product_memo}</textarea>
                        </li>
                        <ul class="suggestions">
                        </ul>
                    </ul>
                </div> <!-- right-box -->
            </div> <!-- product-detail-wrap -->

            <div class="buttons btn-product">
                <button class="submit-btn hvr-float" type="submit">완료</button>
                <a href="${pageContext.request.contextPath}/product/detail?product_no=${product.product_no}&box_no=${product.box_no}"><input
                        class="cancel-btn hvr-float" type="button" value="취소"></a>
            </div> <!-- buttons btn-product -->
        </form>
    </div> <!-- main-container -->
</div> <!-- container -->

</body>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


<%--boxmenu JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>
<%-- productEdit JS--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/productEdit.js?ver=2"></script>
<%-- sweet alert --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- product JS --%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/product.js"></script>


<script>
	const box_no = '${box_no}';
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


	});
</script>
<%-- mention JS --%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/mention.js?ver=3"></script>
</html>
