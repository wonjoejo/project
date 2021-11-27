// 프로필 이미지 변경
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
  $("#pw i").on("click", function () {
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