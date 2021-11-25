<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/productDetail.css?ver=3">

</head>
<body>
<c:set var="box_no" value="${product.box_no}"/>


<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <input type="hidden" id="productNo" name="product_no" value="${product.product_no}">
    <input type="hidden" name="box_no" value="${product.box_no}">
    <div class="main-container">
        <div class="top-content">
            <h1>물품 상세보기</h1>

            <div class="wrapper">
                <div class="hamburger">
                    <ul class="menu__list">
                        <!-- Edit -->
                        <li class="menu__list__item">
                            <a href="${pageContext.request.contextPath}/product/edit?product_no=${product.product_no}&box_no=${product.box_no}">
                            <i class="fas fa-pencil-alt i-style"></i></a></li>
                        <!-- Delete -->
                        <li class="menu__list__item">
                            <i class="fas fa-trash-alt i-style" id="delete-btn" onclick="deletesubmit()"></i></li>
                        <!-- List -->
                        <li class="menu__list__item">
                            <a href="${pageContext.request.contextPath}/product/listPerPage?box_no=${box_no}">
                                <i class="far fa-list-alt i-style"></i></a></li>
                    </ul>
                </div> <!-- hamburger -->
                
                <div class="button" id="nav-icon4">
                    <span class="button__line"></span>
                    <span class="button__line"></span>
                    <span class="button__line"></span>
                </div> <!-- button -->
            </div> <!-- wrapper -->
        </div> <!-- top-content -->

        <div class="scroll type2">

            <div class="product-detail-wrap">
                <div class="left-box">
                    <div class="photo">
                        <!-- product_photo의 이름과 경로가 모두 null이 아닐 때 -->
                        <c:if test="${not empty product.product_photo_name && not empty product.product_photo_path}">

                            <img id="photo-upload" src="https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}"/>

                        </c:if> <!-- product-img -->

                        <!-- product_photo의 이름과 경로 중 하나라도 null일때 -->
                        <c:if test="${empty product.product_photo_name || empty product.product_photo_path}">
                            <div class="item" id="photo-none-img"> </div>
                        </c:if> <!-- product-none-img -->
                </div> <!-- photo -->

                <div class="qtn">
                    <span>수량
                        <div class="bar"></div>
                        ${product.product_qtn}
                    </span>
                </div> <!-- qtn -->

                <a href="javascript:sendLink()">
                    <div class="share">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/kakao_icon.png" alt="카카오톡">
                        공유하기
                    </div>
                </a>
            </div> <!-- left-box -->

            <div class="right-box">
                <ul>
                        <li>
                            <div class="title">이름</div>
                            <div class="detail">${product.product_name}</div>
                        </li>
                        <c:if test="${not empty baseCategory.cate_name1}">
                            <li>
                                <div class="title">${baseCategory.cate_name1}</div>
                                <c:choose>
                                    <c:when test="${not empty category.cate_detail1}">
                                        <div class="detail">${category.cate_detail1}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail">-</div>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name2}">
                            <li>
                                <div class="title">${baseCategory.cate_name2}</div>
                                <c:choose>
                                    <c:when test="${not empty category.cate_detail2}">
                                        <div class="detail">${category.cate_detail2}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail">-</div>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name3}">
                            <li>
                                <div class="title">${baseCategory.cate_name3}</div>
                                <c:choose>
                                    <c:when test="${not empty category.cate_detail3}">
                                        <div class="detail">${category.cate_detail3}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail">-</div>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name4}">
                            <li>
                                <div class="title">${baseCategory.cate_name4}</div>
                                <c:choose>
                                    <c:when test="${not empty category.cate_detail4}">
                                        <div class="detail">${category.cate_detail4}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail">-</div>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                        <c:if test="${not empty baseCategory.cate_name5}">
                            <li>
                                <div class="title">${baseCategory.cate_name5}</div>
                                <c:choose>
                                    <c:when test="${not empty category.cate_detail5}">
                                        <div class="detail">${category.cate_detail5}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail">-</div>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                    <li>
                        <div class="title">메모</div>
                        <div class="detail" id="detail-memo">
                            <c:set var="memo" value="${product.product_memo}"/>
                            <c:choose>
                                <c:when test="${fn:contains(memo,'@')}">
                                    <c:set var="mentions" value="${fn:split(product.product_memo,'@')}"/>
                                    <c:forEach var="id" items="${mentions}" begin="0" end="${fn:length(mentions)}">
                                        <span class="mention" id="${id}">
                                                @${id}
                                        </span>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    ${product.product_memo}
                                </c:otherwise>
                            </c:choose>
                            <span class="more">
                                    <a href="#" id="more">더보기</a>
                                </span>
                        </div>
                    </li>
                </ul>
            </div>
            </div>

            <%-- 댓글 --%>
            <div class="comment-wrap">
                <div id="search">
                    <input type="hidden" id="memberId" name="member_id" value="${sessionScope.member_id}">
                    <input name="comment_content" id="commentContent" class="search" type="text"
                           placeholder="댓글을 입력해주세요. @으로 그룹원 태그가 가능합니다. "/>
                    <button id="insertBtn" class="searchbtn">
                        <i class="fas fa-pencil-alt"></i>
                        Write
                    </button>
                </div><!-- search -->
                <div id="comment-box">

                </div> <!-- comment-box -->

            </div><!-- comment-wrap -->
        </div><!-- scroll -->
    </div> <!-- main-container -->

</div> <!-- container -->

</body>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


