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

		memo.addEventListener("keyup", (e) => {
			const keyCode = e.keyCode; // e.keyCode 어떤 key를 눌렀는지 찾아올 수 있음
			console.log("keyup");
			if (keyCode === 50) { // @
				memo.addEventListener("keyup", displayMatches);
			}

			for (let i = 0; i < mentions.length + 1; i++) {
				mentions.pop()
			}

			if (memo.value.indexOf('@') === -1) {
				$('.suggestions').empty();
			} // @가 없을 경우 결과창 지우기

			// 백스페이스 눌렀을 때 다른 suggestions 추천해줘야 함
			if (keyCode === 8) {
				let taggedIds = memo.value.replace(" ", "").split('@');
				console.log(taggedIds);
				mentions = taggedIds;
				console.log(mentions);

				console.log(taggedIds.length);
				if (taggedIds.length === 1) {
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

// 매칭되는 멤버 리스트 보여주는 함수
function displayMatches() {
	console.log("displayMatches");

	// @ 제외하고 아이디 찾기
	let tagedIds = this.value.replace(" ", "").split('@');

	const matchArray = findMatches(tagedIds[tagedIds.length - 1], members);
	console.log(matchArray);

	// 옆에 해당하는 아이디 리스트 출력
	const html = matchArray
		.map((member) => {
			const regex = new RegExp(tagedIds[tagedIds.length - 1], "gi");
			const memberName = member.member_id.replace(
				regex,
				`<span class="hl">${tagedIds[tagedIds.length - 1]}</span>`
			);
			return `
    <li>
        <span class="mention-id">${member.member_id}</span>
    </li>
    `;
		})
		.join("");
	suggestions.innerHTML = html;
	// 검색해서 표시되는 것까지

	clickName();

} // displayMatches

// 목록에서 선택 시 클릭한 id가 input 창에 반영
function clickName() {
	// 후보군 전체 불러오기
	const names = document.querySelectorAll('.mention-id');
	names.forEach(function (item) {
		// click한 하나를 mentions 배열에 넣기
		item.addEventListener('click', function (e) {
			e.preventDefault();
			console.log(item);
			mentions.push(`${item.innerHTML}`);
			let text = "";
			console.log(mentions);

			for (let i = 0; i < mentions.length; i++) {

				// 처음 @ 했을 때 공백이 생겨서 없애기
				if (mentions[i] === '') {
					mentions.splice(i, 1);
				}

				// 값이 없으면 -1 반환
				if (mentions[i].indexOf('@') === -1) {
					text += `@${mentions[i]} `;
				} else {
					text += `${mentions[i]} `;
				}


			}
			console.log(text);
			console.log(memo.value); // value가 공백이 아니라 앞에 쓴 memo가 있을 때 내용 유지
			if (memo.value !== "") {
				memo.value = memo.value.substring(memo.value.length - 1, -1) + text; // 1을 쓰면 맨 앞 글자 날아가는 오류
				// @는 이미 붙여주기 때문에 기존 value값에서 @ 제외한 text를 가져오기
			} else {
				memo.value = text;
			}
			memo.focus();
			$('.suggestions').empty();
		})
	})
}


clickMention();

// 태그된 멘션 클릭 시 프로필 모달 팝업 띄움
let mentionList = document.querySelectorAll(".mention");

function clickMention() {
	mentionList.forEach(function (item) {
		item.addEventListener('click', function (e) {
			e.preventDefault();
			let id = item.getAttribute("id").substring(1);
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
}

