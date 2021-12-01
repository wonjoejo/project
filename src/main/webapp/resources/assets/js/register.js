$(document).ready(function () {
  let current_fs, next_fs, previous_fs; //fieldsets
  let opacity;
  let current = 1;

  const member_personal = 0;
  const member_company = 1;


  const nameJ = /^[가-힣a-zA-Z]+$/;
  const mailJ =
      /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  const phoneJ = /^010?([0-9]{4})?([0-9]{4})$/;
  const pwJ = /^[A-Za-z0-9]{4,12}$/;
  let reg_id = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/ // 반드시 영문으로 시작 숫자+언더바/하이픈 허용 4~20자리


  // next2
  $('#next2').click(function (e) {
    e.preventDefault();
    const memberId = document.querySelector('#member_id');
    const password = document.querySelector('#pwd');
    const passwordCheck = document.querySelector('#pwdcheck');


    if (memberId.value === "" || !reg_id.test(memberId.value)) {
      Swal.fire({
        icon: 'warning',
        title: '아이디를 확인해주세요.'
      });
    } else if (password.value === "" || !pwJ.test(password.value)) {
      Swal.fire({
        icon: 'warning',
        title: '패스워드를 확인해주세요.'
      });
    } else if (passwordCheck.value === "" || password.value !== passwordCheck.value) {
      Swal.fire({
        icon: 'warning',
        title: '패스워드가 일치하지 않습니다.'
      });
    } else {
      current_fs = $(this).parent();
      next_fs = $(this).parent().next();

      //show the next fieldset
      next_fs.show();
      //hide the current fieldset with style
      current_fs.animate(
          {opacity: 0},
          {
            step: function (now) {
              // for making fielset appear animation
              opacity = 1 - now;

              current_fs.css({
                display: "none",
                position: "relative",
              });
              next_fs.css({opacity: opacity});
            },
            duration: 500,
          }
      );
    }


  });

  // submit
  $('#submitBtn').click(function (e) {
    e.preventDefault();
    const name = document.querySelector('#name');
    const email = document.querySelector('#email');
    const phoneNumber = document.querySelector('#phone_number');


    if (name.value === "" || !nameJ.test(name.value)) {
      Swal.fire({
        icon: 'warning',
        title: '이름을 확인해주세요.'
      });
      return false
    } else if (email.value === "" || !mailJ.test(email.value)) {
      Swal.fire({
        icon: 'warning',
        title: '이메일을 확인해주세요.'
      });
      return false
    } else if (phoneNumber.value === "" || !phoneJ.test(phoneNumber.value)) {
      Swal.fire({
        icon: 'warning',
        title: '전화번호를 확인해주세요.'
      });
      return false
    } // if-else

  });


  // next1
  $("#next1").click(function (e) {
    e.preventDefault();
    current_fs = $(this).parent();
    next_fs = $(this).parent().next();

    //show the next fieldset
    next_fs.show();
    //hide the current fieldset with style
    current_fs.animate(
        {opacity: 0},
        {
          step: function (now) {
            // for making fielset appear animation
            opacity = 1 - now;

            current_fs.css({
              display: "none",
              position: "relative",
            });
            next_fs.css({opacity: opacity});
          },
          duration: 500,
        }
    );

  });

  $(".previous").click(function () {
    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();

    //show the previous fieldset
    previous_fs.show();

    //hide the current fieldset with style
    current_fs.animate(
      { opacity: 0 },
      {
        step: function (now) {
          // for making fielset appear animation
          opacity = 1 - now;

          current_fs.css({
            display: "none",
            position: "relative",
          });
          previous_fs.css({ opacity: opacity });
        },
        duration: 500,
      }
    );
  });

  $(".next").click(function () {
    document.querySelector(".title2").style.display = "none";
  });


  // 개인 회원
  $("button[name='personal']").click(function () {
    document.getElementById("member_type").value = member_personal;
    console.log("개인회원 체크");

    document.querySelector("#company_name").style.display = "none";
    document.querySelector(".input").style.display = "none";

	$("#arr1").fadeToggle(function() {
	});
	
    document.querySelector("#arr2").style.display = "none";

    $("#personalBtn").toggleClass("personal");
    $("#companyBtn").removeClass("company");

    $("#personal-img").attr("src", function (index, attr) {
      if (
        attr.match(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke.png"
        )
      ) {
        return attr.replace(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke.png",
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon.png"
        );
      } else {
        return attr.replace(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon.png",
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke.png"
        );
      }
    });

    $("#company-img").attr("src", function (index, attr) {
      if (
        attr.match(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_co.png"
        )
      ) {
        return attr.replace(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_co.png",
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke_co.png"
        );
      }
    });
  });

  // 기업 회원
  $("button[name='company']").click(function () {
    //document.querySelector("#company_name").style.display = "block";
    
    $("#company_name").slideToggle(300, function() {
	
	$("#company_name.input").slideToggle(300,function() {
	 $("#company_name.input").focus();
	});
	
	});
    
    
	$("#arr2").fadeToggle(function() {
	});
    //document.querySelector(".input").style.display = "block";

    document.getElementById("member_type").value = member_company;

    console.log("기업회원 체크");

    $("#companyBtn").toggleClass("company");
    $("#personalBtn").removeClass("personal");

    document.querySelector("#arr2").style.display = "block";

    document.querySelector("#arr1").style.display = "none";

    $("#personal-img").attr("src", function (index, attr) {
      if (
        attr.match(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon.png"
        )
      ) {
        return attr.replace(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon.png",
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke.png"
        );
      }
    });

    $("#company-img").attr("src", function (index, attr) {
      if (
        attr.match(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke_co.png"
        )
      ) {
        return attr.replace(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke_co.png",
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_co.png"
        );
      } else {
        return attr.replace(
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_co.png",
          "https://intobox.s3.ap-northeast-2.amazonaws.com/default/polygon_stroke_co.png"
        );
      }
    });
  });
});

// 프로필 업로드
let file = document.querySelector("#profile-photo");

file.addEventListener("change", function (f) {
  let reader = new FileReader();
  let input = f.target;

  reader.onload = function (e) {
    let dataUrl = reader.result;
    const photo = document.getElementById("profile-upload");

    photo.style.backgroundImage = "url(" + dataUrl + ")";
  };

  reader.readAsDataURL(file.files[0]);
});

// 비밀번호 눈
$(document).ready(function () {
  $(".pw i").on("click", function () {
    $("input").toggleClass("active");
    if ($("input").hasClass("active")) {
      console.log(this);
      $(this)
        .attr("class", "fas fa-eye-slash")
        .prev("input")
        .attr("type", "text");
    } else {
      $(this)
        .attr("class", "fas fa-eye")
        .prev("input")
        .attr("type", "password");
    }
  });
});

