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