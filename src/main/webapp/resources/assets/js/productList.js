
// page, buttons
// 물품 검색 (autocomplete)

	$.widget("ui.autocomplete", $.ui.autocomplete, {

		_renderMenu: function (ul, items) {
			const that = this;
			ul.attr("class", "nav nav-pills nav-stacked  bs-autocomplete-menu");
			$.each(items, function (index, item) {
				that._renderItemData(ul, item);
			});
		},

		_resizeMenu: function () {
			const ul = this.menu.element;
			ul.outerWidth(Math.min(
				// Firefox wraps long text (possibly a rounding bug)
				// so we add 1px to avoid the wrapping (#7513)
				ul.width("").outerWidth() + 1,
				this.element.outerWidth()
			));
		}

	});

let ajaxData = [];

$.ajax({
	url: "/product/json"
	, type: "GET"
	, data: {
		"box_no": boxNo
	},
	dataType: "json",
	success: function (data) {
		console.log(data);

		let newArr = new Set(data.filter(
			(element, i) => element != null));

		console.log(newArr);

		let dataArr = Array.from(newArr);

		$.map(dataArr, function (item) {
			// console.log(item);
			ajaxData.push({
				label: item,
				value: item,
				idx: item
			})
		})
		$('.search').autocomplete({
			source: function (request, response) {
				response(
					$.ui.autocomplete.filter(
						ajaxData, request.term.split(/,\s*/).pop()
					)
				)
			},
			open: function (event, ui) {
				$(this).autocomplete("widget").css({
					"width": 400,
					"border-radius": "20px",
					"color": "#4E4E4E"
				});
			},
			select: function (event, ui) {
				let terms = this.value.split(/,\s*/);
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push(ui.item.value);
				// // add placeholder to get the comma-and-space at the end
				// terms.push("");
				// this.value = terms.join(", ");

				const jsonData = {
					keyword: ui.item.value,
					box_no: boxNo
				}

				console.log(jsonData);

				fetch('search', {
					method: 'POST',
					body: JSON.stringify(jsonData),
					headers: {
						'Content-Type': 'application/json'
					}
				}).then(function (response) {
					console.log(response);
					if(response.status===200) {
						return response.json();
					} else {
					}
				})
					.then(data => {
						console.log(data);
					});

				return true;
			},
			focus: function (event, ui) {
				return false;
			},
			minLength: 1,
			autoFocus: true,
			classes: {
				'ui-autocomplete': 'highlight'
			},
			delay: 500,
			disable: false,
			position: {
				my: 'right top',
				at: 'right bottom'
			},
			close: function (e) {
				console.log(e);
			}
		});
	}
});

// 검색 버튼
const searchBtn = document.querySelector(".searchbtn");
const keyword = document.querySelector("#search").value;

// document.querySelector("#search").addEventListener("change",function () {
// 	console.log(keyword);
// })

searchBtn.addEventListener("click",function (e) {
	e.preventDefault();
	console.log(keyword);
	// location.href=`/product/search?keyword='${keyword}'`;

});




	// 등록 버튼을 마우스로 클릭하면, 이벤트 핸들러가 발생한다
	$('#regBtn').on('click', function () {
		console.log('onclicked on regBtn...');

		self.location = `/product/register?currPage=${currPage}&amount=${amount}&pagesPerPage=${pagesPerPage}`;
	});

	// excel 버튼
	$('#excel-btn').on('click', function () {
		console.log('onclicked on regBtn...');

		self.location = `/product/excel?box_no=${boxNo}`;
	});

	//페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리
	$('a.prev, a.next').on('click', function (e) {
		e.preventDefault();

		const paginationForm = $('#paginationForm')
		paginationForm.attr('action', '/product/listPerPage')
		paginationForm.attr('method', 'GET')

		//Criteria 3개 전송파라미터를 설정
		paginationForm.find('input[name=currPage]').val($(this).attr('href'));
		paginationForm.find('input[name=amount]').val(amount);
		paginationForm.find('input[name=pagesPerPage]').val(pagesPerPage);

		paginationForm.submit();
	});








