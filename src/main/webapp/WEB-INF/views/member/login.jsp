<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8"/>
    <title>Login</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16"/>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16"/>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

    <!-- stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css?ver=2"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css?ver=5"/>
</head>
<body>
<!-- header -->
<header>
    <nav
            id="headerwrap"
            class=""
            data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container">
            <a href="#" class="main-logo">
                <img
                        src="${pageContext.request.contextPath}/resources/assets/img/main_logo.png"
                        alt="메인로고"/>
            </a>

            <div class="top-right">
                <a href="/member/register">
                    <span class="join-btn btn-scroll-up">JOIN</span>
                </a>
                <a href="${pageContext.request.contextPath}/board/listPerPage">
                    <span class="login-btn btn-scroll-up">Q&A</span>
                </a>
            </div>

        </div>
    </nav>
</header>

<!-- login section -->
<section id="login-section">
    <div class="form-wrap">
        <form class="loginform" action="/member/loginPost" method="POST">

            <span class="title1"> 반갑습니다! </span>

            <div class="title2">
                <span class="txt2"> 인투박스가 처음이신가요? </span>

                <a href="${pageContext.request.contextPath}/member/register" class="join-txt">
                    회원가입
                </a>
            </div>

            <div class="group">
                <label for="id" class="label"> 아이디 </label>
                <input id="id" class="input" type="text" name="member_id" required/>
            </div>

            <div class="group" id="pw">
                <label for="pwd" class="label"> 패스워드 </label>
                <input id="pwd" class="input" type="password" name="password" required/>
                <i id="pwd1" class="fas fa-eye active"></i>
            </div>

            <div class="login2">
                <label class="container2">자동 로그인
                    <input type="checkbox" name="rememberMe"/>
                    <span class="checkmark"></span>
                </label>
                <button type="button" class="login-trigger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    계정 찾기
                </button>

            </div>

            <div>
                <button class="login-submit" type="submit">Login</button>
            </div>

            <div class="division">
                <div class="line l"></div>
                <span>간편 로그인</span>
                <div class="line r"></div>
            </div>

            <div class="social-login">
                <a href="#" class="social-login__link social-login__link--google">
                    <img
                        class="social-image"
                        src="${pageContext.request.contextPath}/resources/assets/img/btn_google.png"/>
                </a>
                <a href="#" class="social-login__link social-login__link--naver">
                    <img
                        class="social-image"
                        src="${pageContext.request.contextPath}/resources/assets/img/btn_naver.png"/>
                </a>
                <a href="#" class="social-login__link social-login__link--kakao">
                    <img
                        class="social-image"
                        src="${pageContext.request.contextPath}/resources/assets/img/btn_kakao.png"/>
                </a>
            </div>
    </div>
    <div class="img-container">
        <img
                class="login-image"
                src="${pageContext.request.contextPath}/resources/assets/img/login.png"/>
    </div>
    </form>
</section>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title modal-title-style" id="exampleModalLabel">계정 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="line"></div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row modal-content-wrap">
                        <div class="col-8 col-sm-6 findId findBox" data-bs-toggle="modal" data-bs-target="#findIdEmail">
                                <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke.png" alt="아이디 찾기" class="findImg findIdImg">
                                <p class="findP">
                                    아이디 찾기
                                    <i class="fas fa-arrow-right" id="idArrow"></i>
                                </p>
                            </div>
                        <div class="col-4 col-sm-6 findPw findBox" data-bs-toggle="modal" data-bs-target="#findPwEmail">
                            <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke_pw.png" alt="비밀번호 변경" class="findImg findPwImg">
                            <p class="findP">
                                비밀번호 변경
                                <i class="fas fa-arrow-right" id="pwArrow"></i>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 아이디찾기 이메일 -->
<div class="modal fade" id="findIdEmail" tabindex="-1" aria-labelledby="findIdEmailLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title modal-title-style">아이디 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="line"></div>
            <div class="modal-body">
                <div class="container-fluid emailContentBox">
                    <p>이름을 입력해 주세요.</p>
                    <input type="text" id="name" name="name" class="emailInput" placeholder="이름">

                    <p class="emailP">이메일 주소를 입력해 주세요.</p>
                    <input type="text" id="email" name="email" class="emailInput" placeholder="이메일">
                    <div class="findIdBtn">
                        <button type="button" class="confirm" id="findIdConfirm">확인</button>
                        <button type="button" class="cancel" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호 변경 -->
<div class="modal fade" id="findPwEmail" tabindex="-1" aria-labelledby="findPwEmailLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title modal-title-style">비밀번호 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="line"></div>
            <div class="modal-body">
                <div class="container-fluid emailContentBox">
                    <p>아이디를 입력해 주세요.</p>
                    <input type="text" id="idPw" name="id" class="emailInput" placeholder="아이디">

                    <p class="emailP">이메일 주소를 입력해 주세요.</p>
                    <input type="text" id="emailPw" name="email" class="emailInput" placeholder="이메일">

                    <div class="findIdBtn">
                        <button type="submit" class="confirm" id="findPwConfirm">확인</button>
                        <button type="button" class="cancel" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- loading --%>
<div id="viewLoading">
    <img src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/ajax-loader.gif" />
</div>

</body>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/login.js?ver=2"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%-- sweet alert --%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</html>
