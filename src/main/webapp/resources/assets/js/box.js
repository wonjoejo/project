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




// const photos = document.querySelector(".photos");
// const prevBtn = document.querySelector(".prev");
// const nextBtn = document.querySelector(".next");
//
// (function addEvent(){
// 	prevBtn.addEventListener('click', translatePhotos.bind(this, 1));
// 	nextBtn.addEventListener('click', translatePhotos.bind(this, -1));
// })();
//
// function translatePhotos(direction){
// 	const selectedBtn = (direction === 1) ? 'prev' : 'next';
// 	photos.style.transitionDuration = '100ms';
// 	photos.style.transform = `translateX(${direction * (100 / 5)}%)`;
// 	photos.ontransitionend = () => reorganizeEl(selectedBtn);
// }
//
// function reorganizeEl(selectedBtn) {
// 	photos.removeAttribute('style');
// 	(selectedBtn === 'prev') ? photos.insertBefore(photos.lastElementChild, photos.firstElementChild): photos.appendChild(photos.firstElementChild);
// }

