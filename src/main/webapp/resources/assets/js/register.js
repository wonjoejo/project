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
  });

  // 기업 회원
  $("button[name='company']").click(function () {
    document.querySelector("#company_name").style.display = "block";

    document.querySelector(".input").style.display = "block";

    document.getElementById("member_type").value = member_company;

    console.log("기업회원 체크");
  });
});

// 사진 업로드
function readURL() {
  var file = document.getElementById("getval").files[0];
  var reader = new FileReader();
  reader.onloadend = function () {
    document.getElementById("profile-upload").style.backgroundImage =
      "url(" + reader.result + ")";
  };
  if (file) {
    reader.readAsDataURL(file);
  } else {
  }
}
document.getElementById("getval").addEventListener("change", readURL, true);
