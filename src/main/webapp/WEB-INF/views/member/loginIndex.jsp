<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
  <head>
    <meta charset="UTF-8" />
    <title>LoginIndex</title>

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
      href="${pageContext.request.contextPath}/resources/assets/css/main.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/login.css"
    />
  </head>
  <body>
    <!-- header -->
    <header>
      <nav
        id="headerwrap"
        class=""
        data-navbar-on-scroll="data-navbar-on-scroll"
      >
        <div class="container">
          <a href="#" class="main-logo">
            <img
              src="${pageContext.request.contextPath}/resources/assets/img/main_logo.png"
              alt="메인로고"
            />
          </a>
          <div class="top-right">
            <a href="/member/register">
              <span class="join-btn btn-scroll-up">JOIN</span>
            </a>
            <a href="${pageContext.request.contextPath}/board/list">
              <span class="login-btn btn-scroll-up">Q&A</span>
            </a>
          </div>
        </div>
      </nav>
    </header>

    <!-- index -->
    <div class="start-container">
    <div class="pointfont">
          쉽고 편한 물품 관리,<break></break>
          <p class="boxfont">인투<span class="blue">박스</span></p>에 오신 걸 환영합니다!
    </div>
	<div class="img-container">
          <img
            class="start-image"
            src="${pageContext.request.contextPath}/resources/assets/img/startservice.png"
          />
    </div>
	<button type="button" class="start-service" onclick="location.href='login'">물품 관리 시작하기</button>
	</div>
	
  </body>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
</html>
