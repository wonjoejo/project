
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
            text: "${product.product_memo}"
        });
    });





// 카카오 공유하기
Kakao.init('bf8980d064e0888e1bf9f6692ff4951f'); // 초기화

let detailList = [];
if ('${category.cate_detail1}' != ""){
    detailList.push('#${category.cate_detail1}');
}
if ('${category.cate_detail2}' != ""){
    detailList.push('#${category.cate_detail2}');
}
if ('${category.cate_detail3}' != ""){
    detailList.push('#${category.cate_detail3}');
}
if ('${category.cate_detail4}' != ""){
    detailList.push('#${category.cate_detail4}');
}
if ('${category.cate_detail5}' != ""){
    detailList.push('#${category.cate_detail5}');
}


console.log(detailList);

function sendLink() {
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: '${product.product_name}',
            description: detailList.toString(),
            imageUrl:
                'https://intobox.s3.ap-northeast-2.amazonaws.com/${product.product_photo_path}${product.product_photo_name}',
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


