let file = document.querySelector("#box-photo");

file.addEventListener("change",function (f) {
	console.log("file has changed");
	let reader = new FileReader();
	let input = f.target;
	console.log(reader);
	reader.onload = function (e) {
		let dataUrl = reader.result;
		console.log(e.target.result);

		document.querySelector(".product-photo").style.backgroundImage =
		"url(" + dataUrl + ")";

		// css({
		// 	"background": "url(" + dataUrl + ")",
		// 	'background-repeat': 'no-repeat',
		// 	'background-position': 'center center',
		// 	'background-size': 'cover'
		// });
	}
	reader.readAsDataURL(input.files[0]);
});

