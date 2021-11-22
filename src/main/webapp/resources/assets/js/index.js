document.addEventListener('scroll',function (){
    const headerwrap = document.getElementById("headerwrap");
    const joinbtn = document.querySelector(".join-btn");
    const loginbtn = document.querySelector(".login-btn");

    window.addEventListener('scroll', function (){
        console.log(window.scrollY);

        if (window.scrollY > 0) {
            headerwrap.classList.add('nav-shadow');
        } else {
            headerwrap.classList.remove('nav-shadow');
        }
    });

});
