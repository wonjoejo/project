<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
  <head>
    <title>MyPage</title>

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
      href="${pageContext.request.contextPath}/resources/assets/css/myPage.css?ver=10"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/accountModal.css?ver=4"
    />
  </head>
  <body>
    <div class="container">
      <jsp:include page="../common/myleft.jsp" />
      <div class="main-container">
        <h1>마이 페이지</h1>

        <div class="page-wrapper">
          <form
            id="myPageForm"
            action="/member/edit"
            method="POST"
            enctype="multipart/form-data"
          >
            <!-- left -->
            <div class="my-wrapper1">
              <h2 class="fs-title" style="margin-top: -5px">프로필 이미지</h2>

              <c:choose>
		      <c:when test="${fn:contains(photo_name, 'kakao')}">
		          <div
                    id="profile-upload"
                    style="
                      background-image: url('${member.photo_name}');
                    "
                  >
                    <input
                      type="file"
                      name="file"
                      id="profile-photo"
                      class="upload"
                    />
                    <input
                      type="hidden"
                      name="photo_name"
                      id="default"
                      value="${member.photo_name}"
                    />
                    <input
                      type="hidden"
                      name="photo_path"
                      value="${member.photo_path}"
                    />
                  </div>
		      	</c:when>
		      
                <c:when test="${not empty photo_path}">
                  <div
                    id="profile-upload"
                    style="
                      background-image: url('https://intobox.s3.ap-northeast-2.amazonaws.com/${member.photo_path}${member.photo_name}');
                    "
                  >
                    <input
                      type="file"
                      name="file"
                      id="profile-photo"
                      class="upload"
                    />
                    <input
                      type="hidden"
                      name="photo_name"
                      id="default"
                      value="${member.photo_name}"
                    />
                    <input
                      type="hidden"
                      name="photo_path"
                      value="${member.photo_path}"
                    />
                  </div>
                </c:when>
                <c:otherwise>
                  <div
                    id="profile-upload"
                    style="
                      background-image: url('https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png');
                    "
                  >
                    <input
                      type="file"
                      name="file"
                      id="profile-photo"
                      class="upload"
                    />
                    <input
                      type="hidden"
                      name="photo_name"
                      id="default"
                      value="${member.photo_name}"
                    />
                    <input
                      type="hidden"
                      name="photo_path"
                      value="${member.photo_path}"
                    />
                  </div>
                </c:otherwise>
              </c:choose>

              <div class="member-type">
                <c:choose>
                  <c:when test="${member.member_type==0}">
                    <button
                      type="button"
                      class="member-type__link personal"
                      name="personal"
                    >
                      <i class="far fa-user"></i>
                      <div class="type">
                        <span class="type-title">개인회원</span>
                      </div>
                    </button>
                  </c:when>
                  <c:otherwise>
                    <button
                      type="button"
                      class="member-type__link company"
                      name="company"
                    >
                      <i class="far fa-building"></i>
                      <div class="type">
                        <span class="type-title">기업회원</span>
                      </div>
                    </button>
                  </c:otherwise>
                </c:choose>
              </div>
              
              <c:choose>
      		  <c:when test="${fn:contains(photo_name, 'kakao')}">
              <div class="group">
              	<button
                      type="button"
                      class="kakao">
                   카카오 회원입니다.
                 </button>
              </div>
              </c:when>
              </c:choose>

              <!-- 멤버 타입 숨기기 -->
              <div class="member_input" style="visibility: hidden; height: 1%">
                <label for="member_type" class="label"> 멤버타입 </label
                ><input
                  id="member_type"
                  name="member_type"
                  value="${member.member_type}"
                />
              </div>

              <c:if test="${member.member_type == 1}">
                <!-- 기업회원일 때 -->
                <div class="group">
                  <label for="company_name" class="label" id="company_name">
                    기업명
                  </label>
                  <input
                    id="company_name"
                    class="input"
                    type="text"
                    name="company_name"
                    value="${member.company_name}"
                  />
                </div>
              </c:if>
              
			  <c:choose>
      		  <c:when test="${not fn:contains(photo_name, 'kakao')}">
              <div class="group">
                <label for="member_id" class="label"> 아이디 </label>
                <input
                  id="member_id"
                  class="input"
                  type="text"
                  name="member_id"
                  value="${member.member_id}"
                  readonly
                />
              </div>
              </c:when>
              </c:choose>
            </div>

            <!-- right -->
            <div class="my-wrapper2">
              <c:choose>
      		  <c:when test="${fn:contains(photo_name, 'kakao')}">
              <div class="group">
                <label for="member_id" class="label"> 아이디 </label>
                <input
                  id="member_id"
                  class="input"
                  type="text"
                  name="member_id"
                  value="${member.member_id}"
                  readonly
                />
              </div>
			  </c:when>
			  <c:otherwise>
			  <div class="group" id="pw">
                <label for="pwd" class="label"> 패스워드 </label>
                <input
                  id="pwd"
                  class="input"
                  type="password"
                  name="password"
                  value="${member.password}"
                />
                <i id="pwd1" class="fas fa-eye active"></i>
			  </div>
			  </c:otherwise>
			  </c:choose>
              <div class="group">
                <label for="name" class="label"> 이름 </label
                ><input
                  id="name"
                  class="input"
                  type="text"
                  name="name"
                  value="${member.name}"
                />
              </div>

              <div class="group">
                <label for="email" class="label"> 이메일 </label>
                <input
                  id="email"
                  class="input"
                  type="text"
                  name="email"
                  value="${member.email}"
                />
              </div>
				
			  <c:choose>
      		  <c:when test="${fn:contains(photo_name, 'kakao')}">
              
			  </c:when>
			  <c:otherwise>
              <div class="group">
                <label for="phone_number" class="label"> 휴대전화 </label>
                <input
                  id="phone_number"
                  class="input"
                  type="text"
                  name="phone_number"
                  value="${member.phone_number}"
                />
              </div>
              </c:otherwise>
			  </c:choose>
            </div>

            <div class="buttons">
             
              <button class="submit-btn hvr-float" type="submit">
                <i class="fas fa-pencil-alt"></i> 정보 수정
              </button>
				
              <button
                class="cancel-btn hvr-float"
                type="button"
                data-target="delete"
                data-toggle="modal"
              >
                <i class="fas fa-minus-circle"></i> 회원 탈퇴
              </button>

            </div>
          </form>
        </div>
      </div>
    </div>

    <div id="delete" class="modal">
      <div class="modal-window">
      
        <i id="notice" class="fas fa-exclamation-circle"></i>
        <div class="delete-title">
          <h4>잠깐! 정말 탈퇴하시겠어요?😧</h4>
          <p>모든 개인정보 및 박스 데이터가 삭제됩니다.</p>
        </div>
        <div class="delete-content">
	      <h5>탈퇴 전 유의사항</h5>
	      <p>-탈퇴 후 같은 아이디로 재가입이 불가합니다.</p>
        </div>
        <form id="deleteForm" action="/member/delete" method="post">
          <input type="hidden" name="member_id" value="${member_id}" />
          <div class="modalbuttons">
            <button class="delete-btn hvr-float" type="submit">
              <i class="fas fa-minus-circle"></i>&nbsp;탈퇴
            </button>
            <button data-dismiss="modal" class="hvr-float">취소</button>
          </div>
        </form>
      </div>
    </div>
  </body>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
  <script
    type="text/javascript"
    src="${pageContext.request.contextPath}/resources/assets/js/myPage.js?ver=4"
  ></script>
  <script
    type="text/javascript"
    src="${pageContext.request.contextPath}/resources/assets/js/modal.js?ver=4"
  ></script>
</html>
