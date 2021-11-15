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
        
        /* 답글 버튼 AJAX 용 
        $('#replyBtn').click(function(){
        	if($("#replyform").css("display") == "none"){
        		$("#replyform").show();	    		
        	}	
        	$("#replyBtn").hide();
        	$("#replycloseBtn").show();
        	
        });
        
        $('#replycloseBtn').click(function(){
        	if($("#replyform").css("display") != "none"){
        		$("#replyform").hide();	
        	}
        	$("#replyBtn").show();
        	$("#replycloseBtn").hide();
        	
        }); */
        
     	// 답글 작성 
        $('#replyWriteBtn').on('click', function () {
            console.log('onclicked on writeBtn...');

            self.location = '/board/replywrite?board_idx=${board.board_idx}&title=${board.title}';
        });//onclick
        
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
    
    <style>
        
    #replyform {      
    	display: none;
    }
    
    #replycloseBtn {      
    	display: none;
    	width: 60px; height: 35px;
    	background: linear-gradient(90deg, #4776e6 0%, #8e54e9 100%);
    	color: #ffffff;
    	border: none;
    	box-shadow: inset 0px 5px 10px rgb(149 149 149 / 20%);
    	border-radius: 24px;
    	margin: 10px;
    	
    }
    
    .replyimg{
    	width: 25px; height: 25px;
    }
       
    .reply_wrapper {
    	width: 60%;
    	margin-left: 80px;
    }
    
    .replytitle {
    	border: none;
    	font-size: 14px;  	
    	margin-left: 5px;  	
    	margin-top: 5px;  	
    }
    
    .replyid {
    	border: none;
    	font-size: 14px;
    	margin-left: 5px;  	
    	
    }
    
    .replycon {
    	width: 100%;
    	height: 100px;
    	margin: 5px;
    }
    
    .replyBtn {
    	width: 60px; height: 35px;
    	background: linear-gradient(90deg, #4776e6 0%, #8e54e9 100%);
    	color: #ffffff;
    	border: none;
    	box-shadow: inset 0px 5px 10px rgb(149 149 149 / 20%);
    	border-radius: 24px;
    	margin-top: 10px;
    }
    
    #replyWriteBtn {
		float: left;
		width: 90px;
		height: 37px;
		color: #ffffff;
		border: none;
		
		background: linear-gradient(90deg, #4776e6 0%, #8e54e9 100%);
		box-shadow: inset 0px 5px 10px rgba(149, 149, 149, 0.2);
		border-radius: 24px;
		
		margin-top: 20px;
		margin-left: 75px;
	}
	
	.writetitle{
   		background-image : url("${pageContext.request.contextPath}/resources/assets/img/reply.png"); 
   		background-position:top left;
		background-repeat:no-repeat;
		background-size: 40px;
   	}
    
    
    </style>
	
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
							<input class="noline writetitle" type="text" name="title" value="${board.title}" readonly />
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
						<c:if test="${board.depth == 0}">
							<button id="replyWriteBtn" type="button">답글작성</button>
						</c:if>
						<button type="button" id="editBtn">수정</button>
		                <button type="button" id="deleteBtn">삭제</button>
					</div>	
				</form>	
				
				<!-- 답글 입력 form  -->
				<%--<button id="replyBtn" type="button">답글</button>
	
				 <div id="replyform" >
					<div>
				        <div class="reply_wrapper">
				        	<fieldset class="form">
					        	<div>
					        		<img class="replyimg" src="${pageContext.request.contextPath}/resources/assets/img/reply.png">
					            	<input class="replytitle" type="text" name="title" value="${board.title}" readonly />
					            </div> 				        
					        	<div>
					            	<input id="replywriter" class="replyid" type="text" name="member_id" value="MEMBERid99"  />
					            </div>   	
					         	<div>
					                <textarea id="replytext" class="replycon" name="content" cols="10" rows="10" placeholder="내용을 입력하세요"></textarea>
					            </div>
				           
					        	<div>         
					               <!--  <button id="newreplyBtn" class="replyBtn" >등록</button> -->
					                <input type="button" name="create" id="newreplyBtn" class="replyBtn" value="등록" onclick="insertReply();">
					                <button id="replycloseBtn" type="button">닫기</button>
					            </div> 
			 				</fieldset>	                    
				        </div>
			     	 </div>	
				</div>		 --%> 
				
				<!-- 답글 ajax insert -->
				<!-- <script>
				function insertReply() {
		            var param_data = {"content":$("textarea[name='content']").val() , "board_idx":"${board_idx}"};
		            $.ajax({
		                url:"/board/replywrite",
		                method:"POST",
		                data:param_data,
		                success: function (result) {
		                    if (result == "ok") {
		                    
		                    window.alert("등록되었습니다.");
		                    }
		                },
		                error:function(request,status,error){
		                    console.log(error);
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                }
		            });
		        }
				</script> -->
				
			</div>		
		</div>
	</div>
</div>

</body>
</html>