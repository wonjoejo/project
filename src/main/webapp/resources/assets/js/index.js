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

// fadein효과 

$(document).ready(function(){
	$(window).scroll(function(){
		$('.fadeinleft').each(function(i){
			
			var bottom_of_element = $(this).offset().top + $(this).outerHeight();
			var bottom_of_window = $(window).scrollTop() + $(window).height();
			
			if(bottom_of_window > bottom_of_element){
				$(this).animate({'opacity':'1','margin-left':'0px'},1000);
			}			
		});
	});
});

$(document).ready(function(){
	$(window).scroll(function(){
		$('.fadeinright').each(function(i){
			
			var bottom_of_element = $(this).offset().top + $(this).outerHeight();
			var bottom_of_window = $(window).scrollTop() + $(window).height();
			
			if(bottom_of_window > bottom_of_element){
				$(this).animate({'opacity':'1','margin-right':'0px'},2000);
			}			
		});
	});
});

$(document).ready(function(){
	$(window).scroll(function(){
		$('.fadeinleft2').each(function(i){
			
			var bottom_of_element = $(this).offset().top + $(this).outerHeight();
			var bottom_of_window = $(window).scrollTop() + $(window).height();
			
			if(bottom_of_window > bottom_of_element){
				$(this).animate({'opacity':'1','margin-left':'0px'},3000);
			}			
		});
	});
});

// 인투박스 사용방법 tabbar 

$(function(){
	$("#tabbar > .title > h3").click(function(){
		var index=$(this).index();
		$("#tabbar > .title > h3").removeClass("active");
		$(this).addClass("active");

		$("#tabbar > .description > div").removeClass("active");
		$("#tabbar > .description > div").eq(index).addClass("active");
	});
});

