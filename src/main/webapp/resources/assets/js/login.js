
document.addEventListener('click', function (e) {
    e = e || window.event;
    let target = e.target || e.srcElement;

    if (target.hasAttribute('data-toggle') && target.getAttribute('data-toggle') === 'modal') {
        if (target.hasAttribute('data-target')) {
            let m_ID = target.getAttribute('data-target');
            document.getElementById(m_ID).classList.add('open');
            e.preventDefault();
        }
    }

    // Close modal window with 'data-dismiss' attribute or when the backdrop is clicked
    if ((target.hasAttribute('data-dismiss') && target.getAttribute('data-dismiss') === 'modal') || target.classList.contains('modal')) {
        let modal = document.querySelector('[class="modal open"]');
        modal.classList.remove('open');
        e.preventDefault();
    }
}, false);


// 아이디, 비번 찾기

const findId = document.querySelector('.findId');
const findPw = document.querySelector('.findPw');

findId.addEventListener('mouseover', function () {
    document.querySelector('#idArrow').style.display = 'inline-block';
});
findId.addEventListener('mouseout', function () {
    document.querySelector('#idArrow').style.display = 'none';
});

findPw.addEventListener('mouseover', function () {
    document.querySelector('#pwArrow').style.display = 'inline-block';
});
findPw.addEventListener('mouseout', function () {
    document.querySelector('#pwArrow').style.display = 'none';
});

// findId.addEventListener('click', function (e){
//     e.preventDefault();
//     document.querySelector('#findIdEmail').style.display = "inline-block";
//     document.querySelector('#exampleModal').style.display = "none";
//
// });


// id 찾기 비동기
const name = document.querySelector('#name');
const email = document.querySelector('#email');

document.querySelector('#findIdConfirm').addEventListener('click', getId);

function getId() {

    let data = {
        name: name.value,
        email: email.value
    }

    console.log(data);

    $.ajax({
        url: "/member/findId",
        type: "POST",
        data: data,
        dataType: 'json',
        success: function (data) {
            $(data).each(function () {
                Swal.fire({
                    icon: 'success',
                    title: '고객님의 아이디는',
                    text: this.member_id + '입니다'
                })
            });
        }, error:function (error) {
            Swal.fire({
                icon: 'error',
                html: '해당되는 아이디가 없습니다. <br> 다시 한 번 확인해주세요.'
            })
        }

    }); // ajax

} // getId


// pw 찾기 비동기
const id = document.querySelector('#idPw');
const emailPw = document.querySelector('#emailPw');

document.querySelector('#findPwConfirm').addEventListener('click', getPw);

function getPw() {

    let data = {
        member_id: id.value,
        email: emailPw.value
    }

    $.ajax({
        url: "/member/findPw",
        type: "POST",
        data: data,
        dataType: 'json',
        success: function (data) {
            $(data).each(function (){
                $.ajax({
                    url: "/member/newPassword",
                    type: "post",
                    data: {
                        member_id: this.member_id
                    },
                    dataType: 'json',
                    success: function (data) {

                        $.ajax({
                            url: "/member/findPassword",
                            type: "POST",
                            data: {
                                member_id: data
                            },
                            dataType: 'json',
                            beforeSend: function (){
                                $('html').css("cursor", "wait");
                                console.log("start");
                            },
                            complete: function (){
                                $('html').css("cursor", "auto");
                            },
                            success: function (data) {

                                Swal.fire({
                                    icon: 'success',
                                    title: '이메일 전송 완료',
                                    html: '임시 비밀번호가 이메일로 전송 되었습니다.</br>' +
                                        '로그인 후 비밀번호를 변경 해 주세요.',
                                }) .then(function (){
                                    location.href = "/member/login";
                                });

                            }, error:function (error) {
                                Swal.fire({
                                    icon: 'error',
                                    html: '해당되는 아이디가 없습니다. <br> 다시 한 번 확인해주세요.'
                                })
                            }
                        }) // ajax
                    },error:function (error) {
                        Swal.fire({
                            icon: 'error',
                            html: '해당되는 아이디가 없습니다. <br> 다시 한 번 확인해주세요.'
                        })
                    }
                }) // ajax
            }); // data each

        }, error:function (error) {
            Swal.fire({
                icon: 'error',
                html: '해당되는 아이디가 없습니다. <br> 다시 한 번 확인해주세요.'
            });
        }
    }); // ajax

} // getPw



// loading



//AJAX 통신 시작
$(document).ajaxStart(function() {
    //마우스 커서를 로딩 중 커서로 변경
    $('html').css("cursor", "wait");
    console.log('start');
});
//AJAX 통신 종료
$(document).ajaxStop(function() {
    //마우스 커서를 원래대로 돌린다
    $('html').css("cursor", "auto");
    console.log('end');
});


