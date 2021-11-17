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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/baseCategory.css?ver=1">
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
                <form action="/category/edit" method="POST">
                    <input type="hidden" name="category_no" value="${baseCategory.category_no}">
                    <input type="hidden" name="box_no" value="${param.box_no}">
                    <ul class="cate-ul">
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name1}">
                                    <input type="text" name="cate_name1" class="cate-name input-border"
                                           value="${baseCategory.cate_name1}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn2">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="cate_name1" id="cate1"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리1"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name2}">
                                    <input type="text" name="cate_name2" class="cate-name input-border"
                                           value="${baseCategory.cate_name2}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn2">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="cate_name2" id="cate2"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리2"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name3}">
                                    <input type="text" name="cate_name3" class="cate-name input-border" value="${baseCategory.cate_name3}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn2">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="cate_name3" id="cate3"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리3"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name4}">
                                    <input type="text" name="cate_name4" class="cate-name input-border" value="${baseCategory.cate_name4}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn2">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="cate_name4" id="cate4"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리4"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name5}">
                                    <input type="text" name="cate_name5" class="cate-name input-border" value="${baseCategory.cate_name5}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn2">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="cate_name5" id="cate5"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리5"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                        <button type="submit" class="btn-style modify-btn">
                                            <i class="fas fa-check"></i>
                                            <span>완료</span>
                                        </button>
                                        <button type="reset" class="btn-style modify-cancel-btn">
                                            <i class="fas fa-check"></i>
                                            <span>취소</span>
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

    const addBtns = document.querySelectorAll('.add-btn');

    addBtns.forEach(function (item, index) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item);
            console.log(index);
            console.log(item.nextElementSibling.nextElementSibling);
            console.log(item.parentElement.previousElementSibling);
            item.parentElement.previousElementSibling.disabled = false;
            item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
            item.style.display = "none";
            item.nextElementSibling.style.display = "inline-block";
            item.nextElementSibling.nextElementSibling.style.display = "inline-block";
        })
    })

    const modifyCancelBtn = document.querySelectorAll(".modify-cancel-btn");
    modifyCancelBtn.forEach(function (item, idex) {
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

    const editBtn = document.querySelectorAll(".edit-btn");
    editBtn.forEach(function (item, index){
       item.addEventListener("click", function (e){
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

    const modifyCancelBtn2 = document.querySelectorAll(".modify-cancel-btn2");
    modifyCancelBtn2.forEach(function (item, idex) {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            console.log(item.parentElement.previousElementSibling);
            console.log(item.previousElementSibling);

            item.parentElement.previousElementSibling.disabled = true;
            item.parentElement.previousElementSibling.style.border = "none"
            item.style.display = "none";
            item.previousElementSibling.style.display = "none";
            item.previousElementSibling.previousElementSibling.style.display = "inline-block";
            item.previousElementSibling.previousElementSibling.previousElementSibling.style.display = "inline-block";

        });
    });



</script>
</html>
