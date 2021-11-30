const groupPermission = document.querySelector("#grouppermission");
const permissionBtn = document.querySelector("#permissionBtn");


//권한 보기 페이지로 이동
if (groupPermission != null) {
	groupPermission.addEventListener('click', function (e) {
		e.preventDefault();
		location.href = ctx + "/group/permissionlist?box_no=" + boxNo;
	})
}

//권한 설정 페이지로 이동
if (permissionBtn != null) {
	permissionBtn.addEventListener('click', function (e) {
		e.preventDefault();
		location.href = ctx + "/group/editview?box_no=" + boxNo;
	})
}

// 초대
$("#groupcode").click(function () {
	Swal.fire({
		title: '박스 초대 번호',
		html:
			`<input id="invite" type="text" data-clipboard-text="${boxNo}" 
			value="${boxNo}" readonly><br>
			<button id="copy" class="copy-btn" data-clipboard-target="#invite">
			<i class="fas fa-paste"></i> 복사</button>`,
		showConfirmButton: false,
		showCloseButton: true,
		footer: '위 번호를 복사하여 참여란에 붙여넣기 해 주세요'
	})

	copyClipBoard();
});


function copyClipBoard() {
	const copyBtn = document.querySelector('.copy-btn');
	const clipBoard = new ClipboardJS(copyBtn);
	clipBoard.on('success', function (e) {
		console.log(e);

	})
}

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

