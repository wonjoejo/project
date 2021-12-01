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



    // 회원 탈퇴
    if(result !== ""){
      Swal.fire({
        icon: 'error',
        title: '회원탈퇴 실패',
        html: '마스터 권한을 가지고 있는 박스가 있습니다.<br>권한을 양도하거나 박스를 삭제해주세요.',
        footer: '<a href="/board/listPerPage">문의하러 가기</a>'
      })
    }


});


// 유효성 검사
const nameJ = /^[가-힣a-zA-Z]+$/;
const mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const phoneJ = /^010?([0-9]{4})?([0-9]{4})$/;
const pwJ = /^[A-Za-z0-9]{4,12}$/;

// submit
$('#submitBtn').click(function (){
  const password = document.querySelector('#pwd');
  const name = document.querySelector('#name');
  const email = document.querySelector('#email');
  const phoneNumber = document.querySelector('#phone_number');

  if (password.value === "" || !pwJ.test(password.value)){
    Swal.fire({
      icon: 'warning',
      title: '패스워드를 확인해주세요.',
      text:'영문 혹은 숫자로 4~12글자 이상 입력해주세요'
    });
    return false

  } else if (name.value === "" || !nameJ.test(name.value)){
    Swal.fire({
      icon: 'warning',
      title: '이름을 확인해주세요.',
      text:'한글 또는 영문으로 입력해주세요'

    });
    return false

  } else if (email.value === "" || !mailJ.test(email.value)){
    Swal.fire({
      icon: 'warning',
      title: '이메일을 확인해주세요.',
      text:'이메일 형식으로 입력해주세요.'
    });

    return false

  } else if (phoneNumber.value === "" || !phoneJ.test(phoneNumber.value)){
    Swal.fire({
      icon: 'warning',
      title: '전화번호를 확인해주세요.',
      text:'-없이 입력해주세요.'
    });
    return false

  } // if-else


  Swal.fire({
    icon: 'success',
    title: '회원정보 수정이 완료되었습니다.'
  });
});




