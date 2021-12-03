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

	console.log(objectArray);

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


//회원 추방
const outBtn = document.querySelectorAll('.groupout');

outBtn.forEach(function (item) {
			item.addEventListener('click', function (e) {
				e.preventDefault();
				
				let member_id = item.getAttribute("id"); //member_id를 가져온다
				console.log(member_id);
				
				let data = {
					member_id: member_id,
					box_no: boxNo
				};
				
				Swal.fire({
					title: `${member_id}님을 그룹에서 내보내시겠습니까?`,
					text: "강퇴된 회원은 박스를 볼 수 없습니다.",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085D6',
					cancelButtonColor: '#DD3333',
					confirmButtonText: '추방',
					cancelButtonText: '취소'
				}).then((result) => {
						if (result.isConfirmed) {
									fetch(`/group/groupout`, {
										method: 'POST',
										body: JSON.stringify(data), 
										headers: {
											'Content-Type': 'application/json'
										},
										redirect: 'follow'
									}).then(function (response) {
										if (response.ok) {
											// response가 ok인지, error인지 판별
											return response.json();
										} 
					
										
									}).then(function (data) {
										console.log(data);
										if(data==="/box/list") {
											location.href = `${data}?member_id=${memberId}`;
										} else {
											location.href = `${data}?box_no=${boxNo}&member_id=${memberId}`;
										}
										
										// 요 안에서 return data 가지고 가공
									})
					
					
						}
					})
					
					
			})


			
})


