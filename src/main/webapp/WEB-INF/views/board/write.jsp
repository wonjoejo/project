<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Q&AWrite</title>

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
			<div id="top_content">
				<h1 class="title">Q&A</h1>
						
				<button id="listBtn" type="button">돌아가기</button>
			</div>
			
			
		<form action="/board/write" method="post">
	        <div class="write_wrapper">
	        	<div>
	        		<h3 class="write_title">글 쓰기</h3>   
	        	</div>
	        	<div>
	            	<input class="writeid" type="text" name="ref" value="${param.board_idx}"/>
	            </div> 
	        	<div>
	            	<input class="writeid" type="text" name="member_id" value="MEMBERid99"/>
	            </div> 
	        	
	        	<div>
	            	<input class="writetitle" type="text" name="title" placeholder="제목을 입력하세요 "/>
	            </div> 
	         	<div>
	                <textarea class="writecon" name="content" cols="10" rows="10" placeholder="내용을 입력하세요"></textarea>
	            </div>
	        	<div>         
	                <button class="writeBtn" type="submit">등록</button>
	            </div>         
	        </div>
     	 </form>

			
			
		</div>
	</div>
</div>

</body>
</html>
