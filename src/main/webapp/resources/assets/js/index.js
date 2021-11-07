document.addEventListener('scroll',function (){
   const currentScrollValue = document.documentElement.scrollTop; // 스크롤 위치
    console.log(currentScrollValue);

    const headerwrap = document.getElementById("headerwrap");
    const joinbtn = document.querySelector(".join-btn");
    const loginbtn = document.querySelector(".login-btn");

    if(currentScrollValue > 0) {
        headerwrap.classList.add('nav-shadow');
    } else {
        headerwrap.classList.remove('nav-shadow');
    }

});
