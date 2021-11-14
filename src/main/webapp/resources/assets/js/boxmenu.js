let menus = document.querySelectorAll(".menu-item");

menus.forEach(function(item,index){
	item.addEventListener("click",function(){
		item.classList.add("active");
	});
});
