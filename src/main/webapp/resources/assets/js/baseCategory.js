// 추가
const addBtn = document.querySelectorAll('.add-btn');
addBtn.forEach(function (item) {
    item.addEventListener("click", function (e) {
        e.preventDefault();

        item.parentElement.previousElementSibling.disabled = false;
        item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
        item.style.display = "none";
        item.previousElementSibling.style.display = "inline-block";
        item.previousElementSibling.previousElementSibling.style.display = "inline-block";
    }); // addEventListener

}); // addBtn forEach

// const noNameAddBtn = document.querySelectorAll('.no-name-add-btn');
// noNameAddBtn.forEach(function (item, index) {
//     item.addEventListener("click", function (e) {
//         e.preventDefault();
//         console.log(item.nextElementSibling.nextElementSibling);
//         console.log(item.parentElement.previousElementSibling);
//
//         item.parentElement.previousElementSibling.disabled = false;
//         item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
//         item.style.display = "none";
//         item.nextElementSibling.style.display = "inline-block";
//         item.nextElementSibling.nextElementSibling.style.display = "inline-block";
//     }); // addEventListener
// }); // noNameAddBtn forEach

// 완료
const modifyBtn = document.querySelectorAll(".modify-btn");
modifyBtn.forEach(function (item, index) {
    item.addEventListener("click", function (e) {
        e.preventDefault();

        console.log(item.parentElement.previousElementSibling);
        console.log(item.previousElementSibling.previousElementSibling);

        let data = {
            category_no: document.querySelector("#category-no").value,
            box_no: document.querySelector("#box-no").value,
            cate_name1: document.querySelector("#cate_name1").value,
            cate_name2: document.querySelector("#cate_name2").value,
            cate_name3: document.querySelector("#cate_name3").value,
            cate_name4: document.querySelector("#cate_name4").value,
            cate_name5: document.querySelector("#cate_name5").value
        };

        console.log(data);

        if (item.parentElement.previousElementSibling.value === "") {

            Swal.fire({
                text: '카테고리명을 입력해주세요',
                icon: 'warning'
            });

        } else {
            fetch('/category/edit', {
                method: 'POST',
                body: JSON.stringify(data),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {
                if (response) {
                    item.parentElement.previousElementSibling.disabled = true;
                    item.parentElement.previousElementSibling.style.border = "none"

                    item.style.display = "none";
                    item.nextElementSibling.style.display = "none";
                    item.previousElementSibling.style.display = "inline-block";
                    item.previousElementSibling.previousElementSibling.style.display = "inline-block";

                } else {
                    console.log(response.status);
                }
            }); // fetch
        } // if-else

    }); // addEventListener click
}); // modifyBtn forEach

// const noNameModifyBtn = document.querySelectorAll(".no-name-modify-btn");
// noNameModifyBtn.forEach(function (item, index) {
//     item.addEventListener("click", function (e) {
//         e.preventDefault();
//
//         console.log(item.parentElement.previousElementSibling.previousElementSibling);
//         console.log(item.previousElementSibling.previousElementSibling);
//
//         let data = {
//             category_no: document.querySelector("#category-no").value,
//             box_no: document.querySelector("#box-no").value,
//             cate_name1: document.querySelector("#cate_name1").value,
//             cate_name2: document.querySelector("#cate_name2").value,
//             cate_name3: document.querySelector("#cate_name3").value,
//             cate_name4: document.querySelector("#cate_name4").value,
//             cate_name5: document.querySelector("#cate_name5").value
//         };
//
//         if (item.parentElement.previousElementSibling.value == "") {
//             alert("값을 입력하세요");
//         } else {
//             fetch('/category/edit', {
//                 method: 'POST',
//                 body: JSON.stringify(data),
//                 headers: {
//                     'Content-Type': 'application/json'
//                 }
//             }).then(function (response) {
//                 if (response) {
//                     item.parentElement.previousElementSibling.disabled = true;
//                     item.parentElement.previousElementSibling.style.border = "none"
//
//                     item.style.display = "none";
//                     item.nextElementSibling.style.display = "none";
//                     item.nextElementSibling.nextElementSibling.style.display = "inline-block";
//                     item.nextElementSibling.nextElementSibling.nextElementSibling.style.display = "inline-block";
//
//                 } else {
//                     console.log(response.status);
//                 }
//             }); // fetch
//         } // if-else
//
//     }); // addModifyBtn click
// }); // addModifyBtn forEach

// 수정
// const noNameEditBtn = document.querySelectorAll(".no-name-edit-btn");
// noNameEditBtn.forEach(function (item, index) {
//     item.addEventListener("click", function (e) {
//         e.preventDefault();
//         console.log(item.parentElement.previousElementSibling);
//         console.log(item.nextElementSibling);
//
//         item.parentElement.previousElementSibling.disabled = false;
//         item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
//         item.style.display = "none";
//         item.nextElementSibling.style.display = "none";
//         item.previousElementSibling.style.display = "inline-block";
//         item.previousElementSibling.previousElementSibling.style.display = "inline-block";
//     }); // addEventListener
// }); // noNameEditBtn forEach


const editBtn = document.querySelectorAll(".edit-btn");
editBtn.forEach(function (item, index) {
    item.addEventListener("click", function (e) {
        e.preventDefault();
        console.log(item.parentElement.previousElementSibling);
        console.log(item.nextElementSibling);

        item.parentElement.previousElementSibling.disabled = false;
        item.parentElement.previousElementSibling.style.border = "1px solid #ADADAD";
        item.style.display = "none";
        item.nextElementSibling.style.display = "none";
        item.nextElementSibling.nextElementSibling.style.display = "inline-block";
        item.nextElementSibling.nextElementSibling.nextElementSibling.style.display = "inline-block";
    }); // addEventListener
}); // editBtn forEach


// ============= 비동기로 바꿔야함..
// 수정 취소
const modifyCancelBtn = document.querySelectorAll(".modify-cancel-btn");
modifyCancelBtn.forEach(function (item, idex) {
    item.addEventListener("click", function (e) {
        e.preventDefault();

        $.ajax({
            url: "/category/detailList",
            method: "GET",
            data: {
                box_no: box_no
            },
            success: function (data) {

                if (item.classList.contains('modify-cancel-btn1')) {
                    document.querySelector('#cate_name1').value = data.cate_name1;
                } else if (item.classList.contains('modify-cancel-btn2')) {
                    document.querySelector('#cate_name2').value = data.cate_name2;
                } else if (item.classList.contains('modify-cancel-btn3')) {
                    document.querySelector('#cate_name3').value = data.cate_name3;
                } else if (item.classList.contains('modify-cancel-btn4')) {
                    document.querySelector('#cate_name4').value = data.cate_name4;
                } else if (item.classList.contains('modify-cancel-btn5')) {
                    document.querySelector('#cate_name5').value = data.cate_name5;
                } // else-if


                item.parentElement.previousElementSibling.disabled = true;
                item.parentElement.previousElementSibling.style.border = "none";

                if (item.classList.contains('no-name-modify-cancel-btn')) {
                    item.style.display = "none";
                    item.previousElementSibling.style.display = "none";
                    item.nextElementSibling.style.display = "inline-block";

                } else {
                    item.style.display = "none";
                    item.previousElementSibling.style.display = "none";
                    item.previousElementSibling.previousElementSibling.style.display = "inline-block";
                    item.previousElementSibling.previousElementSibling.previousElementSibling.style.display = "inline-block";

                }

            }
        });

    }); // addEventListener
}); // modifyCancelBtn forEach

// const noNameModifyCancelBtn = document.querySelectorAll(".no-name-modify-cancel-btn");
// noNameModifyCancelBtn.forEach(function (item) {
//     item.addEventListener("click", function (e) {
//         e.preventDefault();
//
//         item.parentElement.previousElementSibling.disabled = true;
//         item.parentElement.previousElementSibling.style.border = "none";
//         item.parentElement.previousElementSibling.value = "";
//
//         console.log(item);
//         item.style.display = "none";
//         item.previousElementSibling.style.display = "none";
//         item.previousElementSibling.previousElementSibling.style.display = "none";
//         item.previousElementSibling.previousElementSibling.previousElementSibling.style.display = "none";
//         item.nextElementSibling.style.display = "inline-block";
//
//     }); // addEventListener
// }); // noNameModifyCancelBtn forEach

// 삭제
const deleteBtn = document.querySelectorAll(".del-btn");
deleteBtn.forEach(function (item, index) {
    item.addEventListener("click", function (e) {
        e.preventDefault();
        console.log(item.parentElement.previousElementSibling);
        console.log(item.parentNode);

        Swal.fire({
            title: '삭제하시겠습니까?',
            text: "해당 카테고리의 상세 카테고리 정보들이 초기화됩니다.",
            icon: 'warning',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '삭제',
            showLoaderOnConfirm: true,
            cancelButtonText: '취소',
            preConfirm: function () {
                return new Promise(function (resolve) {

                    // 삭제 눌렀을 때 -> 클릭한 base category의 이름을 null로 바꿔줌
                    item.parentElement.previousElementSibling.value = "";

                    // del-btn 몇인지 -> length에서 -1해줘서 불러옴
                    const selectedNum = item.classList[2].charAt(item.classList[2].length - 1);
                    console.log(document.getElementById('cate_name1').value);

                    // fetch
                    const data = {
                        category_no: document.querySelector("#category-no").value,
                        box_no: document.querySelector("#box-no").value,
                        cate_name1: document.querySelector("#cate_name1").value,
                        cate_name2: document.querySelector("#cate_name2").value,
                        cate_name3: document.querySelector("#cate_name3").value,
                        cate_name4: document.querySelector("#cate_name4").value,
                        cate_name5: document.querySelector("#cate_name5").value,
                        selectedNum: selectedNum
                    };

                    console.log(data);

                    // cate_name
                    fetch('/category/deleteCategory', {
                        method: 'POST',
                        body: JSON.stringify(data),
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                        .then(function (response) {
                            if (response) {
                                Swal.fire('삭제되었습니다.', '', 'success');

                                item.style.display = "none";
                                item.previousElementSibling.style.display = "none";
                                item.nextElementSibling.nextElementSibling.nextElementSibling.style.display = "inline-block";
                            } else {
                                Swal.fire('삭제되지않았습니다.', '다시 한 번 시도해주세요.', 'error');
                                console.log(response.status);
                            }
                        })
                        .catch(function (error) {
                            Swal.fire('삭제되지않았습니다.', '다시 한 번 시도해주세요.', 'error');
                            console.log(error.status);
                        }); // fetch
                });
            },
            allowOutsideClick: false
        });


    }); // click
}); // deleteBtn

// const noNameDelBtn = document.querySelectorAll(".no-name-del-btn");
// noNameDelBtn.forEach(function (item) {
//     item.addEventListener("click", function (e) {
//         e.preventDefault();
//
//         item.parentElement.previousElementSibling.value = "";
//
//         if (item.classList.contains('no-del-btn1')) {
//             document.querySelector('#cate-detail1').value = "";
//         } else if (item.classList.contains('no-del-btn2')) {
//             document.querySelector('#cate-detail2').value = "";
//         } else if (item.classList.contains('no-del-btn3')) {
//             document.querySelector('#cate-detail3').value = "";
//         } else if (item.classList.contains('no-del-btn5')) {
//             document.querySelector('#cate-detail4').value = "";
//         } else if (item.classList.contains('no-del-btn5')) {
//             document.querySelector('#cate-detail5').value = "";
//         }
//
//         // fetch
//         // cate_name
//         fetch('/category/edit', {
//             method: 'POST',
//             body: JSON.stringify(data),
//             headers: {
//                 'Content-Type': 'application/json'
//             }
//         }).then(function (response) {
//             if (response) {
//                 item.style.display = "none";
//                 item.previousElementSibling.style.display = "none";
//                 item.nextElementSibling.nextElementSibling.nextElementSibling.style.display="inline-block";
//             } else {
//                 console.log(response.status);
//             }
//         }); // fetch
//
//         // cate_detail
//         fetch('/category/deleteCategory', {
//             method: 'POST',
//             body: JSON.stringify(data2),
//             headers: {
//                 'Content-Type': 'application/json'
//             }
//         }).then(function (response) {
//             if (response) {
//                 item.style.display = "none";
//                 item.previousElementSibling.style.display = "none";
//                 item.nextElementSibling.nextElementSibling.nextElementSibling.style.display="inline-block";
//             } else {
//                 console.log(response.status);
//             }
//         }); // fetch
//
//
//     }); // click
// }); // noNameDelBtn


// SweetAlert















