<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Q&ABoardList</title>

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
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
    <script>
    $(function name() {
        console.clear();
        console.log('jquery started...');
        
        $('#writeBtn').on('click', function () {
            console.log('onclicked on writeBtn...');

            self.location = '/board/noticewrite?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
        });//onclick

        
        //페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리 
        $('a.prev, a.next').on('click',function(e){
            e.preventDefault();

            var paginationForm=$('#paginationForm')
            paginationForm.attr('action','/board/noticePage')
            paginationForm.attr('method','GET')

            //Criteria 3개 전송파라미터를 설정 
            paginationForm.find('input[name=currPage]').val($(this).attr('href'));
            paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
            paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

            paginationForm.submit();
        });  
        
        $('#noticelistBtn').click(function () {
            console.log('click event triggered..');

            self.location = '/board/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
          }); //onclick

      }); //.jq
    </script>
    
    <style>
    #noticelist	{
	    position: absolute;
	    width: 100%;
	    margin: 0 auto;
	   
	    background: #fff;
	    box-shadow: 0px 4px 40px rgb(0 0 0 / 10%);
	    border-radius: 40px;
	    overflow: hidden;
    }
    
  	.noticelistcontainer {
  		width: 98%;
  		margin: 0 auto;
  		padding-left: 40px;
  	}
  	
  	.noticeimg{
  		width: 18px;
  		height: 18px;
  		
  	}
  	
  	.searchimg {
		width: 20px;
		height: 20px;
	}
  	
 	#noticelistBtn {
	    position: absolute;
	    bottom: 150px;
	    right: 250px;
	    width: 90px;
	    height: 37px;
	    color: #5a95f5;
	    border: none;
	    margin-right: 30px;
	
	    background: #ffffff;
	    border: 1px solid #5a95f5;
  		border-radius: 24px;
	}
	
	#noticelistBtn:hover {
		color: #ffffff;	
		background: #5a95f5;	
	}
	
	.noticepage{
		position: absolute;
   		bottom: 120px;
	}
    </style>

</head>
<body>

<div class="container">
	
	<jsp:include page="../common/left.jsp"/>
	

	<div class="main-container">		
		<div class="wrapper">
		
			<div id="top_content">
				<h1 class="title">Q&A</h1>
				
				<input class="search" type="text" placeholder="&nbsp;&nbsp;Search everything"/>
				<button class="searchbtn"><img class="searchimg" src="${pageContext.request.contextPath}/resources/assets/img/search.png" />검색</button>
						
				<button id="writeBtn" type="button"> + 공지작성</button>
			</div>
			
			<div class="noticewrapper" >
				<h2 class="notice"><img class="noticeimg" src="${pageContext.request.contextPath}/resources/assets/img/warning.png" />&nbsp;&nbsp;공지사항</h2>
				
				<div id="boardtitlenone" class="boardlistcontainer noticelistcontainer">
					<div class="item">No</div>
					<div class="item">Title</div>
					<div class="item">written by</div>
					<div class="item">Register date</div> 	
				</div>
				
				<div id="noticelist">
					<c:forEach items="${noticeList}" var="board">
						<div class="noticelist">     
																
							<div class="item">
								<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}" />
							</div>   
							<div class="item">
								<c:out value="${board.member_id}" />
							</div>		
							<div class="item">
								<a href="/board/noticedetail?board_idx=${board.board_idx}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
								<c:out value="${board.title}" />
								</a>
							</div>	         
							<div class="item">
								<c:out value="${board.board_idx}" />
							</div>	
						</div>
			
						
					</c:forEach>
				</div>
			</div>
			
			
			
			<!-- 현재화면 하단부에 , 페이징 처리기준에 맞게 , 페이지번호목록 표시 -->
		      <div id="pagination">
		
		        <form action="#" id="paginationForm">
		          <input type="hidden" name="currPage">
		          <input type="hidden" name="amount">
		          <input type="hidden" name="pagesPerPage">
		
		          <ul class="pagination">
		            <!-- 1. 이전, 이동여부표시(prev) -->
		            <c:if test="${pageMaker.prev}">
		              <li class="prev"><a class="prev" href="${pageMaker.startPage - 1}">Prev</a></li>
		            </c:if>
		
		            <!-- 페이지번호목록 표시   -->
		            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
		              <li><a class="page noticepage" href="/board/noticePage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
		            </c:forEach>
		
		            <!-- 2. 이후, 이동여부표시(next) -->
		            <c:if test="${pageMaker.next}">
		              <li class="next"><a class="next" href="${pageMaker.endPage + 1}">Next</a></li>
		            </c:if>
		          </ul>
		
		        </form>
		
		      </div>
		      
		      <button id="noticelistBtn" type="button">돌아가기</button>
			
		</div>
	</div>
</div>

</body>
</html>
				