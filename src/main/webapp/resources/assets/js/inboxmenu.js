let menus = document.querySelectorAll(".menu-item");
const myBox = document.querySelector(".mybox");
const productList = document.querySelector(".productlist");
const category = document.querySelector(".category");
const group = document.querySelector(".groupmenu");
const chart = document.querySelector(".chart");


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


if (window.location.pathname.indexOf('box/detail') !== -1) {
	myBox.classList.remove("inactive");
	myBox.classList.add("active");
} else if (window.location.pathname.indexOf('product') !== -1) {
	productList.classList.remove("inactive");
	productList.classList.add("active");
} else if (window.location.pathname.indexOf('category/detail') !== -1) {
	category.classList.remove("inactive");
	category.classList.add("active");
} else if (window.location.pathname.indexOf('group') !== -1) {
	group.classList.remove("inactive");
	group.classList.add("active");
} else if (window.location.pathname.indexOf('chart/get') !== -1) {
	chart.classList.remove("inactive");
	chart.classList.add("active");
}
