// editview
// 그룹 회원 권한 수정

const checked = document.querySelectorAll(".checked");

checked.forEach(function (item) {
	item.addEventListener("change", function () {
		if (item.value === "0") {
			item.value = "1";
			item.nextElementSibling.disabled = false;
		} else {
			item.value = "0";
			item.nextElementSibling.disabled = true;
		}
	})
})


//설정 저장하기
const submit = document.querySelector(".submit-permit");

submit.addEventListener("click", function (e) {
	e.preventDefault();

	let objectArray = [];

	for (let i = 0; i < document.forms.length; i++) {
		const formData = new FormData(document.forms[i]);
		let object = {};
		formData.forEach(function (value, key) {
			object[key] = value;
		});
		objectArray[objectArray.length] = object;
	}

	// fetch 비동기 처리
	fetch('/group/edit', {
		method: 'POST',
		body: JSON.stringify(objectArray),
		headers: {
			'Content-Type': 'application/json'
		}
	}).then(function (response) {
		console.log(response);
		if(response.status===200) {
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
});

// 그룹 양도
const masterBtn = document.querySelector(".master-btn");
console.log(boxNo);

masterBtn.addEventListener("click",function (e) {
	e.preventDefault();
	Swal.fire({
		title: '양도할 회원의 ID를 입력해 주세요',
		input: 'text',
		inputAutoTrim: 'true',
		inputAttributes: {
			autocapitalize: 'off'
		},
		showCancelButton: true,
		confirmButtonText: '제출',
		cancelButtonText: '취소',
		inputValidator: (keyword) => {
			return new Promise((resolve) => {
				fetch(`/group/find?keyword=${keyword}`)
					.then(response => {
						if (!response.ok) {
							throw new Error(response.statusText)
						}
						return response.json();
					})
					.catch(error => {
						Swal.showValidationMessage(
							`Request failed: ${error}`
						)
					})
					.then(data => {
						if (keyword === data) {
							fetch(`/group/master?member_id=${data}&box_no=${boxNo}`)
								.then(response2 => {
									if (!response2.ok) {
										throw new Error(response2.statusText)
									}
									return response2.json();
								})
								.then(data2 => {
									console.log(data2);
								if(data2===false) {
									resolve('일치 하는 회원이 없습니다')
								} else {
									Swal.fire({
										position: 'center',
										icon: 'success',
										title: `${data}님께 마스터 권한이 양도 되었습니다`,
										showConfirmButton: false,
										timer: 1500
									})
									resolve()
									location.href = `permissionlist?box_no=${boxNo}`;
								}
								})
						} else {
							resolve('일치 하는 회원이 없습니다')
						}
					})
			})
		}
	})
});
