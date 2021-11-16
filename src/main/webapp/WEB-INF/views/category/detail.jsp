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
                <form method="POST">
                    <input type="hidden" value="${baseCategory.box_no}">
                    <ul class="cate-ul">
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name1}">
                                    <input type="text" id="input1" class="cate-name input-border"
                                           value="${baseCategory.cate_name1}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn" id="editBtn1">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="cate-name none-cate-name">카테고리1</div>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name2}">
                                    <input type="text" id class="cate-name input-border"
                                           value="${baseCategory.cate_name2}"
                                           disabled>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style edit-btn" id="editBtn2">
                                            <i class="fas fa-pencil-alt"></i>
                                            <span>수정</span>
                                        </button>
                                        <button type="button" class="btn-style del-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>삭제</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="cate-name none-cate-name">카테고리2</div>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name3}">
                                    <input type="text" class="cate-name input-border" value="${baseCategory.cate_name3}"
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
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="cate-name none-cate-name">카테고리3</div>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name4}">
                                    <input type="text" class="cate-name input-border" value="${baseCategory.cate_name4}"
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
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="cate-name none-cate-name">카테고리4</div>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name5}">
                                    <input type="text" class="cate-name input-border" value="${baseCategory.cate_name5}"
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
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="cate-name none-cate-name">카테고리5</div>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-style add-btn">
                                            <i class="fas fa-plus"></i>
                                            <span>추가</span>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/baseCategory.js"></script>

</html>
