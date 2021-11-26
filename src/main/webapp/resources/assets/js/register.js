$(document).ready(function () {
  var current_fs, next_fs, previous_fs; //fieldsets
  var opacity;
  var current = 1;

  const member_personal = 0;
  const member_company = 1;

  $(".next").click(function () {
    current_fs = $(this).parent();
    next_fs = $(this).parent().next();

    //show the next fieldset
    next_fs.show();
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
          next_fs.css({ opacity: opacity });
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

    document.querySelector("#arr1").style.display = "block";

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
    document.querySelector("#company_name").style.display = "block";

    document.querySelector(".input").style.display = "block";

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
