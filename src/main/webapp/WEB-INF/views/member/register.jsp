<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Register</title>

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
      href="${pageContext.request.contextPath}/resources/assets/css/register.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script
      type="text/javascript"
      src="${pageContext.request.contextPath}/resources/assets/js/register.js"
    ></script>
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
            <a href="/member/login">
              <span class="join-btn btn-scroll-up">LOGIN</span>
            </a>
            <a href="${pageContext.request.contextPath}/board/list">
              <span class="login-btn btn-scroll-up">Q&A</span>
            </a>
          </div>
        </div>
      </nav>
    </header>

    <!-- join section -->
    <section id="join-section">
      <form class="joinform" action="/member/registerPost" method="POST">
        <div class="img-container">
          <img
            class="register-image"
            src="${pageContext.request.contextPath}/resources/assets/img/register.png"
          />
        </div>

        <div class="text-container">
          <span class="title1"> 회원가입 </span>
          <div class="title2">
            <span class="txt2"> 이미 가입하셨나요? </span>
            <a
              href="${pageContext.request.contextPath}/member/login"
              class="join-txt"
            >
              로그인
            </a>
          </div>
        </div>
      </form>
    </section>

    <!-- multi form -->
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div
          class="
            col-11 col-sm-10 col-md-10 col-lg-6 col-xl-5
            text-center
            p-0
            mt-3
            mb-2
          "
        >
          <div class="card px-0 pt-4 pb-0 mt-3 mb-3">
            <form id="msform">
              <!-- progressbar -->
              <!-- <ul id="progressbar">
                <li class="active" id="account"><strong>Account</strong></li>
                <li id="personal"><strong>Personal</strong></li>
                <li id="payment"><strong>Image</strong></li>
                <li id="confirm"><strong>Finish</strong></li>
              </ul> -->
              <!-- <div class="progress">
                <div
                  class="
                    progress-bar progress-bar-striped progress-bar-animated
                  "
                  role="progressbar"
                  aria-valuemin="0"
                  aria-valuemax="100"
                ></div>
              </div> -->
              <!-- <br /> -->
              <!-- fieldsets -->
              <fieldset>
                <div class="form-card">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="fs-title">회원 유형 선택</h2>
                    </div>
                    <div class="col-5">
                      <h2 class="steps">Step 1 - 4</h2>
                    </div>
                  </div>
                  <div class="member-type">
                    <a
                      href="#"
                      class="member-type__link member-type__link--personal"
                      ><i class="far fa-user"
                        >개인회원
                        <span
                          >다양한 개인 물품을 손쉽게 관리할 수 있습니다.</span
                        ></i
                      >
                    </a>
                    <a
                      href="#"
                      class="member-type__link member-type__link--company"
                      ><i class="far fa-building"></i>
                    </a>
                  </div>
                </div>
                <input
                  type="button"
                  name="next"
                  class="next action-button"
                  value="다음"
                />
              </fieldset>
              <fieldset>
                <div class="form-card">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="fs-title">Account Information:</h2>
                    </div>
                    <div class="col-5">
                      <h2 class="steps">Step 2 - 4</h2>
                    </div>
                  </div>
                  <label class="fieldlabels">Email: *</label>
                  <input type="email" name="email" placeholder="Email Id" />
                  <label class="fieldlabels">Username: *</label>
                  <input type="text" name="uname" placeholder="UserName" />
                  <label class="fieldlabels">Password: *</label>
                  <input type="password" name="pwd" placeholder="Password" />
                  <label class="fieldlabels">Confirm Password: *</label>
                  <input
                    type="password"
                    name="cpwd"
                    placeholder="Confirm Password"
                  />
                </div>
                <input
                  type="button"
                  name="next"
                  class="next action-button"
                  value="다음"
                />
                <input
                  type="button"
                  name="previous"
                  class="previous action-button-previous"
                  value="Back"
                />
              </fieldset>

              <fieldset>
                <div class="form-card">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="fs-title">Image Upload:</h2>
                    </div>
                    <div class="col-5">
                      <h2 class="steps">Step 3 - 4</h2>
                    </div>
                  </div>
                  <label class="fieldlabels">Upload Your Photo:</label>
                  <input type="file" name="pic" accept="image/*" />
                  <label class="fieldlabels">Upload Signature Photo:</label>
                  <input type="file" name="pic" accept="image/*" />
                </div>
                <input
                  type="button"
                  name="next"
                  class="next action-button"
                  value="가입하기"
                />
                <input
                  type="button"
                  name="previous"
                  class="previous action-button-previous"
                  value="Back"
                />
              </fieldset>

              <fieldset>
                <div class="form-card">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="fs-title">Finish:</h2>
                    </div>
                    <div class="col-5">
                      <h2 class="steps">Step 4 - 4</h2>
                    </div>
                  </div>
                  <br /><br />
                  <h2 class="purple-text text-center">
                    <strong>SUCCESS !</strong>
                  </h2>
                  <br />
                  <div class="row justify-content-center">
                    <div class="col-3">
                      <img
                        src="https://i.imgur.com/GwStPmg.png"
                        class="fit-image"
                      />
                    </div>
                  </div>
                  <br /><br />
                  <div class="row justify-content-center">
                    <div class="col-7 text-center">
                      <h5 class="purple-text text-center">
                        You Have Successfully Signed Up
                      </h5>
                    </div>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
