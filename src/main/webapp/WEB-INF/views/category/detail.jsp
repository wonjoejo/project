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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/baseCategory.css?ver=2">
</head>
<body>
<c:set var="box_no" value="${box_no}"/>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="top-content">
            <h1>카테고리</h1>
            <a href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
                <button class="box-list-btn"><i class="fas fa-list-ul list-icon"></i>박스 리스트</button>
            </a>
        </div>

        <div class="sub-content-wrap">
            <div class="cate-table-wrap">
                <div class="cate-table-header">
                    <div>Name</div>
                </div>
                <form name="deleteForm">
                    <input type="hidden" name="category_no" id="category-no" value="${baseCategory.category_no}">
                    <input type="hidden" name="box_no" id="box-no" value="${param.box_no}">
                    <ul class="cate-ul">
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name1}">

                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail1" id="cate-detail1"
                                               value="${allCategory.cate_detail1}">
                                    </c:forEach>
                                    <input id="cate_name1" type="text" name="cate_name1"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name1}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style del-btn del-btn1">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="button" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail1" id="cate-detail1"
                                               value="${allCategory.cate_detail1}">
                                    </c:forEach>
                                    <input type="text" name="cate_name1" id="cate_name1"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리1"
                                           value="${baseCategory.cate_name1}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style no-name-add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style no-name-modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style no-name-del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name2}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail2" id="cate-detail2"
                                               value="${allCategory.cate_detail2}">
                                    </c:forEach>
                                    <input id="cate_name2" type="text" name="cate_name2"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name2}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style del-btn del-btn2">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="button" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail2" id="cate-detail2"
                                               value="${allCategory.cate_detail2}">
                                    </c:forEach>
                                    <input type="text" name="cate_name2" id="cate_name2"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리2"
                                           value="${baseCategory.cate_name2}" disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style no-name-add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style no-name-modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style no-name-del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name3}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail3" id="cate-detail3"
                                               value="${allCategory.cate_detail3}">
                                    </c:forEach>
                                    <input id="cate_name3" type="text" name="cate_name3"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name3}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style del-btn del-btn3">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="button" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail3" id="cate-detail3"
                                               value="${allCategory.cate_detail3}">
                                    </c:forEach>
                                    <input type="text" name="cate_name3" id="cate_name3"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리3"
                                           value="${baseCategory.cate_name3}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style no-name-add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style no-name-modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style no-name-del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name4}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail4" id="cate-detail4"
                                               value="${allCategory.cate_detail4}">
                                    </c:forEach>
                                    <input id="cate_name4" type="text" name="cate_name4"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name4}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style del-btn del-btn4">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="button" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail4" id="cate-detail4"
                                               value="${allCategory.cate_detail4}">
                                    </c:forEach>
                                    <input type="text" name="cate_name4" id="cate_name4"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리4"
                                           value="${baseCategory.cate_name4}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style no-name-add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style no-name-modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style no-name-del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name5}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail5" id="cate-detail5"
                                               value="${allCategory.cate_detail5}">
                                    </c:forEach>
                                    <input id="cate_name5" type="text" name="cate_name5"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name5}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style del-btn del-btn5">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="button" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_detail5" id="cate-detail5"
                                               value="${allCategory.cate_detail5}">
                                    </c:forEach>
                                    <input type="text" name="cate_name5" id="cate_name5"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리5"
                                           value="${baseCategory.cate_name5}"
                                           disabled>

                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style no-name-add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style no-name-modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                        <button type="button" class="btn-style no-name-edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="submit" class="btn-style no-name-del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                </form>
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

<%-- boxmenu JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>
<%-- baseCateogy JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/baseCategory.js"></script>

