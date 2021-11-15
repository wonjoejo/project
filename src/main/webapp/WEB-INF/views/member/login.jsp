<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Login</title>

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

    <script
      type="text/javascript"
      src="${pageContext.request.contextPath}/resources/assets/js/login.js"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
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

    <!-- login section -->
    <section id="login-section">
      <form class="loginform" action="/member/loginPost" method="POST">
        <div class="img-container">
          <img
            class="login-image"
            src="${pageContext.request.contextPath}/resources/assets/img/login.png"
          />
        </div>

        <span class="title1"> 반갑습니다! </span>

        <div class="title2">
          <span class="txt2"> 인투박스가 처음이신가요? </span>

          <a
            href="${pageContext.request.contextPath}/member/register"
            class="join-txt"
          >
            회원가입
          </a>
        </div>

        <div class="group">
          <label for="id" class="label"> 아이디 </label
          ><input id="id" class="input" type="text" name="member_id" />
        </div>

        <div class="group">
          <label for="pwd" class="label"> 패스워드 </label
          ><input id="pwd" class="input" type="password" name="password" />
        </div>

        <div class="login2">
          <label class="container2"
            >자동 로그인<input type="checkbox" name="rememberMe" /><span
              class="checkmark"
            ></span
          ></label>
          <a
            class="login-trigger"
            data-toggle="modal"
            href="javascript:void(0)"
            onclick="openLoginModal();"
            >계정 찾기</a
          >
        </div>

        <div><button class="login-submit" type="submit">Login</button></div>

        <div class="division">
          <div class="line l"></div>
          <span>간편 로그인</span>
          <div class="line r"></div>
        </div>

        <div class="social-login">
          <a href="#" class="social-login__link social-login__link--google"
            ><img
              class="social-image"
              src="${pageContext.request.contextPath}/resources/assets/img/btn_google.png"
            />
          </a>
          <a href="#" class="social-login__link social-login__link--naver"
            ><img
              class="social-image"
              src="${pageContext.request.contextPath}/resources/assets/img/btn_naver.png"
            />
          </a>
          <a href="#" class="social-login__link social-login__link--kakao"
            ><img
              class="social-image"
              src="${pageContext.request.contextPath}/resources/assets/img/btn_kakao.png"
            />
          </a>
        </div>
      </form>
    </section>

  </body>
</html>
