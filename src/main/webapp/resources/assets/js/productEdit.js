// insert img
let file = document.querySelector("#box-photo");

file.addEventListener("change",function (f) {

	let reader = new FileReader();
	let input = f.target;

	reader.onload = function (e) {

		let dataUrl = reader.result;
		const productPhoto = document.querySelector(".product-photo");

		if(productPhoto!=null) {
			productPhoto.style.backgroundImage = "url(" + dataUrl + ")";
		} else {
			productPhotoEdit.style.backgroundImage = "url(" + dataUrl + ")";
		}
	}
	reader.readAsDataURL(input.files[0]);
});

let images = document.querySelectorAll(".default-img");
let productPhoto = document.querySelector(".product-photo");
let productPhotoEdit = document.querySelector(".product-photo-edit");
let defaultInput = document.querySelector("#default");

images.forEach(function (item,number) {

	item.addEventListener("click",function () {
		if(productPhoto!=null) {
			productPhoto.style.backgroundImage = "url(" + this.src + ")";
		} else {
			productPhotoEdit.style.backgroundImage = "url(" + this.src + ")";
		}

		let result = this.src.split("default/");
		defaultInput.setAttribute("value", result[1]);
	});

});

$('.datePicker').each(function () {
	$(this).datepicker({
		format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		autoclose: true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		disableTouchKeyboard: false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		immediateUpdates: true,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
		multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
		multidateSeparator: ", ", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		templates: {
			leftArrow: '&laquo;',
			rightArrow: '&raquo;'
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
		showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
		todayHighlight: true,	//오늘 날짜에 하이라이팅 기능 기본값 :false
		toggleActive: true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
		language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	});//datepicker end
});




