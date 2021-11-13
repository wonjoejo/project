let file = document.querySelector("#box-photo");

file.addEventListener("change",function (f) {

	let reader = new FileReader();
	let input = f.target;

	reader.onload = function (e) {

		let dataUrl = reader.result;
		const productPhoto = document.querySelector(".product-photo");

		productPhoto.style.backgroundImage = "url(" + dataUrl + ")";

	}

	reader.readAsDataURL(input.files[0]);

});

let images = document.querySelectorAll(".default-img");
let productPhoto = document.querySelector(".product-photo");
let defaultInput = document.querySelector("#default");

images.forEach(function (item,number) {

	item.addEventListener("click",function () {
		productPhoto.style.backgroundImage = "url(" + this.src + ")";
		let result = this.src.split("img/");
		defaultInput.setAttribute("value",result[1]);
	});

});
