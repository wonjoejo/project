
    $('#nav-icon3').click(function () {
        $(this).toggleClass('open');
    });

    document.querySelector('.button').addEventListener('click', () => {
        document.querySelector('.menu__list')
            .classList.toggle('menu__list--animate');
    });

    $('#nav-icon4').click(function () {
        $(this).toggleClass('open');
    });

    // sweetalert
    $('#more').click(function () {
        swal.fire({
            text: "product_memo"
        });
    });


    // 카카오 공유하기
    Kakao.init('bf8980d064e0888e1bf9f6692ff4951f'); // 초기화

    let detailList = [];
    if (cate_detail1 != "") {
        detailList.push(`#${cate_detail1} `);
    }
    if (cate_detail2 != "") {
        detailList.push(`#${cate_detail2} `);
    }
    if (cate_detail3 != "") {
        detailList.push(`#${cate_detail3} `);
    }
    if (cate_detail4 != "") {
        detailList.push(`#${cate_detail4} `);
    }
    if (cate_detail5 != "") {
        detailList.push(`#${cate_detail5} `);
    }


    console.log(detailList);

    function sendLink() {
        Kakao.Link.sendDefault({
            objectType: 'feed',
            content: {
                title: `${product_name}`,
                description: detailList.toString(),
                imageUrl:
                    `https://intobox.s3.ap-northeast-2.amazonaws.com/${product_photo_path}${product_photo_name}`,
                link: {
                    mobileWebUrl: window.location.href,
                    webUrl: window.location.href,
                },
            },
        buttons: [
            {
                title: '웹으로 보기',
                link: {
                    mobileWebUrl: window.location.href,
                    webUrl: window.location.href,
                },
            },

        ],
    })
}



const deleteBtn = document.querySelector("#delete-btn");

deleteBtn.addEventListener("click", function (e) {
    e.preventDefault();

    Swal.fire({
        title: '삭제하시겠습니까?',
        text: "삭제된 물품은 복구가 불가능합니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#5A95F5',
        cancelButtonColor: '#DD3333',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("product_no 확인: " + product_no);
            $.ajax({
                type: "POST",
                url: "/product/delete",
                data: {
                    "product_no": product_no,
                    "box_no":box_no
                },
                success: function (data) {
                    Swal.fire(
                        '삭제 완료',
                        '삭제되었습니다.',
                        'success'
                    ).then((result) => {
                        if (result.isConfirmed) {
                            location.href = box_link;
                        }
                    })
                }
            })
        }
    })

}); // deleteBtn

    // QR코드 생성
    const qrBtn = document.querySelector(".qr-btn");

    qrBtn.addEventListener("click", function (e) {
        e.preventDefault();

        Swal.fire({
            title: 'QR코드를 생성하시겠습니까?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085D6',
            cancelButtonColor: '#DD3333',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {

                let data = {
                    product_no: `${product_no}`,
                    box_no: `${box_no}`
                }


                fetch('/product/qrcode', {
                    method: 'POST',
                    body: JSON.stringify(data),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(function (response) {
                    console.log(response);
                    if (response.status === 200) {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: '저장되었습니다',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    } else {
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            title: '다시 시도해주세요',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }
                });

                Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                )
            }
        })
    })



