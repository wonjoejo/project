//권한 설정페이지로 이동
$("#grouppermission").click(function () {
	location.href = ctx + "/group/permissionlist?box_no=" + boxNo;
});

// 초대
$("#groupcode").click(function () {
	Swal.fire(`초대번호는 ${boxNo}`)
});

//그룹 탈퇴

const deletebtn = document.querySelector('.deletegroup');
deletebtn.addEventListener("click", function (e) {
	e.preventDefault();

	console.log(loginId);
	console.log(boxNo);

	let data = {
		member_id: loginId, // 로그인한 아이디
		box_no: boxNo // 현재 박스 번호
	};

	Swal.fire({
		title: '해당 그룹에서 탈퇴하시겠습니까?',
		text: "탈퇴하시는 경우 박스 또한 리스트에서 사라집니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085D6',
		cancelButtonColor: '#DD3333',
		confirmButtonText: 'YES'
	}).then((result) => {
		if (result.isConfirmed) {
			fetch(`/group/groupout`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(data) // memberId와 boxNo


			}).then(function (response) {
				if (response.ok) {
					console.log(response.ok);
					return response.json();
				}
			}).then(function (data) {

				console.log(data);

				if (data === "/box/list") {
					location.href = '/box/list?member_id=' + loginId;
				} else {
					Swal.fire(
						'실패!'
					)
				}
			})
		}
	})
})

