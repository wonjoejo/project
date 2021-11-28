let file = document.querySelector("#box-photo");

file.addEventListener("change",function (f) {

	let reader = new FileReader();
	let input = f.target;

	reader.onload = function (e) {

		let dataUrl = reader.result;
		console.log(dataUrl);
		const productPhoto = document.querySelector(".product-photo");

		if(productPhoto!=null) {
			productPhoto.style.backgroundImage = "url(" + dataUrl + ")";
		} else {
			productPhotoEdit.style.backgroundImage = "url(" + dataUrl + ")";
		}
	}
	reader.readAsDataURL(input.files[0]);
});

let images = document.querySelectorAll(".default-img");
let productPhoto = document.querySelector(".product-photo");
let productPhotoEdit = document.querySelector(".product-photo-edit");
let defaultName = document.querySelector("#default-name");
let defaultPath = document.querySelector("#default-path");


images.forEach(function (item, number) {

	item.addEventListener("click", function () {
		if (productPhoto != null) {
			productPhoto.style.backgroundImage = "url(" + this.src + ")";
		} else {
			productPhotoEdit.style.backgroundImage = "url(" + this.src + ")";
		}

		console.log(this.src);

		let result = this.src.split("default/");
		defaultPath.setAttribute("value", "default/")
		defaultName.setAttribute("value", result[1]);
	});

});

// box edit 시 원래 이미지 불러오는 함수!
if (productPhotoEdit != null) {
	console.log(photoName);
	console.log(photoPath);
	productPhotoEdit.style.backgroundImage = "url('https://intobox.s3.ap-northeast-2.amazonaws.com/" + photoPath + photoName + "')";
}


// Swal.fire({
// 	position: 'top-end',
// 	icon: 'success',
// 	title: 'Your work has been saved',
// 	showConfirmButton: false,
// 	timer: 1500
// })


