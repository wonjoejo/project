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
    <jsp:include page="../common/left.jsp"/>

    <div class="main-container">
        <h1>박스 생성</h1>

        <div class="box-wrapper">
            <form method="post" action="/box/create" enctype="multipart/form-data">
                <input type="hidden" name="member_id" value="${sessionScope.member_id}">
                <div class="form-container">

                    <div class="box-photos">
                        <div class="product-photo">
                            <input type="file" name="file" id="box-photo">
                            <input type="hidden" name="box_photo_name" id="default">
                            <input type="hidden" name="box_photo_path"
                                   value="${pageContext.request.contextPath}/resources/assets/img/">
                        </div>
                        <div class="default-photos carousel slide" data-bs-ride="carousel" data-bs-touch="false"
                             data-bs-interval="false" id="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="photos">
                                        <div class="cell hvr-grow"><img
                                                src="${pageContext.request.contextPath}/resources/assets/img/food.png"
                                                class="default-img"></div>
                                        <div class="cell hvr-grow"><img
                                                src="${pageContext.request.contextPath}/resources/assets/img/cosmetic.png"
                                                class="default-img"></div>
                                        <div class="cell hvr-grow"><img
                                                src="${pageContext.request.contextPath}/resources/assets/img/pill.png"
                                                class="default-img"></div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="photos">
                                        <div class="cell hvr-grow"><img
                                                src="${pageContext.request.contextPath}/resources/assets/img/clothes.png"
                                                class="default-img"></div>
                                        <div class="cell hvr-grow"><img
                                                src="${pageContext.request.contextPath}/resources/assets/img/goods.png"
                                                class="default-img"></div>
                                        <div class="cell hvr-grow"><img
                                                src="${pageContext.request.contextPath}/resources/assets/img/photo_name.png"
                                                class="default-img"></div>
                                    </div>
                                </div>
                            </div>
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
                        </div>
                    </div>

                    <div class="inputs">
                        <div class="input-container">
                            <div class="box-name">
                                <span class="label">박스 이름</span>
                                <input type="text" name="box_name" placeholder="박스 이름을 입력해 주세요">
                            </div>
                            <%--<c:if> 문 써서 기업회원인지 확인 후, 개인 회원일 경우에만 박스 모드 선택 노출--%>
                            <div class="box-mode">
                                <span class="label">박스 모드</span>
                                <select class="mode-select" name="box_mode">
                                    <option selected disabled>모드를 선택하세요</option>
                                    <option value="1">식품</option>
                                    <option value="2">화장품</option>
                                    <option value="3">의약품</option>
                                    <option value="4">의류</option>
                                    <option value="5">굿즈</option>
                                    <option value="6">기타</option>
                                </select>
                            </div>
                        </div>
                        <span class="label">박스 메모</span>
                        <textarea rows="5" cols="10" name="box_memo" placeholder="박스의 간단한 설명을 입력해 주세요"></textarea>
                    </div>
                </div>

                <div class="buttons">
                    <input class="submit-btn hvr-float" type="submit" value="생성하기">
                    <a href="${pageContext.request.contextPath}/box/list?${sessionScope.member_id}"><input
                            class="cancel-btn hvr-float" type="button" value="취소"></a>
                </div>

            </form>

        </div>
    </div>


</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/box.js?ver=3"></script>
<script>
	Swal.fire({
		position: 'top-end',
		icon: 'success',
		title: 'Your work has been saved',
		showConfirmButton: false,
		timer: 1500
	})
</script>
</html>