<%-- detail JS --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/boxmenu.js?ver=2"></script>
<%-- sweet alert --%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%-- kakao sdk --%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>

	const product_memo = '${product.product_memo}';
	const product_no = '${product.product_no}';
	const box_no = '${product.box_no}';
	const box_link = '/product/listPerPage?box_no=${product.box_no}';
	const product_name = '${product.product_name}';
	const cate_detail1 = '${category.cate_detail1}';
	const cate_detail2 = '${category.cate_detail2}';
	const cate_detail3 = '${category.cate_detail3}';
	const cate_detail4 = '${category.cate_detail4}';
	const cate_detail5 = '${category.cate_detail5}';
	const product_photo_name = '${product.product_photo_name}'
	const product_photo_path = '${product.product_photo_path}';
	const member_id = '${sessionScope.member_id}';


	// 댓글 리스트
	getCommentList();

	function getCommentList() {

		$.ajax({
			url: "/comment/list",
			type: "GET",
            data: {
                product_no: ${product.product_no}
            },
            dataType: 'json',
            success: function (data) {
                let comments = "";
                if (data.length < 1) {
                    comments = '<div class = "no-comment">등록된 댓글이 없습니다.</div>';
                } else {
                    $(data).each(function () {
                        comments += '<div class="comment">';
                        comments += '<input type="hidden" class="comment-no" name="comment_no" value="';
                        comments += this.comment_no;
                        comments += '">';
                        comments += '<input type="text" class = "member-id list" name="member_id" value="';
                        comments += this.member_id;
                        comments += '" disabled>';
                        comments += '<textarea type ="text" class = "comment-content list" name="member_id" rows="3" disabled>';
                        comments += this.comment_content;
                        comments += '</textarea>';
                        comments += '<div class="reg-date">';
                        comments += this.reg_date;
                        comments += '</div>';
                        comments += '<div class = "comment-button">';
                        comments += '<a href = "#" id="comment-modify" class = "comment-modify"><i class="fas fa-pencil-alt"></i></a>';
                        comments += '<a href = "#" id="comment-delete" class = "comment-delete"><i class="fas fa-trash-alt"></i></a>';
                        comments += '<a href = "#" id="comment-modify" class = "comment-modify-complete"><i class="fas fa-check"></i></a>';
                        comments += '<a href = "#" id="comment-delete" class = "comment-modify-cancel"><i class="fas fa-times"></i></a>';
                        comments += '</div>';
                        comments += '</div>';
                    });
                }; // if-else

                $("#comment-box").html(comments);



                // 수정 버튼 클릭 시 수정 폼 변경
                const modifyBtn = document.querySelectorAll('.comment-modify');
                modifyBtn.forEach(function (item){
                    item.addEventListener("click", function (e){
                        e.preventDefault();
                        console.log(item.parentElement.previousElementSibling.previousElementSibling);

                        const checkBtn = item.nextElementSibling.nextElementSibling;
                        const cancelBtn = item.nextElementSibling.nextElementSibling.nextElementSibling;
                        const commentNo = item.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling;
                        const memberId = item.parentElement.previousElementSibling.previousElementSibling.previousElementSibling;
                        const commmentContent = item.parentElement.previousElementSibling.previousElementSibling;

                        commmentContent.disabled = false;
                        commmentContent.style.border = "1px solid #ADADAD";
                        item.style.display = "none";
                        item.nextElementSibling.style.display = "none";
                        checkBtn.style.display = "inline";
                        cancelBtn.style.display = "inline";

                        // 취소 버튼
                        cancelBtn.addEventListener("click", getCommentList);

                        // 수정
                        checkBtn.addEventListener("click", function (e){
                            e.preventDefault();

                            const data = {
                                comment_no: commentNo.value,
                                member_id: memberId.value,
                                product_no: ${product.product_no},
                                comment_content: commmentContent.value
                            };

                            console.log(data);

                            fetch('/comment/edit',{
                                method: 'POST',
                                body:JSON.stringify(data),
                                headers: {
                                    'Content-Type': 'application/json'
                                }
                            })
                                .then(function (response){
                                    if(response) getCommentList();
                                })

                                .catch(function (error){
                                    console.log(error)
                                }); // fetch

                        }); // click
                    }); // click
                }); // modifyBtn forEach

                // 삭제
                const deleteBtn = document.querySelectorAll('.comment-delete');
                deleteBtn.forEach(function (item){
                   item.addEventListener("click", function (e){
                       e.preventDefault();

                       const commentNo = item.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling;

                       const data = {
                           comment_no: commentNo.value
                       };

                       console.log(data);

                       fetch('/comment/delete',{
                           method: 'POST',
                           body:JSON.stringify(data),
                           headers: {
                               'Content-Type': 'application/json'
                           }
                       })
                           .then(function (response){
                               if(response) getCommentList();
                           })

                           .catch(function (error){
                               console.log(error)
                           }); // fetch

                   }); // click
                }); // delete forEach


            } // success

        }); // ajax

    }; // getCommentList


    // 댓글 등록

    document.querySelector('#insertBtn').addEventListener("click", insertComment);

    function insertComment() {

        const data = {
            member_id: document.querySelector('#memberId').value,
            product_no: document.querySelector('#productNo').value,
            comment_content: document.querySelector('#commentContent').value
        };

        console.log(data);

        fetch('/comment/insert', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(function (response) {
                if (response) {
                    getCommentList();
                    document.querySelector('#commentContent').value = "";
                }
            })
            .catch(function (error) {
	            console.log(error);
            }); // fetch

    }; // insertComment


</script>

<%-- product JS --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/product.js?ver=6"></script>

<%-- mention JS 실험 중 --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/mention.js?ver=7"></script>

</html>
