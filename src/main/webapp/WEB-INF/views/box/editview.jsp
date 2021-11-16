<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=12">
</head>
<body>


<div class="container">
    <jsp:include page="../common/left.jsp"/>

    <div class="main-container">
        <h1>박스 수정</h1>

        <div class="box-wrapper">
            <form method="post" action="/box/edit" enctype="multipart/form-data">
                <input type="hidden" name="member_id" value="${sessionScope.member_id}">
            <div class="form-container">

                    <div class="box-photos">
                        <div class="product-photo-edit">
                        <input type="file" name="file" id="box-photo">
                        <input type="hidden" name="box_photo_name" id="default" value="${box.box_photo_name}">
                        <input type="hidden" name="box_photo_path" value="${pageContext.request.contextPath}/resources/assets/img/">
                        </div>
                        <div class="default-photos carousel slide" data-bs-ride="carousel" data-bs-touch="false" data-bs-interval="false" id="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="photos">
                        <div class="cell hvr-grow"><img src="${pageContext.request.contextPath}/resources/assets/img/food.png" class="default-img"></div>
                        <div class="cell hvr-grow"><img src="${pageContext.request.contextPath}/resources/assets/img/cosmetic.png" class="default-img"></div>
                        <div class="cell hvr-grow"><img src="${pageContext.request.contextPath}/resources/assets/img/pill.png" class="default-img"></div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="photos">
                        <div class="cell hvr-grow"><img src="${pageContext.request.contextPath}/resources/assets/img/clothes.png" class="default-img"></div>
                        <div class="cell hvr-grow"><img src="${pageContext.request.contextPath}/resources/assets/img/goods.png" class="default-img"></div>
                        <div class="cell hvr-grow"><img src="${pageContext.request.contextPath}/resources/assets/img/photo_name.png" class="default-img"></div>
                            </div>
                            </div>
                        </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                    </div>
                    </div>

                    <div class="inputs">
                        <div class="input-container">
                        <div class="box-name">
                        <span class="label">박스 이름</span>
                    <input type="text" name="box_name" value="${box.box_name}">
                        </div>
                        </div>
                        <span class="label">박스 메모</span>
                    <textarea rows="5" cols="10" name="box_memo">${box.box_memo}</textarea>
                    </div>
            </div>

            <div class="buttons">
                <input class="submit-btn hvr-float" type="submit" value="수정하기">
                <a href="${pageContext.request.contextPath}/box/get?box_no=${box.box_no}"><input class="cancel-btn hvr-float" type="button" value="취소"></a>
            </div>

            </form>

        </div>
    </div>


</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/box.js?ver=6"></script>
<script>
    // const productPhotoEdit = document.querySelector(".product-photo-edit");
    const photoPath = "${box.box_photo_path}";
    console.log(photoPath);

    if(photoPath.indexOf("resources")!==-1) {
	    productPhotoEdit.style.backgroundImage = "url('${pageContext.request.contextPath}${box.box_photo_path}${box.box_photo_name}')";
    } else {
	    productPhotoEdit.style.backgroundImage = "url('https://intobox.s3.ap-northeast-2.amazonaws.com/${box.box_photo_path}${box.box_photo_name}')";
    }





</script>
</html>
