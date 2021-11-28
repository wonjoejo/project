let menus = document.querySelectorAll(".menu-item");
const list = document.querySelector(".boxlist");
const create = document.querySelector(".createview");
const qna = document.querySelector(".qnaboard");


console.log(window.location.pathname);

menus.forEach(function(item,index){
	console.log(item);

	item.classList.remove("active");
	item.classList.add("inactive");

	item.addEventListener("click",function(){
		item.classList.remove("inactive");
		item.classList.add("active");
	});
});


if(window.location.pathname.indexOf('list')!==-1) {
	list.classList.remove("inactive");
	list.classList.add("active");
} else if (window.location.pathname.indexOf('create') !== -1) {
	create.classList.remove("inactive");
	create.classList.add("active");
} else if (window.location.pathname.indexOf('board') !== -1) {
	qna.classList.remove("inactive");
	qna.classList.add("active");
}

// const joinGroupBtn = document.querySelector(".joingroup");
//
// joinGroupBtn.addEventListener("click", function (e) {
// 	e.preventDefault();
// 	Swal.fire({
// 		title: '참여할 박스의 코드를 입력해 주세요(숫자 4~5자리)',
// 		input: 'text',
// 		inputAutoTrim: 'true',
// 		inputAttributes: {
// 			autocapitalize: 'off'
// 		},
// 		showCancelButton: true,
// 		confirmButtonText: '제출',
// 		cancelButtonText: '취소',
// 		inputValidator: (keyword) => {
// 			return new Promise((resolve) => {
// 				fetch(`/group/find?keyword=${keyword}`)
// 					.then(response => {
// 						if (!response.ok) {
// 							throw new Error(response.statusText)
// 						}
// 						return response.json();
// 					})
// 					.catch(error => {
// 						Swal.showValidationMessage(
// 							`Request failed: ${error}`
// 						)
// 					})
// 					.then(data => {
// 						if (keyword === data) {
// 							fetch(`/group/master?member_id=${data}&box_no=${boxNo}`)
// 								.then(response2 => {
// 									if (!response2.ok) {
// 										throw new Error(response2.statusText)
// 									}
// 									return response2.json();
// 								})
// 								.then(data2 => {
// 									console.log(data2);
// 									if (data2 === false) {
// 										resolve('일치 하는 회원이 없습니다')
// 									} else {
// 										Swal.fire({
// 											position: 'center',
// 											icon: 'success',
// 											title: `${data}님께 마스터 권한이 양도 되었습니다`,
// 											showConfirmButton: false,
// 											timer: 1500
// 										})
// 										resolve()
// 										location.href = `permissionlist?box_no=${boxNo}`;
// 									}
// 								})
// 						} else {
// 							resolve('일치 하는 회원이 없습니다')
// 						}
// 					})
// 			})
// 		}
//
// 	})
// })


