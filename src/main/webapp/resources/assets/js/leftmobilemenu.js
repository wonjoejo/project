$(function(){
	$("label.mobile_menu").click(function(){
		$("#main_nav").removeClass("active");
	});
	
	$('.hambuger').click(function(){
		$(this).toggleClass('check');
	});
});

