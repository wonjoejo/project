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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/product.css?ver=1">

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
			<h1>ProductList</h1>

			<input class="search" type="text" placeholder="&nbsp;&nbsp;Search everything" />
			<button class="searchbtn">검색</button>


			
			<!-- 현재화면 하단부에 , 페이징 처리기준에 맞게 , 페이지번호목록 표시 -->
			<div id="pagination">
				<form action="#" id="paginationForm">
					<input type="hidden" name="currPage">
					<input type="hidden" name="amount">
					<input type="hidden" name="pagesPerPage">
					<input type="hidden" name="box_no">

					<ul class="pagination">
						<!-- 1. 이전, 이동여부표시(prev) -->
						<c:if test="${pageMaker.prev}">
							<li class="prev"><a class="prev" href="${pageMaker.startPage - 1}">Prev</a></li>
						</c:if>

						<!-- 페이지번호목록 표시   -->
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
							<li><a class="page" href="/product/listPerPage?
									currPage=${pageNum}
									&amount=${pageMaker.cri.amount}
									&pagesPerPage=${pageMaker.cri.pagesPerPage}
									&box_no=${pageMaker.cri.box_no}">${pageNum}</a>
							</li> &nbsp&nbsp
						</c:forEach>

						<!-- 2. 이후, 이동여부표시(next) -->
						<c:if test="${pageMaker.next}">
							<li class="next"><a class="next" href="${pageMaker.endPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</form>
			</div> <!-- pagination -->




			${list}
			<div class="product-container">
				<div id="product-list">
					<c:forEach items="${list}" var="product"><br />
						<img id="product_img"
							src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true"
							style="width: 50px;">
						<c:out value='물품번호: ${product.product_no}' />
						<c:out value='물품명: ${product.product_name}' />
						<c:out value='박스번호: ${product.box_no}' />
						<c:out value='수량: ${product.product_qtn}' />
<%--						<c:out value='카테고리1: ${product.cate_name1} : ${product.cate_detail1}' />--%>
<%--						<c:out value='카테고리2: ${product.cate_name2} : ${product.cate_detail2}' />--%>
<%--						<c:out value='카테고리3: ${product.cate_name3} : ${product.cate_detail3}' />--%>


						<br />
					</c:forEach><br />
				</div><br />
			</div> <!-- product-container -->



		</div> <!-- main-container -->
	</div> <!-- container -->

</body>
</html>
