<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Q&ADetail</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

	<!-- stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css">
	
	<script type="text/javascript" src=""${pageContext.request.contextPath}/resources/assets/js/board.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
      $(function () {
        console.clear();
        console.log('JQuery stared...');
        
       //delete 버튼에 대한 이벤트 등록 처리
        $('#deleteBtn').click(function () {
          console.log('click event triggered..');

          var formObj = $('form');
          formObj.attr('method', 'POST');
          formObj.attr('action', '/board/delete');

          formObj.submit();
        }); //onclick
        
       //edit 버튼에 대한 이벤트 등록 처리
        $('#editBtn').click(function () {
          console.log('click event triggered..');

          self.location = '/board/edit?board_idx=${board.board_idx}';
        }); //onclick

        //list 버튼에 대한 이벤트 등록 처리
        //$(#listBtn).on('click',function(){
        $('#listBtn').click(function () {
          console.log('click event triggered..');

          self.location = '/board/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
        }); //onclick
      }); //.jq
    </script>
	
</head>
<body>

<div class="container">
	<jsp:include page="../common/left.jsp"/>

	<div class="main-container">		
		<div class="wrapper">
			<div id="detailtop">
			
				<h1 class="title">Q&A</h1>						
				<button id="listBtn" type="button">돌아가기</button>
			
			</div>
			
			<div id="detailcontent" >
				<form action="/board/edit" method="post">
					<input type="hidden" name="board_idx" value="${board.board_idx}" />
			
					<div class="detailwrapper">
						<div class="detailtitle">
							<input class="noline" type="text" name="title" value="${board.title}" readonly />
						</div>
						
						<div class="detailid">
							<input class="noline" type="text" name="member_id" value="${board.member_id}" readonly />
						</div>
						
						<div class="detaildate">
							<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}" />
						</div>            
						
						<div class="detailcontent">
							<textarea class="noline detailcon" name="content" cols="50" rows="10" readonly>${board.content}</textarea>
						</div>
					</div>
				
					<div>
						<button type="button" id="editBtn">수정</button>
		                <button type="button" id="deleteBtn">삭제</button>
					</div>	
				</form>		
			</div>
			
		
			
			
		</div>
	</div>
</div>

</body>
</html>
