let menus = document.querySelectorAll(".menu-item");
const list = document.querySelector(".boxlist");
const create = document.querySelector(".createview");
const qna = document.querySelector(".qnaboard");


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

if(window.location.pathname.indexOf('list')!==-1) {
	list.classList.remove("inactive");
	list.classList.add("active");
} else if (window.location.pathname.indexOf('create')!==-1) {
	create.classList.remove("inactive");
	create.classList.add("active");
} else if (window.location.pathname.indexOf('board')!==-1) {
	qna.classList.remove("inactive");
	qna.classList.add("active");
}





