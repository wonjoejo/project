<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/box.css?ver=3">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/productDetail.css?ver=8">

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
                        <c:if test="${permit.edit_per eq 0}">
                            <!-- Edit -->
                            <li class="menu__list__item">
                                <a href="${pageContext.request.contextPath}/product/edit?product_no=${product.product_no}&box_no=${product.box_no}">
                                    <i class="fas fa-pencil-alt i-style"></i></a></li>
                        </c:if>
                        <c:if test="${permit.delete_per eq 0}">
                            <!-- Delete -->
                            <li class="menu__list__item">
                                <i class="fas fa-trash-alt i-style" id="delete-btn" onclick="deletesubmit()"></i></li>
                        </c:if>
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
							<img id="photo-upload"
								src="https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}" />
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



							<!-- <a href="javascript:sendLink()"> -->
								<div class="share">
									<div class="kakao-btn" onclick="javascript:sendLink()">
										<img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/kakao_icon.png" alt="카카오톡">
										공유하기
										<!-- 기업회원일 때만 QR 생성 / 기업회원(1), 개인회원(0) -->
									</div>
									<c:if test="${sessionScope.member_type >= 0.1}">
										<div class="qr-btn"> 
												<img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/QR_icon.png" alt="QR코드"> 
												QR코드
										</div>
									</c:if>
								</div>
							<!-- </a> -->




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
                                    <c:set var="mentions" value="${fn:split(product.product_memo,' ')}"/>
                                    <c:forEach var="id" items="${mentions}" begin="0" end="${fn:length(mentions)}">
                                        <c:choose>
                                            <c:when test="${fn:startsWith(id,'@')}">
                                                <span class="mention" id="${id}">
                                                        ${id}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text">
                                                    &nbsp;${id}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    ${product.product_memo}
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${fn:length(product.product_memo) >= 15}">
                            <span class="more">
                                    <a href="#" id="more">더보기</a>
                                </span>
                            </c:if>
						</div> <!-- detail-memo -->
					</li>
				</ul>
			</div> <!-- right-box -->
			</div> <!-- product-detail-wrap -->

            <%-- 댓글 --%>
            <div class="comment-wrap">
                <div id="search">
                    <c:choose>
                        <c:when test="${permit.write_per eq 0}">
                            <input type="hidden" id="memberId" name="member_id" value="${sessionScope.member_id}">
                            <input name="comment_content" id="commentContent" class="search" type="text"
                                   placeholder="댓글을 입력해주세요. @으로 그룹원 태그가 가능합니다. "/>
                            <ul class="suggestions">
                            </ul>
                            <button id="insertBtn" class="searchbtn">
                                <i class="fas fa-pencil-alt"></i>
                                Write
                            </button>
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" id="memberId" name="member_id" value="${sessionScope.member_id}">
                            <input name="comment_content" id="commentContent" class="search" type="text"
                                   placeholder="쓰기 권한이 있는 멤버만 댓글 쓰기가 가능합니다." readonly/>
                            <ul class="suggestions">
                            </ul>
                            <button id="insertBtn" class="searchbtn" disabled>
                                <i class="fas fa-pencil-alt"></i>
                                Write
                            </button>
                        </c:otherwise>
                    </c:choose>

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
	const barcode = '${product.barcode}';
</script>

<%-- product JS --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/product.js?ver=2"></script>
<%-- mention JS 실험 중 --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/productDetail.js"></script>

</html>
