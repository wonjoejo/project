<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>Admin Page</title>

    <!-- favicon -->
    <link
      rel="shortcut icon"
      href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
      sizes="16x16"
    />
    <link
      rel="icon"
      href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
      sizes="16x16"
    />

    <!-- bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />

    <!-- font awesome -->
    <script
      src="https://kit.fontawesome.com/a959489452.js"
      crossorigin="anonymous"
    ></script>

    <!-- stylesheets -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/admin.css?ver=7"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/pagination.css?ver=5"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/accountModal.css?ver=3"
    />
   
  <body>
    <div class="container">
      <jsp:include page="../common/adminleft.jsp" />
      <div class="main-container">
        <h1>회원 관리</h1>

        <div class="admin-container">
          
          
          
          <form id="searchForm" name="searchForm" action="/admin/searchList0" method='get'>
          <!-- 회원 유형 -->
          <div class="top-right">
          <select class="mode-select" name="member_type" onChange="typeselect()">
            <option selected disabled>회원 유형</option>
            <option value="1">개인 회원</option>
            <option value="2">기업 회원</option>
          </select>
          
          <!-- 검색창 -->
            <input onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="search" type='text' name='keyword' placeholder="아이디 혹은 이름으로 검색" value='<c:out value="${pageMaker.mcri.keyword}"/>'/>
            
            <input type='hidden' name='currPage' value='${pageMaker.mcri.currPage}'>
            <input type='hidden' name='amount' value='${pageMaker.mcri.amount}'>
            <input type='hidden' name='pagesPerPage' value='${pageMaker.mcri.pagesPerPage}'>
            <button class="searchbtn"><i class="fas fa-search"></i>검색</button>
          </form>
          </div>

          <!-- 회원 테이블 -->
          <div class="member-table">
            <div id="tablehead" class="tablecontainer">
              <div id="timg" class="item">회원</div>
              <div id="tid" class="item">아이디</div>
              <div id="tname" class="item">이름</div>
              <div id="tmail" class="item">이메일</div>
              <button class="detailbtn" style="visibility: hidden;">상세</button>
            </div>

            <!-- 리스트 -->
            <div class="memberlist">
                <c:forEach items="${searchList}" var="member">
                
                  <div class="tablecontainer">     
                    <div class="item">
                      <div id="tprofile">
                        <c:choose>
                          <c:when test="${not empty member.photo_name}">
                            <img src="<c:out value="https://intobox.s3.ap-northeast-2.amazonaws.com/${member.photo_path}${member.photo_name}"/>" width="60" height="60" style="border-radius: 7px">
                          </c:when>
                          <c:otherwise>
                            <img src="<c:out value="https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png"/>" width="60" height="60">    
                          </c:otherwise>
                        </c:choose>
                      </div> 
                    </div>	
                    	
                    <div class="item">
                      <c:out value="${member.member_id}" /> 
                    </div>		

                    <div class="item">
                      <c:out value="${member.name}" /> 
                    </div>
                    
                    <div class="item">
                      <c:out value="${member.email}" /> 
                    </div>
                    
                    <div class="item">
                      <!-- <button type="button" class="detailbtn" data-bs-toggle="modal" data-bs-target="#memberModal">상세</button> -->
                       <button type="button" id="detailmodal" class="detailbtn">상세</button>
                    </div> 

                  </div>
                </c:forEach>
              		
            </div>

          </div>

          <!-- 페이징 처리 -->
          <div id="pagination">

            <form action="#" id="paginationForm">
              <!-- 1. 이전 이동 여부 표시 (prev) -->
              <ul class="pagination">
                <c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="/admin/searchList0?keyword=${pageMaker.mcri.keyword}&currPage=${pageMaker.startPage-1}&amount=${pageMaker.mcri.amount}&pagesPerPage=${mcri.pagesPerPage}"><i class="fas fa-angle-left"></i></a></li>
				</c:if>

                <!-- 페이지 번호 목록 표시 -->
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                  <c:set var="cp" value="${pageMaker.mcri.currPage}" />

                  <c:choose>
                    <c:when test="${pageNum == cp}">
                      <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a class="page-link" href="/admin/searchList0?keyword=${pageMaker.mcri.keyword}&currPage=${pageNum}&amount=${pageMaker.mcri.amount}&pagesPerPage=${pageMaker.mcri.pagesPerPage}">${pageNum}</a></li>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>

                <!-- 2. 다음 이동 여부 표시 (next) -->
                <c:if test="${pageMaker.next}">
                  <li class="page-item"><a class="page-link" href="/admin/searchList0?keyword=${pageMaker.mcri.keyword}&currPage=${pageMaker.endPage+1}&amount=${pageMaker.mcri.amount}&pagesPerPage=${pageMaker.mcri.pagesPerPage}"><i class="fas fa-angle-right"></i></a></li>
                </c:if>
              </ul>
            </form>
          </div>
      </div>  
    </div>

    
  </body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
  <script
    type="application/javascript"
    src="${pageContext.request.contextPath}/resources/assets/js/admin.js?ver=1"
  ></script>
  <script
    type="application/javascript"
    src="${pageContext.request.contextPath}/resources/assets/js/modal.js?ver=3"
  ></script>

  <script>
    function typeselect(){
    const i=document.searchForm.member_type.selectedIndex // 선택항목의 인덱스 번호
    const type=document.searchForm.member_type.options[i].value // 선택항목 value
    
    console.log(i);
    console.log(type);
    
    if(type=="1") {
     document.searchForm.action="/admin/searchList0";
     console.log("개인회원");
    } else {
      document.searchForm.action="/admin/searchList1";
      console.log("기업회원");
    }
  }
    </script>
</html>
