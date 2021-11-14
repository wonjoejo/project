let menus = document.querySelectorAll(".menu-item");

// menus.forEach()

menus.addEventListener('click', function (e){
    console.log(e.target);
});

console.log("연결");