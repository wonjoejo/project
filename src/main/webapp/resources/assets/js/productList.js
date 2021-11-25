// page, buttons
// 물품 검색 (autocomplete)

const productContainer = document.querySelector('.product-container');
const pagination = document.querySelector('.pagination');
const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));


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
				terms.pop();

				terms.push(ui.item.value);

				const jsonData = {
					keyword: ui.item.value,
					box_no: boxNo
				}

				console.log("jsonDate : " + jsonData);

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

						$('.product-container').empty();
						$('.pagination').empty();

						const totalAmount = data.length;
						const dataPerPage = 5;
						let curr = 1;
						let endNum = Math.ceil(curr / dataPerPage) * dataPerPage;

						let startNum = endNum - (dataPerPage - 1);
						const realEndNum = Math.ceil(totalAmount / dataPerPage);

						if (realEndNum < endNum) {
							endNum = realEndNum;
						}

						let prev = startNum > 1;
						let next = endNum < realEndNum;
						let offset = (curr - 1) * dataPerPage;

						pageMaker(prev, next, startNum, endNum, curr);
						printList(offset, dataPerPage, data);

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


function printList(startNum, dataPerPage, data) {

	console.log(data.length);

	let endNo = startNum + dataPerPage;

	for (let i = startNum; i < endNo; i++) {

		console.log(startNum);
		console.log(endNo);

		let div = document.createElement("div");

		div.classList.add("product-list-container");
		div.id = 'product-list';

		let div2 = document.createElement("div");

		div2.classList.add("item");
		div2.id = 'product-img';

		let img = document.createElement("img");

		if (data[i].product_photo_path === null || data[i].product_photo_path === "" || data[i].product_photo_path === undefined) {
			img.id = 'product-none-img';
		} else if (data[i].product_photo_path.includes('resource')) {
			img.id = 'product-img'
			img.src = `${ctx}${data[i].product_photo_path}${data[i].product_photo_name}`;
		} else {
			img.id = 'product-img'
			img.src = `https://intobox.s3.ap-northeast-2.amazonaws.com/${data[i].product_photo_path}${data[i].product_photo_name}`;
		}

		div2.appendChild(img);
		div.appendChild(div2);

		let div3 = document.createElement("div");
		let a = document.createElement("a");

		div3.classList.add("item");
		div3.id = "product-name";

		a.href = `${ctx}/detail?product_no=${data[i].product_no}&box_no=${data[i].box_no}`;
		a.innerHTML = data[i].product_name;

		div3.appendChild(a);

		div.appendChild(div3);

		let div4 = document.createElement("div");

		div4.classList.add("item");
		div4.id = "product-cate";

		if (data[i].cate_detail1 !== undefined) {
			let div5 = document.createElement("div");
			div5.classList.add("product-cate-1");
			div5.innerHTML = `${data[i].cate_name1} │ ${data[i].cate_detail1}`;
			div4.appendChild(div5);
		}

		if (data[i].cate_detail2 !== undefined) {
			let div5 = document.createElement("div");
			div5.classList.add("product-cate-2");
			div5.innerHTML = `${data[i].cate_name2} │ ${data[i].cate_detail2}`;
			div4.appendChild(div5);
		}

		if (data[i].cate_detail3 !== undefined) {
			let div5 = document.createElement("div");
			div5.classList.add("product-cate-3");
			div5.innerHTML = `${data[i].cate_name3} │ ${data[i].cate_detail3}`;
			div4.appendChild(div5);
		}

		if (data[i].cate_detail4 !== undefined) {
			let div5 = document.createElement("div");
			div5.classList.add("product-cate-4");
			div5.innerHTML = `${data[i].cate_name4} │ ${data[i].cate_detail4}`;
			div4.appendChild(div5);
		}

		if (data[i].cate_detail5 !== undefined) {
			let div5 = document.createElement("div");
			div5.classList.add("product-cate-5");
			div5.innerHTML = `${data[i].cate_name5} │ ${data[i].cate_detail5}`;
			div4.appendChild(div5);
		}

		div.appendChild(div4);

		let div6 = document.createElement("div");

		div6.classList.add("item");
		div6.id = "product-qtn";
		div6.innerHTML = data[i].product_qtn;

		div.appendChild(div6);

		productContainer.append(div);
	}

	const pageItem = document.querySelectorAll('.page-item');
	pageItem.forEach(function (item) {
		item.addEventListener('click', function (e) {
			e.preventDefault();

			console.log(item.getAttribute("id"));

			if (item.firstChild.firstChild.nodeName === "I") {
				// 이전 페이지
				console.log("이전, 다음페이지");

				let curr;

				if (item.getAttribute("id") === "prev") {
					curr = parseInt(item.nextElementSibling.firstChild.textContent) - 1;
				} else {
					curr = parseInt(item.previousElementSibling.firstChild.textContent) + 1;
				}

				console.log(curr);
				let offset = (curr - 1) * dataPerPage;
				let endNum = Math.ceil((curr) / dataPerPage) * dataPerPage;
				console.log("endNum: " + endNum);
				let startNum = endNum - (dataPerPage - 1);

				const totalAmount = data.length;

				const realEndNum = Math.ceil(totalAmount / dataPerPage);
				if (realEndNum < endNum) {
					endNum = realEndNum;
				}
				console.log("realEndNum: " + realEndNum);

				let prev = startNum > 1;
				let next = endNum < realEndNum;

				$('.pagination').empty();
				pageMaker(prev, next, startNum, endNum, curr);

				$('.product-container').empty();
				printList(offset, dataPerPage, data);


			} else {
				pageItem.forEach(function (i) {
					i.classList.remove("active");
				})
				item.classList.add("active");
				let curr = item.firstChild.textContent;
				let offset = (curr - 1) * dataPerPage;

				console.log(offset);

				$('.product-container').empty();
				printList(offset, dataPerPage, data);
			}
		})
	})
}

function pageMaker(prev, next, startNum, endNum, curr) {

	if (prev) {
		let li = document.createElement("li");
		li.classList.add("page-item");
		li.id = "prev";
		let a = document.createElement("a");
		a.classList.add("page-link");
		a.innerHTML = '<i class="fas fa-angle-left"></i>';
		li.appendChild(a);
		pagination.appendChild(li);
	}

	for (let i = startNum; i <= endNum; i++) {
		if (i === curr) {
			let li = document.createElement("li");
			li.classList.add("page-item");
			li.classList.add("active");
			let a = document.createElement("a");
			a.classList.add("page-link");
			a.innerHTML = `${i}`;
			li.appendChild(a);
			pagination.appendChild(li);
		} else {
			let li = document.createElement("li");
			li.classList.add("page-item");
			let a = document.createElement("a");
			a.classList.add("page-link");
			a.innerHTML = `${i}`;
			li.appendChild(a);
			pagination.appendChild(li);
		}
	}

	if (next) {
		let li = document.createElement("li");
		li.classList.add("page-item");
		li.id = "next";
		let a = document.createElement("a");
		a.classList.add("page-link");
		a.innerHTML = '<i class="fas fa-angle-right"></i>';
		li.appendChild(a);
		pagination.appendChild(li);
	}
}






