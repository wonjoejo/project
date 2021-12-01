<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="permit" value="${sessionScope.permission}"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/baseCategory.css?ver=3">
</head>
<body>
<c:set var="box_no" value="${box_no}"/>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="top-content">
        
        	<jsp:include page="../common/boxleftmobile.jsp"/>
        
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
                                        <input type="hidden" name="cate_name1" id="cate-detail1"
                                               value="${allCategory.cate_name1}">
                                    </c:forEach>
                                    <input id="cate_name1" type="text" name="cate_name1"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name1}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
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
                                            <button type="reset" class="btn-style modify-cancel-btn modify-cancel-btn1">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name1" id="cate-detail1"
                                               value="${allCategory.cate_name1}">
                                    </c:forEach>
                                    <input type="text" name="cate_name1" id="cate_name1"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리1"
                                           value="${baseCategory.cate_name1}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
                                            <button type="button" class="btn-style edit-btn" style="display: none">
                                                <i class="fas fa-pencil-alt"></i>
                                                <span>수정</span>
                                            </button>
                                            <button type="submit" class="btn-style del-btn del-btn1"
                                                    style="display: none">
                                                <i class="fas fa-trash-alt"></i>
                                                <span>삭제</span>
                                            </button>
                                            <button type="button" class="btn-style modify-btn">
                                                <i class="fas fa-check"></i>
                                                <span>완료</span>
                                            </button>
                                            <button type="reset"
                                                    class="btn-style modify-cancel-btn no-name-modify-cancel-btn modify-cancel-btn1">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn"
                                                    style="display: inline-block">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name2}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name2" id="cate-detail2"
                                               value="${allCategory.cate_name2}">
                                    </c:forEach>
                                    <input id="cate_name2" type="text" name="cate_name2"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name2}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
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
                                            <button type="reset" class="btn-style modify-cancel-btn modify-cancel-btn2">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name2" id="cate-detail2"
                                               value="${allCategory.cate_name2}">
                                    </c:forEach>
                                    <input type="text" name="cate_name2" id="cate_name2"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리2"
                                           value="${baseCategory.cate_name2}" readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
                                            <button type="button" class="btn-style edit-btn" style="display: none">
                                                <i class="fas fa-pencil-alt"></i>
                                                <span>수정</span>
                                            </button>
                                            <button type="submit" class="btn-style del-btn del-btn2"
                                                    style="display: none">
                                                <i class="fas fa-trash-alt"></i>
                                                <span>삭제</span>
                                            </button>
                                            <button type="button" class="btn-style modify-btn">
                                                <i class="fas fa-check"></i>
                                                <span>완료</span>
                                            </button>
                                            <button type="reset"
                                                    class="btn-style modify-cancel-btn no-name-modify-cancel-btn modify-cancel-btn2">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn"
                                                    style="display: inline-block">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name3}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name3" id="cate-detail3"
                                               value="${allCategory.cate_name3}">
                                    </c:forEach>
                                    <input id="cate_name3" type="text" name="cate_name3"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name3}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
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
                                            <button type="reset" class="btn-style modify-cancel-btn modify-cancel-btn3">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name3" id="cate-detail3"
                                               value="${allCategory.cate_name3}">
                                    </c:forEach>
                                    <input type="text" name="cate_name3" id="cate_name3"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리3"
                                           value="${baseCategory.cate_name3}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
                                            <button type="button" class="btn-style edit-btn" style="display: none">
                                                <i class="fas fa-pencil-alt"></i>
                                                <span>수정</span>
                                            </button>
                                            <button type="submit" class="btn-style del-btn del-btn3"
                                                    style="display: none">
                                                <i class="fas fa-trash-alt"></i>
                                                <span>삭제</span>
                                            </button>
                                            <button type="button" class="btn-style modify-btn">
                                                <i class="fas fa-check"></i>
                                                <span>완료</span>
                                            </button>
                                            <button type="reset"
                                                    class="btn-style modify-cancel-btn no-name-modify-cancel-btn modify-cancel-btn3">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn"
                                                    style="display: inline-block">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name4}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name4" id="cate-detail4"
                                               value="${allCategory.cate_name4}">
                                    </c:forEach>
                                    <input id="cate_name4" type="text" name="cate_name4"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name4}"
                                    >

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
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
                                            <button type="reset" class="btn-style modify-cancel-btn modify-cancel-btn4">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name4" id="cate-detail4"
                                               value="${allCategory.cate_name4}">
                                    </c:forEach>
                                    <input type="text" name="cate_name4" id="cate_name4"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리4"
                                           value="${baseCategory.cate_name4}"
                                    >

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
                                            <button type="button" class="btn-style edit-btn" style="display: none">
                                                <i class="fas fa-pencil-alt"></i>
                                                <span>수정</span>
                                            </button>
                                            <button type="submit" class="btn-style del-btn del-btn4"
                                                    style="display: none">
                                                <i class="fas fa-trash-alt"></i>
                                                <span>삭제</span>
                                            </button>
                                            <button type="button" class="btn-style modify-btn">
                                                <i class="fas fa-check"></i>
                                                <span>완료</span>
                                            </button>
                                            <button type="reset"
                                                    class="btn-style modify-cancel-btn no-name-modify-cancel-btn modify-cancel-btn4">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn"
                                                    style="display: inline-block">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="cate-list">
                            <c:choose>
                                <c:when test="${not empty baseCategory.cate_name5}">
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name5" id="cate-detail5"
                                               value="${allCategory.cate_name5}">
                                    </c:forEach>
                                    <input id="cate_name5" type="text" name="cate_name5"
                                           class="cate-name input-border"
                                           value="${baseCategory.cate_name5}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
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
                                            <button type="reset" class="btn-style modify-cancel-btn modify-cancel-btn5">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allCategory}" var="allCategory">
                                        <input type="hidden" name="cate_name5" id="cate-detail5"
                                               value="${allCategory.cate_name5}">
                                    </c:forEach>
                                    <input type="text" name="cate_name5" id="cate_name5"
                                           class="cate-name none-cate-name cate-input" placeholder="카테고리5"
                                           value="${baseCategory.cate_name5}"
                                           readonly>

                                    <div class="btn-wrap">
                                        <c:if test="${permit.master_per eq 0}">
                                            <button type="button" class="btn-style edit-btn" style="display: none">
                                                <i class="fas fa-pencil-alt"></i>
                                                <span>수정</span>
                                            </button>
                                            <button type="submit" class="btn-style del-btn del-btn5"
                                                    style="display: none">
                                                <i class="fas fa-trash-alt"></i>
                                                <span>삭제</span>
                                            </button>
                                            <button type="button" class="btn-style modify-btn">
                                                <i class="fas fa-check"></i>
                                                <span>완료</span>
                                            </button>
                                            <button type="reset"
                                                    class="btn-style modify-cancel-btn no-name-modify-cancel-btn modify-cancel-btn5">
                                                <i class="fas fa-check"></i>
                                                <span>취소</span>
                                            </button>
                                            <button type="button" class="btn-style add-btn"
                                                    style="display: inline-block">
                                                <i class="fas fa-plus"></i>
                                                <span>추가</span>
                                            </button>
                                        </c:if>
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

<script>
    const box_no = ${param.box_no};
</script>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


<%-- boxmenu JS--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=1"></script>

<%-- sweet alert --%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%-- baseCateogy JS--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/baseCategory.js?ver=3"></script>
</html>
