console.log("Product insert page");

const searchInput = document.querySelector(".search");
const suggestions = document.querySelector(".suggestions");
const comment = document.querySelector("#commentContent");
let mentions = [];
const members = [];

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

		if (comment !== null) {
			comment.addEventListener("keyup", (e) => {
				const keyCode = e.keyCode;
				console.log("keyup");
				if (keyCode === 50) { // @
					comment.addEventListener("keyup", displayMatches);
				}

				if (comment.value.indexOf('@') === -1) {
					$('.suggestions').empty();
				} // @가 없을 경우 결과창 지우기

				if (keyCode === 8) {
					let taggedIds = comment.value.replace(" ", "").split('@');
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
		}

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





