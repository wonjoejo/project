<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=4">

</head>
<body>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <h1>나의 박스</h1>
        <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
            <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
        </a>

        <div class="list-wrapper">
            <div class="box-info-container">
            <form method="post" action="/box/edit" enctype="multipart/form-data">
                <input type="hidden" name="member_id" value="${sessionScope.member_id}">

        <div class="box-information">
                <div class="box-img">
                <c:set var="path" value="${box.box_photo_path}"/>
                <c:choose>
                    <c:when test="${fn:contains(path,'resource')}">
                        <img src="${pageContext.request.contextPath}${box.box_photo_path}${box.box_photo_name}"/>
                    </c:when>
                    <c:otherwise>
                        <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/${box.box_photo_path}${box.box_photo_name}"/>
                    </c:otherwise>
                </c:choose>
                        ${box.box_name}
                </div>
                <div class="box-memo">
                    <div class="title">
                    MEMO
                    </div>
                    <div class="memo">
                    ${box.box_memo}
                    </div>
                    <div class="buttons">
                    <button class="btn" onclick="location.href='/box/editview'"><i class="fas fa-pencil-alt"></i> 수정</button>
                    <button class="btn delete-btn"><i class="fas fa-trash"></i> 삭제</button>
                    </div>
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



</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/box.js?ver=2"></script>
<script>
    const deleteBtn = document.querySelector(".delete-btn");

	deleteBtn.addEventListener("click",function (e) {
		e.preventDefault();
		Swal.fire({
			title: '정말 삭제하시겠습니까?',
			text: "한 번 삭제된 박스는 복구가 불가능합니다",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#5A95F5',
			cancelButtonColor: '#d33',
			confirmButtonText: '삭제',
            cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire(
					'삭제 완료',
					'박스가 삭제되었습니다',
					'success'
				)
			}
		})
	})

</script>
</html>
