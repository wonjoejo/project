<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<title>ProductList</title>

<!-- favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- font awesome -->
<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

<!-- stylesheets -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/product.css?ver=22">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=1">

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

<script>
	$(function name() {
		console.clear();
		console.log('jquery started...');

		// 등록 버튼을 마우스로 클릭하면, 이벤트 핸들러가 발생한다
		$('#regBtn').on('click', function () {
			console.log('onclicked on regBtn...');

			self.location = '/product/register?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
		});

		//페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리 
		$('a.prev, a.next').on('click', function (e) {
			e.preventDefault();

			var paginationForm = $('#paginationForm')
			paginationForm.attr('action', '/product/listPerPage')
			paginationForm.attr('method', 'GET')

			//Criteria 3개 전송파라미터를 설정 
			paginationForm.find('input[name=currPage]').val($(this).attr('href'));
			paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
			paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

			paginationForm.submit();
		});

	}); //.jq

</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/boxleft.jsp" />
		<div class="main-container">
			<div id="top-content">
				<h1 class="title">ProductList</h1>
			</div> <!-- top_content -->

			<div class="product-main-container">
				<div id="top-search">
					<input class="search" type="text" placeholder="&nbsp;&nbsp;Search everything" />
					<button class="searchbtn">
					<img class="searchimg" 
						src="${pageContext.request.contextPath}/resources/assets/img/search.png" />검색</button>
				</div> <!-- top-search -->


				<div class="product-container">
					<c:forEach items="${list}" var="product"><br />
						<div class="product-list-container" id="product-list">
							<div class="item" id="product-img">
								<img id="product-img"
									src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true">
							</div> <!-- product-img -->

							<div class="item" id="product-name">
								<c:out value='물품번호: ${product.product_no}' />
								<!-- <c:out value='물품명: ${product.product_name}' /> -->
								<!-- <c:out value='박스번호: ${product.box_no}' /> -->
							</div> <!-- product-name -->

							<div class="item" id="product-cate">
								<div class="product-cate-1"><c:out value='${product.cate_name1} │ ${product.cate_detail1}' /></div>
								<div class="product-cate-2"><c:out value='${product.cate_name2} │ ${product.cate_detail2}' /></div>
								<div class="product-cate-3"><c:out value='${product.cate_name3} │ ${product.cate_detail3}' /></div>
							</div> <!-- product-cate -->

							<div class="item" id="product-qtn">
								<c:out value='수량: ${product.product_qtn}' />
							</div> <!-- product-qtn-->

						</div>	<!-- product-list -->
					</c:forEach>
				</div> <!-- product-container -->


				<!-- 페이징 처리 -->
				<div id="pagination">
					<form action="#" id="paginationForm">
						<input type="hidden" name="currPage">
						<input type="hidden" name="amount">
						<input type="hidden" name="pagesPerPage">
						<input type="hidden" name="box_no">

						<!-- 1. 이전 이동 여부 표시 (prev) -->
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link" 
									href="/product/listPerPage?
											currPage=${pageMaker.startPage-1}
											&amount=${pageMaker.cri.amount}
											&pagesPerPage=${cri.pagesPerPage}
											&box_no=${pageMaker.cri.box_no}">
									<i class="fas fa-angle-left"></i></a></li>
							</c:if>

							<!-- 페이지 번호 목록 표시 -->
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
								<c:set var="cp" value="${pageMaker.cri.currPage}" />

								<c:choose>
									<c:when test="${pageNum == cp}">
										<li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page" 
											href="/product/listPerPage?
												currPage=${pageNum}
												&amount=${pageMaker.cri.amount}
												&pagesPerPage=${pageMaker.cri.pagesPerPage}
												&box_no=${pageMaker.cri.box_no}">${pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- 2. 다음 이동 여부 표시 (next) -->
							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link" 
									href="/product/listPerPage?
										currPage=${pageMaker.endPage+1}
										&amount=${pageMaker.cri.amount}
										&pagesPerPage=${pageMaker.cri.pagesPerPage}
										&box_no=${pageMaker.cri.box_no}">
										<i class="fas fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</form>
				</div> <!-- page -->

			</div> <!-- product-main-container -->
		</div> <!-- main-container -->
	</div> <!-- container -->

</body>
</html>