<script>

    // 추가
    const noNameAddBtn = document.querySelectorAll('.no-name-add-btn');
    noNameAddBtn.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item.nextElementSibling.nextElementSibling);
            console.log(item.parentElement.previousElementSibling);

            item.parentElement.previousElementSibling.disabled = false;
            item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
            item.style.display = "none";
            item.nextElementSibling.style.display = "inline-block";
            item.nextElementSibling.nextElementSibling.style.display = "inline-block";
        })
    })

    // 취소
    const noNameModifyCancelBtn = document.querySelectorAll(".no-name-modify-cancel-btn");
    noNameModifyCancelBtn.forEach(function (item, idex) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item)
            console.log(item.parentElement.previousElementSibling);

            item.parentElement.previousElementSibling.disabled = true;
            item.parentElement.previousElementSibling.style.border = "none";
            item.parentElement.previousElementSibling.value = "";
            item.style.display = "none";
            item.previousElementSibling.style.display = "none";
            item.previousElementSibling.previousElementSibling.style.display = "inline-block";

        });
    });

    // 완료
    const noNameModifyBtn = document.querySelectorAll(".no-name-modify-btn");
    noNameModifyBtn.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();

            console.log(item.parentElement.previousElementSibling.previousElementSibling);
            console.log(item.previousElementSibling.previousElementSibling);

            let data = {
                category_no: document.querySelector("#category-no").value,
                box_no: document.querySelector("#box-no").value,
                cate_name1: document.querySelector("#cate_name1").value,
                cate_name2: document.querySelector("#cate_name2").value,
                cate_name3: document.querySelector("#cate_name3").value,
                cate_name4: document.querySelector("#cate_name4").value,
                cate_name5: document.querySelector("#cate_name5").value
            };

            if (item.parentElement.previousElementSibling.value == "") {
                alert("값을 입력하세요");
            } else {
                fetch('/category/edit', {
                    method: 'POST',
                    body: JSON.stringify(data),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(function (response) {
                    if (response) {
                        item.parentElement.previousElementSibling.disabled = true;
                        item.parentElement.previousElementSibling.style.border = "none"

                        item.style.display = "none";
                        item.nextElementSibling.style.display = "none";
                        // item.previousElementSibling.style.display = "none";
                        item.nextElementSibling.nextElementSibling.style.display = "inline-block";
                        item.nextElementSibling.nextElementSibling.nextElementSibling.style.display = "inline-block";

                    } else {
                        console.log(response.status);
                    }
                }); // fetch
            } // if-else

        }); // addModifyBtn click
    }); // addModifyBtn forEach

    // 수정
    const noNameEditBtn = document.querySelectorAll(".no-name-edit-btn");
    noNameEditBtn.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item.parentElement.previousElementSibling);
            console.log(item.nextElementSibling);

            item.parentElement.previousElementSibling.disabled = false;
            item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
            item.style.display = "none";
            item.nextElementSibling.style.display = "none";
            item.previousElementSibling.style.display = "inline-block";
            item.previousElementSibling.previousElementSibling.style.display = "inline-block";
        });
    });


    const editBtn = document.querySelectorAll(".edit-btn");
    editBtn.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item.parentElement.previousElementSibling);
            console.log(item.nextElementSibling);

            item.parentElement.previousElementSibling.disabled = false;
            item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
            item.style.display = "none";
            item.nextElementSibling.style.display = "none";
            item.nextElementSibling.nextElementSibling.style.display = "inline-block";
            item.nextElementSibling.nextElementSibling.nextElementSibling.style.display = "inline-block";
        });
    });

    const modifyCancelBtn2 = document.querySelectorAll(".modify-cancel-btn");
    modifyCancelBtn2.forEach(function (item, idex) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item.parentElement.previousElementSibling);
            console.log(item.previousElementSibling);

            location.href = "/category/detail?box_no=${box_no}";
            // item.parentElement.previousElementSibling.disabled = true;
            // item.parentElement.previousElementSibling.style.border = "none"
            // item.parentElement.previousElementSibling.value = "";
            //
            // item.style.display = "none";
            // item.previousElementSibling.style.display = "none";
            // item.previousElementSibling.previousElementSibling.style.display = "inline-block";
            // item.previousElementSibling.previousElementSibling.previousElementSibling.style.display = "inline-block";

        });
    });

    const modifyCompleteBtn = document.querySelectorAll(".modify-btn");
    modifyCompleteBtn.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();

            console.log(item.parentElement.previousElementSibling.previousElementSibling);
            console.log(item.previousElementSibling.previousElementSibling);

            let data = {
                category_no: document.querySelector("#category-no").value,
                box_no: document.querySelector("#box-no").value,
                cate_name1: document.querySelector("#cate_name1").value,
                cate_name2: document.querySelector("#cate_name2").value,
                cate_name3: document.querySelector("#cate_name3").value,
                cate_name4: document.querySelector("#cate_name4").value,
                cate_name5: document.querySelector("#cate_name5").value
            };

            console.log(data);

            if (item.parentElement.previousElementSibling.value == "") {
                alert("값을 입력하세요");
            } else {
                fetch('/category/edit', {
                    method: 'POST',
                    body: JSON.stringify(data),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(function (response) {
                    if (response) {
                        item.parentElement.previousElementSibling.disabled = true;
                        item.parentElement.previousElementSibling.style.border = "none"

                        item.style.display = "none";
                        item.nextElementSibling.style.display = "none";
                        item.previousElementSibling.style.display = "inline-block";
                        item.previousElementSibling.previousElementSibling.style.display = "inline-block";

                    } else {
                        console.log(response.status);
                    }
                }); // fetch
            } // if-else

        }); // modifyCompleteBtn click
    }); // modifyCompleteBtn forEach


    const deleteBtn = document.querySelectorAll(".del-btn");
    deleteBtn.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item.parentElement.previousElementSibling);
            console.log(item.parentNode);

            item.parentElement.previousElementSibling.value = "";

            if (item.classList.contains('del-btn1')) {
                document.querySelector('#cate-detail1').value = "";
            } else if (item.classList.contains('del-btn2')) {
                document.querySelector('#cate-detail2').value = "";
            } else if (item.classList.contains('del-btn3')) {
                document.querySelector('#cate-detail3').value = "";
            } else if (item.classList.contains('del-btn4')) {
                document.querySelector('#cate-detail4').value = "";
            } else if (item.classList.contains('del-btn5')) {
                document.querySelector('#cate-detail5').value = "";
            }

            // fetch
            let data = {
                category_no: document.querySelector("#category-no").value,
                box_no: document.querySelector("#box-no").value,
                cate_name1: document.querySelector("#cate_name1").value,
                cate_name2: document.querySelector("#cate_name2").value,
                cate_name3: document.querySelector("#cate_name3").value,
                cate_name4: document.querySelector("#cate_name4").value,
                cate_name5: document.querySelector("#cate_name5").value
            };

            console.log(data);

            fetch('/category/edit', {
                method: 'POST',
                body: JSON.stringify(data),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {
                if (response) {
                    // item.parentElement.previousElementSibling.disabled = true;
                    // item.parentElement.previousElementSibling.style.border = "none"

                    item.style.display = "none";
                    item.previousElementSibling.style.display = "none";
                    item.nextElementSibling.nextElementSibling.nextElementSibling.style.display="inline-block";
                } else {
                    console.log(response.status);
                }
            }); // fetch

            const data2 = {
                category_no: document.querySelector("#category-no").value,
                cate_detail1: document.querySelector("#cate-detail1").value,
                cate_detail2: document.querySelector("#cate-detail2").value,
                cate_detail3: document.querySelector("#cate-detail3").value,
                cate_detail4: document.querySelector("#cate-detail4").value,
                cate_detail5: document.querySelector("#cate-detail5").value
            }

            console.log(data2);

            fetch('/category/deleteCategory', {
                method: 'POST',
                body: JSON.stringify(data2),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {
                if (response) {
                    // item.parentElement.previousElementSibling.disabled = true;
                    // item.parentElement.previousElementSibling.style.border = "none"

                    item.style.display = "none";
                    item.previousElementSibling.style.display = "none";
                    item.nextElementSibling.nextElementSibling.nextElementSibling.style.display="inline-block";
                } else {
                    console.log(response.status);
                }
            }); // fetch


        }); // click
    }); // deleteBtn


</script>
</html>
