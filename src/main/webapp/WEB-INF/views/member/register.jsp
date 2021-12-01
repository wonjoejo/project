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
      href="${pageContext.request.contextPath}/resources/assets/css/main.css?ver=1"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/register.css?ver=3"
    />

    <style>
      .btn-click {
        background: #f5f9ff;
        border: 1px solid #5a95f5;
        box-sizing: border-box;
        box-shadow: 0px 4px 14px 1px rgba(0, 0, 0, 0.04);
        border-radius: 6px;
      }
    </style>
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
        <a href="/" class="main-logo">
          <img
                  src="${pageContext.request.contextPath}/resources/assets/img/main_logo.png"
              alt="메인로고"
            />
          </a>
          <div class="top-right">
            <a href="/member/login">
              <span class="join-btn btn-scroll-up">로그인</span>
            </a>
            <a href="${pageContext.request.contextPath}/board/listPerPage">
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

        <form
          id="msform"
          action="/member/registerPost"
          method="POST"
          enctype="multipart/form-data"
        >
          <!-- fieldsets -->
          <!-- 1페이지 -->
          <fieldset>
            <div class="form-card">
              <h2 class="fs-title">회원 유형 선택</h2>

              <div class="member-type">
                <button
                  type="button"
                  class="member-type__link test"
                  name="personal"
                  id="personalBtn"
                >
                  <!-- 기본 개인 이미지 -->
                  <img
                    id="personal-img"
                    src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke.png"
                  />
                  <!-- <i class="far fa-user"></i> -->

                  <div class="type">
                    <span class="type-title">개인회원</span>
                    <span class="type-text"
                      >다양한 개인 물품을 손쉽게 관리할 수 있습니다.</span
                    >
                  </div>
                  <i id="arr1" class="fas fa-arrow-right"></i>
                </button>
                <br />

                <button
                  type="button"
                  class="member-type__link"
                  name="company"
                  id="companyBtn"
                >
                  <!-- 기본 기업 이미지 -->
                  <img
                    id="company-img"
                    src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke_co.png"
                  />
                  <!-- <i class="far fa-building"></i> -->

                  <div class="type">
                    <span class="type-title">기업회원</span
                    ><span class="type-text"
                      >입출고를 통한 기업용 재고 관리를 할 수 있습니다.</span
                    >
                  </div>
                  <i id="arr2" class="fas fa-arrow-right"></i>
                </button>
              </div>
              <div class="group">
                <label for="company_name" class="label" id="company_name">
                  기업명 </label
                ><input
                  id="company_name"
                  class="input"
                  type="text"
                  name="company_name"
                  value=""
                  placeholder="Company name"
                />
              </div>
            </div>

            <!-- 멤버 타입 숨기기 -->
            <div class="member_input" style="visibility: hidden">
              <label for="member_type" class="label"> 멤버타입 </label
              ><input
                id="member_type"
                class="input"
                type="number"
                name="member_type"
                value=""
              />
            </div>

            <button
              type="button"
              name="next"
              class="next action-button"
              id="next1"
            >
              다음
            </button>
          </fieldset>

          <!-- 2페이지 -->
          <fieldset>
            <div class="form-card">
              <h2 class="fs-title">간편 회원가입</h2>

              <!--  <div class="social-login">
                <a
                  href="#"
                  class="social-login__link social-login__link--google"
                  ><img
                    class="social-image"
                    src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/btn_google.png"
                  />
                </a>
                <a href="#" class="social-login__link social-login__link--naver"
                  ><img
                    class="social-image"
                    src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/btn_naver.png"
                  />
                </a>
                <a href="javascript:void(0)" class="social-login__link social-login__link--kakao" >   
                   <img
                        class="social-image"
                        src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/btn_kakao.png" onclick="kakaoLogin();"/>
                </a>
              </div>-->
              
              <div>
               
                <button class="social-login" type="button" onclick="kakaoLogin();"> 
                <img
                        class="social-image"
                        src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/btn_kakao.png"/>카카오로 시작하기</button>
              </div>
              
              <div class="division">
                <div class="line l"></div>
                <span>혹은</span>
                <div class="line r"></div>
                <br />
                <span>직접 입력</span>
              </div>

              <div class="group">
                <label for="member_id" class="label">
                  아이디<i class="fas fa-asterisk"></i> </label>
                <input
                  id="member_id"
                  class="input"
                  type="text"
                  name="member_id"
                  placeholder="ID"
                  required
                  oninput="checkId()"/>
              </div>
              <div class="alert alert-success" id="alert-success-id">
                사용 가능한 아이디입니다.
              </div>
              <div class="alert alert-danger" id="alert-danger-id">
                사용 불가한 아이디입니다.
              </div>
              <div class="alert alert-danger" id="alert-min-id">
                영문 3글자 이상 입력하세요.
              </div>

              <div class="pw">
                <div class="group">
                  <label for="pwd" class="label">
                    패스워드<i class="fas fa-asterisk"></i> </label
                  ><input
                    id="pwd"
                    class="input"
                    type="password"
                    name="password"
                    placeholder="Password"
                    required
                  /><i id="pwd1" class="fas fa-eye active"></i>
                </div>
                <div class="alert alert-danger" id="alert-min-pw">
                  영문 혹은 숫자로 4~12글자 이상 입력하세요.
                </div>
                <div class="alert alert-danger" id="alert-danger-pw">
                  영문 혹은 숫자로 4~12글자 이상 입력하세요.
                </div>
                <div class="group">
                  <label for="pwdcheck" class="label">
                    패스워드 확인<i class="fas fa-asterisk"></i> </label
                  ><input
                    id="pwdcheck"
                    class="input"
                    type="password"
                    name="pwdcheck"
                    placeholder="Confirm Password"
                    required
                  /><i id="pwd2" class="fas fa-eye"></i>
                </div>
              </div>
              <div class="alert alert-success" id="alert-success">
                패스워드가 일치합니다.
              </div>
              <div class="alert alert-danger" id="alert-danger">
                패스워드가 일치하지 않습니다.
              </div>
            </div>
            <button
              type="button"
              name="next"
              class="next action-button"
              id="next2"
            >
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
              <h2 class="fs-title" style="margin-top: -5px">프로필 이미지</h2>
              <div id="profile-upload">
                <input
                  type="file"
                  name="file"
                  id="profile-photo"
                  class="upload"
                />
                <input type="hidden" name="photo_name" id="default" />
                <input
                  type="hidden"
                  name="photo_path"
                  value="https://intobox.s3.ap-northeast-2.amazonaws.com/default/"
                />
              </div>

              <div class="group">
                <label for="name" class="label">
                  이름<i class="fas fa-asterisk"></i> </label
                ><input
                  id="name"
                  class="input"
                  type="text"
                  name="name"
                  placeholder="임박스"
                  required
                />
              </div>
              <div class="alert alert-danger" id="alert-danger-name">
                이름을 입력하세요.
              </div>

              <div class="group">
                <label for="email" class="label">
                  이메일<i class="fas fa-asterisk"></i> </label
                ><input
                  id="email"
                  class="input"
                  type="text"
                  name="email"
                  placeholder="intobox2jo@gmail.com"
                  required
                />
              </div>
              <div class="alert alert-danger" id="alert-danger-mail">
                메일 주소를 입력하세요.
              </div>

              <div class="group">
                <label for="phone_number" class="label"> 휴대전화 </label
                ><input
                  id="phone_number"
                  class="input"
                  type="text"
                  name="phone_number"
                  placeholder="01012345678"
                />
              </div>
              <div class="alert alert-danger" id="alert-danger-phone">
                -없이 숫자를 입력하세요.
              </div>
            </div>

            <div>
              <button id="submitBtn" class="register-submit" type="submit" disabled="">가입하기</button>
            </div>
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
    </section>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<%--  sweet alert --%>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>

  <script type="text/javascript">
  $(function () {
      $("#alert-success").hide();
      $("#alert-danger").hide();
      $("#alert-danger-pw").hide();
      $("#alert-danger-name").hide();
      $("#alert-danger-mail").hide();
      $("#alert-danger-phone").hide();
      
      const nameJ = /^[가-힣a-zA-Z]+$/;
      const mailJ =
        /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      const phoneJ = /^010?([0-9]{4})?([0-9]{4})$/;
      
      const pwJ = /^[A-Za-z0-9]{4,12}$/;
      
        // 비밀번호 유효성 검사
      	$("#pwd").keyup(function () {

     	     if (pwJ.test($(this).val())){
     	    	$("#alert-danger-pw").hide();
     	    	$("#alert-min-pw").hide();				
			 } else {
				$("#alert-min-pw").hide();
				$("#alert-danger-pw").show();
			 } // if-else
        }); // pwd input
        
		// 비밀번호 확인
        $("#pwdcheck").keyup(function () {
        	const pwd = $("#pwd").val();
      		const pwdcheck = $("#pwdcheck").val();
      		
        	$("#alert-danger").show();
        	
        	if(pwd == pwdcheck) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				// $(".register-submit").removeAttr("disabled");
      		} else {  
      			$("#alert-success").hide();
	            $("#alert-danger").show();
	            // $(".register-submit").attr("disabled", "disabled");
      		}//if-else	
        }); // pwdcheck input

     	// 이름
     	$("#name").keyup(function () {
	        if (nameJ.test($(this).val())){
	      	  $("#alert-danger-name").hide();
	        } else {
	          $("#alert-danger-name").show();
	        } // nameJ
     	}); // name input 
     	
      	// 메일
      	$("#email").keyup(function () {
	        if (mailJ.test($(this).val())){
	      	  $("#alert-danger-mail").hide();
	        } else {
	            $("#alert-danger-mail").show();
	        } // mailJ
        }); // email input
        
	    // 폰번호
	    $("#phone_number").keyup(function () {
	        if (phoneJ.test($(this).val())){
	      	  $("#alert-danger-phone").hide();
	        }	else {
	            $("#alert-danger-phone").show();
	        } // phoneJ
   	    }); // phone_number input
 
    }); // function
  
  </script>
 
  <script>
  // 아이디 중복검사
  function checkId() {
    const member_id = $("#member_id").val(); //id값이 "id"인 입력란의 값을 저장
    console.log(member_id);
    $.ajax({
      url: "/member/idCheck",
      type: "post",
      data: { member_id: member_id },
      success: function (cnt) {
        const submitBtn = document.querySelector('#submitBtn');
        if (cnt != 1 && member_id.length > 2) {
          // cnt가 0일 경우 -> 사용 가능한 아이디
           $("#alert-min-id").hide();
           $("#alert-success-id").show();
           $("#alert-danger-id").hide();
           submitBtn.disabled = false;


        } else {
          // cnt가 1일 경우 -> 이미 존재하는 아이디
           $("#alert-min-id").hide();
           $("#alert-success-id").hide();
           $("#alert-danger-id").show();
          submitBtn.click(function (){
            alert("아이디 확인");

          });
          submitBtn.disabled = true;


        }
      },
    });
  }
  </script>
  <script>
  // 카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: '/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  </script>
  <script
          type="text/javascript"
          src="${pageContext.request.contextPath}/resources/assets/js/register.js?ver=3"></script>
</html>
