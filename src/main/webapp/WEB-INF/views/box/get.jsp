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
        <div class="title-container">
            <h1>나의 박스</h1>
            <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
            </a>
        </div>
        <div class="list-wrapper">
            <div class="box-info-container">
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
                    <c:set var="session_id" value="${sessionScope.member_id}"/>
                    <c:set var="member_id" value="${box.member_id}"/>
                    <c:choose>
                        <c:when test="${session_id==member_id}">
                            <div class="buttons">
                                <button class="btn" onclick="location.href='/box/editview?box_no=${box.box_no}'"><i class="fas fa-pencil-alt"></i> 수정</button>
                                <button class="btn delete-btn"><i class="fas fa-trash"></i> 삭제</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="buttons">
                                <button class="btn" onclick="location.href='/box/editview?box_no=${box.box_no}'" disabled data-bs-toggle="tooltip" data-bs-placement="top" title="박스 수정은 박스 마스터만 가능합니다"><i class="fas fa-pencil-alt"></i> 수정</button>
                                <button class="btn delete-btn" disabled data-bs-toggle="tooltip" data-bs-placement="top" title="박스 삭제는 박스 마스터만 가능합니다"><i class="fas fa-trash"></i> 삭제</button>
                            </div>
                        </c:otherwise>
                    </c:choose>

            </div>
                </div>
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



                </form>
            </div>
        </div>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js" integrity="sha512-nnzkI2u2Dy6HMnzMIkh7CPd1KX445z38XIu4jG1jGw7x5tSL3VBjE44dY4ihMU1ijAQV930SPM12cCFrB18sVw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/assets/js/box.js?ver=2"></script>
<script>

	const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	});

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
