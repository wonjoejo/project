console.log("Product insert page");

const members = [];
const searchInput = document.querySelector(".search");
const suggestions = document.querySelector(".suggestions");
const memo = document.querySelector(".detail-memo");
let mentions = [];

fetch("/group/json", {
	method: "POST",
	headers: {
		"Content-Type": "application/json; charset=UTF-8"
	},
	body: JSON.stringify({
		box_no: `${box_no}`
	})
}).then((response) => response.json())
	.then((data) => {
		members.push(...data);

		// memo.addEventListener("keydown", function (e) {
		// 	const keyCode = e.keyCode;
		// 	if (keyCode === 50) {
		// 		console.log("keydown");
		// 		memo.addEventListener("change", displayMatches);
		// 	}
		// });
		memo.addEventListener("keyup", (e) => {
			const keyCode = e.keyCode;
			console.log("keyup");
			if (keyCode === 50) { // @
				memo.addEventListener("keyup", displayMatches);
			}

			if (memo.value.indexOf('@') === -1) {
				$('.suggestions').empty();
			} // @가 없을 경우 결과창 지우기

			if (keyCode === 8) {
				let taggedIds = memo.value.replace(" ", "").split('@');
				console.log(taggedIds);
				mentions = taggedIds;
				console.log(mentions);

				console.log(taggedIds.length);
				if (taggedIds.length === 1) {
					console.log("..?");
					$('.suggestions').empty();
				}
			} // 이미 써있는거 대체
		})


	});

console.log(members);


function findMatches(wordToMatch, members) {
	return members.filter((member) => {
		const regex = new RegExp(wordToMatch, "gi");
		return member.member_id.match(regex);
	});
} //findMatches


function displayMatches() {
	console.log("displayMatches");

	let tagedIds = this.value.replace(" ", "").split('@');

	const matchArray = findMatches(tagedIds[tagedIds.length - 1], members);
	console.log(matchArray);

	const html = matchArray
		.map((member) => {
			const regex = new RegExp(tagedIds[tagedIds.length - 1], "gi");
			const memberName = member.member_id.replace(
				regex,
				`<span class="hl">${tagedIds[tagedIds.length - 1]}</span>`
			);
			return `
    <li>
        <span class="name">${member.member_id}</span>
    </li>
    `;
		})
		.join("");
	suggestions.innerHTML = html;

	clickName();

} // displayMatches

// 목록에서 선택 시 클릭한 id가 input 창에 반영
function clickName() {
	const names = document.querySelectorAll('.name');
	names.forEach(function (item) {
		item.addEventListener('click', function (e) {
			e.preventDefault();
			console.log(item);
			mentions.push(`${item.innerHTML}`);
			let text = "";
			console.log(mentions);
			for (let i = 0; i < mentions.length; i++) {

				if (mentions[i] === '') {
					console.log("if문..?");
					mentions.splice(i, 1);
				}

				text += `@${mentions[i]} `;
			}
			console.log(text);
			memo.value = text;
			memo.focus();
			$('.suggestions').empty();
		})
	})
}


// 태그된 멘션 클릭 시 프로필 모달 팝업 띄움
const mentionList = document.querySelectorAll(".mention");

mentionList.forEach(function (item) {
	item.addEventListener('click', function (e) {
		e.preventDefault();
		let id = item.getAttribute("id");
		console.log(id);

		fetch(`/member/profile?member_id=${id}`)
			.then((response) => {
				if (response.ok) {
					return response.json();
				}
			})
			.then((data) => {
				console.log(data);
				if (data.photo_path === null || data.photo_path === undefined) {
					Swal.fire({
						title: `${id}`,
						html: `<i class="far fa-user-circle"></i> ${data.name}<br><i class="far fa-envelope-open"></i> ${data.email}<br><i class="fas fa-mobile-alt"></i> ${data.phone_number}`,
						imageUrl: `https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png`,
						imageWidth: 200,
						imageHeight: 200,
						imageAlt: 'Custom image',
					})
				} else {
					Swal.fire({
						title: `${id}`,
						html: `<i class="far fa-user-circle"></i> ${data.name}<br><i class="far fa-envelope-open"></i> ${data.email}<br><i class="fas fa-mobile-alt"></i> ${data.phone_number}`,
						imageUrl: `https://intobox.s3.ap-northeast-2.amazonaws.com/${data.photo_path}${data.photo_name}`,
						imageWidth: 200,
						imageHeight: 200,
						imageAlt: 'Custom image',
					})

				}

			})


	})
})

// const memoWindow = document.querySelector("#detail-memo");
//
// console.log(memoWindow.innerText);
//
// if (memoWindow.innerText.indexOf('@') !== -1) {
// 	let idx = memoWindow.innerText.indexOf('\n');
// 	let text = memoWindow.innerText.substr(0, idx);
// 	let ids = text.replace(" ", "").split('@');
//
// 	console.log(ids);
//
// 	for (let i = 1; i < ids.length; i++) {
// 		let span = document.createElement("span");
// 		span.innerHTML = ids[i];
// 	}
// }
