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

// 박스 참여
const joinGroupBtn = document.querySelector(".joingroup");

joinGroupBtn.addEventListener("click", function (e) {
	e.preventDefault();
	console.log("click");
	Swal.fire({
		title: '박스 참여',
		text: '참여할 박스의 초대 코드를 입력해 주세요(숫자 4자리)',
		input: 'text',
		inputAutoTrim: 'true',
		inputAttributes: {
			autocapitalize: 'off'
		},
		showCancelButton: true,
		confirmButtonText: '제출',
		cancelButtonText: '취소',
		inputValidator: (box_no) => {
			return new Promise((resolve) => {
				fetch(`/box/check?box_no=${box_no}&member_id=${memberId}`)
					.then(response => {
						if (!response.ok) {
							throw new Error(response.statusText)
						}
						return response.json();
					})
					.catch(error => {
						Swal.showValidationMessage(
							`해당하는 박스 번호가 없거나 이미 참여한 박스입니다`
						)
					})
					.then(data => {
						console.log(data);
						const bodyData = {
							box_no: box_no,
							member_id: memberId
						}
						if (data === true) {
							fetch(`/box/join`, {
								method: 'POST',
								body: JSON.stringify(bodyData)
							})
								.then(response2 => {
									console.log(response2);
									if (!response2.ok) {
										throw new Error(response2.statusText)
									}
								})
								.then(data2 => {
									console.log(data2);
									if (data2 === "false") {
										resolve('일치 하는 박스가 없습니다')
									} else {
										Swal.fire({
											position: 'center',
											icon: 'success',
											title: `${box_no}에 참여하였습니다`,
											showConfirmButton: false,
										})
										resolve()
										location.href = `/box/list?member_id=${memberId}`;
									}
								})
						} else {
							resolve('일치 하는 박스가 없습니다');
						}
					})
			})
		}

	})
})


