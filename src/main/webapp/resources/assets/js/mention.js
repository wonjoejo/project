console.log(members);


function findMatches(wordToMatch, members) {
	return members.filter((member) => {
		const regex = new RegExp(wordToMatch, "gi");
		return member.name.match(regex);
	});
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function displayMatches() {
	console.log(this.value);
		const matchArray = findMatches(this.value, members);
		const html = matchArray
			.map((member) => {
				const regex = new RegExp(this.value, "gi");
				const memberName = member.name.replace(
					regex,
					`<span class="hl">${this.value}</span>`
				);
				return `
    <li>
        <span class="name">${member.name}</span>
    </li>
    `;
			})
			.join("");
		suggestions.innerHTML = html;

}

// window.addEventListener("keyup", (e) => console.log(e));

const searchInput = document.querySelector(".search");
const suggestions = document.querySelector(".suggestions");
const memo = document.querySelector(".detail-memo");

memo.addEventListener("change", displayMatches);
memo.addEventListener("keyup", function (e) {
	const keyCode = e.keyCode;
	if(keyCode===50) {
		displayMatches()
	}
});
