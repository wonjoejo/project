let file = document.querySelector("#box-photo");

if (file != null) {
	file.addEventListener("change", function (f) {

		let reader = new FileReader();
		let input = f.target;

		reader.onload = function (e) {

			let dataUrl = reader.result;
			console.log(dataUrl);
			const productPhoto = document.querySelector(".product-photo");

			if (productPhoto != null) {
				productPhoto.style.backgroundImage = "url(" + dataUrl + ")";
			} else {
				productPhotoEdit.style.backgroundImage = "url(" + dataUrl + ")";
			}
		}
		reader.readAsDataURL(input.files[0]);
	});
}


// 클릭할 때 마다 default 이미지
let images = document.querySelectorAll(".default-img");
let productPhoto = document.querySelector(".product-photo");
let productPhotoEdit = document.querySelector(".product-photo-edit");
let defaultName = document.querySelector("#default-name");
let defaultPath = document.querySelector("#default-path");

if (images != null) {
	images.forEach(function (item, number) {

		item.addEventListener("click", function () {
			if (productPhoto != null) {
				// 클릭한 객체의 src를 가져온다 this.src
				productPhoto.style.backgroundImage = "url(" + this.src + ")";
			} else {
				productPhotoEdit.style.backgroundImage = "url(" + this.src + ")";
			}

			console.log(this.src);

			// default 기준으로 나누기
			let result = this.src.split("default/");
			console.log(result);

			// path는 default로 -> 커스텀 이미지 넣을까봐 다시
			defaultPath.setAttribute("value", "default/")
			// result 배열의 첫번째를 가져오기
			defaultName.setAttribute("value", result[1]);
		});

	});
}


// box edit 시 원래 이미지 불러오는 함수!
if (productPhotoEdit != null) {
	console.log(photoName);
	console.log(photoPath);
	productPhotoEdit.style.backgroundImage = "url('https://intobox.s3.ap-northeast-2.amazonaws.com/" + photoPath + photoName + "')";
}

// 박스 삭제
const deleteBtn = document.querySelector(".delete-btn");

if (deleteBtn != null) {
	deleteBtn.addEventListener("click", function (e) {
		console.log("click!");
		e.preventDefault();
		Swal.fire({
			title: '정말 삭제하시겠습니까?',
			text: "한 번 삭제된 박스는 복구가 불가능합니다.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#5A95F5',
			cancelButtonColor: '#DD3333',
			confirmButtonText: '삭제',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				console.log("box_no확인: " + box_no);
				$.ajax({
					type: "POST",
					url: "/box/delete",
					data: {
						"box_no": box_no,
						"member_id": member_id
					},
					success: function (data) {
						Swal.fire(
							'삭제 완료',
							'박스가 삭제되었습니다.',
							'success'
						).then((result) => {
							if (result.isConfirmed) {
								location.href = "/box/list?member_id=" + member_id;
							}
						})
					}
				})
			}
		})
	})
}


