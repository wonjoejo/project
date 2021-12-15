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
		console.log(item);
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
} else if (window.location.pathname.indexOf('qna') !== -1) {
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
		text: '참여할 박스의 초대 코드를 입력해 주세요 (4자리)',
		input: 'text',
		inputAutoTrim: 'true',
		inputAttributes: {
			autocapitalize: 'off'
		},
		showCancelButton: true,
		confirmButtonText: '제출',
		cancelButtonText: '취소',

		inputValidator: (box_no) => { // 비동기로 validate 한 번 확인
      // input 이 맞았는지 틀렸는지 한번 걸러줌
			return new Promise((resolve) => {
        // promise -> fetch 랑 같이 자주 씀
				fetch(`/box/check?box_no=${box_no}&member_id=${memberId}`) // check checkId로 보냈다가 그 리턴값을 받아오는 것
					.then(response => { // then을 2번 해야 fetch가 데이터 받아올 수 있음
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
						// 여기 data가 true or false
						// json 객체
						const bodyData = {
							box_no: box_no,
							member_id: memberId // 로그인한 id
						}
						if (data === true) {
							fetch(`/box/join`, {
								method: 'POST',
								body: JSON.stringify(bodyData) // body에 string 밖에 못 들어가니까
							})
								.then(response2 => {
									console.log(response2);
									if (!response2.ok) {
										throw new Error(response2.statusText)
									}
								})
								.then(data2 => {
									console.log(data2);
									// /box/list or false
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
										location.href = `/box/list?member_id=${memberId}`; // redirect 대신
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


