<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
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
      <div class="img-container">
        <img
          class="register-image"
          src="${pageContext.request.contextPath}/resources/assets/img/register.png"
        />
        <div class="pointfont">
          소중한 물건들을 모아,
          <p class="boxfont">인투<span class="blue">박스</span></p>
        </div>
      </div>

    
      <!-- multi form -->
          <div class="form-wrap">
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

            <form id="msform" action="/member/registerPost" method="POST">
              <!-- fieldsets -->
              <!-- 1페이지 -->
              <fieldset>
                <div class="form-card">
                  
                      <h2 class="fs-title">회원 유형 선택</h2>
                    
                  <div class="member-type">
                    <button type="button" class="member-type__link personal" name="personal">
                     
                        <i class="far fa-user"></i>
                    
                      <div class="type">
                        <span class="type-title">개인회원</span>
                        <span class="type-text"
                          >다양한 개인 물품을 손쉽게 관리할 수 있습니다.</span
                        >
                      </div>
                    </button>
                    <br />

                    <button type="button" class="member-type__link company" name="company">
                      
                        <i class="far fa-building"></i>
                      
                      <div class="type">
                        <span class="type-title">기업회원</span
                        ><span class="type-text"
                          >입출고를 통한 기업용 재고 관리를 할 수
                          있습니다.</span
                        >
                      </div>
                    </button>
                  </div>
                  <div class="group">
                    <label for="company_name" class="label" id="company_name"> 기업명 </label
                      ><input
                        id="company_name"
                        class="input"
                        type="text"
                        name="company_name" value=""
                      />
                  </div>
                </div>

                <!-- 멤버 타입 숨기기 -->
                <div class="member_input" style="visibility:hidden">
                  <label for="member_type" class="label"> 멤버타입 </label
                    ><input
                      id="member_type"
                      class="input"
                      type="number"
                      name="member_type"
                      value=""
                    />
                </div>

               
                <button type="button" name="next" class="next action-button">
                  다음
                </button>
              </fieldset>

              <!-- 2페이지 -->
              <fieldset>
                <div class="form-card">
                  <h2 class="fs-title">간편 회원가입</h2>

                  <div class="social-login">
                    <a
                      href="#"
                      class="social-login__link social-login__link--google"
                      ><img
                        class="social-image"
                        src="${pageContext.request.contextPath}/resources/assets/img/btn_google.png"
                      />
                    </a>
                    <a
                      href="#"
                      class="social-login__link social-login__link--naver"
                      ><img
                        class="social-image"
                        src="${pageContext.request.contextPath}/resources/assets/img/btn_naver.png"
                      />
                    </a>
                    <a
                      href="#"
                      class="social-login__link social-login__link--kakao"
                      ><img
                        class="social-image"
                        src="${pageContext.request.contextPath}/resources/assets/img/btn_kakao.png"
                      />
                    </a>
                  </div>
                  <div class="division">
                    <div class="line l"></div>
                    <span>혹은</span>
                    <div class="line r"></div>
                    <br />
                    <span>직접 입력</span>
                  </div>

                  <div class="group">
                    <label for="member_id" class="label"> 아이디 </label
                    ><input
                      id="member_id"
                      class="input"
                      type="text"
                      name="member_id" required
                    />
                  </div>

                  <div class="group">
                    <label for="pwd" class="label"> 패스워드 </label
                    ><input
                      id="pwd"
                      class="input"
                      type="password"
                      name="password" required
                    />
                  </div>

                  <div class="group">
                    <label for="pwdcheck" class="label"> 패스워드 확인 </label
                    ><input
                      id="pwdcheck"
                      class="input"
                      type="password"
                      name="password" required
                    />
                  </div>
                </div>
                <button type="button" name="next" class="next action-button">
                  다음
                </button>
               
                <button
                  type="button"
                  name="previous"
                  class="previous action-button-previous"
                >
                  <div class="arrow-wrap">
                    <span class="arrow-part-1"></span>
                    <span class="arrow-part-2"></span>
                    <span class="arrow-part-3"></span>
                  </div>
                </button>
              </fieldset>

              <!-- 3페이지 -->
              <fieldset>
                <div class="form-card">
                  <h2 class="fs-title" style="margin-top: -5px;">프로필 이미지</h2>
                  <div id="profile-upload">
                    <div class="profile-img">
                      <input
                        type="file"
                        name="photo_name"
                        id="getval"
                        class="upload"
                      />
                    </div>
                  </div>

                  <div class="group">
                    <label for="name" class="label"> 이름 </label
                    ><input
                      id="name"
                      class="input"
                      type="text"
                      name="name" required
                    />
                  </div>

                  <div class="group">
                    <label for="email" class="label"> 이메일 </label
                    ><input id="email" class="input" type="text" name="email" required/>
                  </div>

                  <div class="group">
                    <label for="phone_number" class="label"> 휴대전화 </label
                    ><input
                      id="phone_number"
                      class="input"
                      type="text"
                      name="phone_number"
                    />
                  </div>
                </div>
                <div><button class="register-submit" type="submit">가입하기</button></div>
                <button
                  type="button"
                  name="previous"
                  class="previous action-button-previous"
                >
                  <div class="arrow-wrap">
                    <span class="arrow-part-1"></span>
                    <span class="arrow-part-2"></span>
                    <span class="arrow-part-3"></span>
                  </div>
                </button>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </section>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
  <script
    type="text/javascript"
    src="${pageContext.request.contextPath}/resources/assets/js/register.js?ver=3"
  ></script>
</html>
