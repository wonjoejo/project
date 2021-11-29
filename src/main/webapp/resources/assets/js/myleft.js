let menus = document.querySelectorAll(".menu-item");
const myPage = document.querySelector(".mypage");
const boxList = document.querySelector(".boxlist");
const qnaBoard = document.querySelector(".qnaboard");


console.log(window.location.pathname);

menus.forEach(function(item,index){
	console.log(item);

	item.classList.remove("active");
	item.classList.add("inactive");

	item.addEventListener("click",function(){
		item.classList.remove("inactive");
		item.classList.add("active");
	});
});


if (window.location.pathname.indexOf('myPage') !== -1) {
	myPage.classList.remove("inactive");
	myPage.classList.add("active");
} else if (window.location.pathname.indexOf('box') !== -1) {
	boxList.classList.remove("inactive");
	boxList.classList.add("active");
} else if (window.location.pathname.indexOf('board') !== -1) {
	qnaBoard.classList.remove("inactive");
	qnaBoard.classList.add("active");
}
