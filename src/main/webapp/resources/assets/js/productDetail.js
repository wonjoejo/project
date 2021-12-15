// 댓글 리스트
getCommentList();

function clickMention() {
	// 태그된 멘션 클릭 시 프로필 모달 팝업 띄움
	let mentionList = document.querySelectorAll(".mention");
	mentionList.forEach(function (item) {
		item.addEventListener('click', function (e) {
			e.preventDefault();
			let id;
			if (item.getAttribute("id").indexOf("@") === -1) {
				id = item.getAttribute("id");
			} else {
				id = item.getAttribute("id").substring(1);
			}

			console.log(id);

			const modalProfile = document.querySelector('#modal-profile');
			const modalId = document.querySelector('#modal-id');
			const modalName = document.querySelector('#modal-name');
			const modalMail = document.querySelector('#modal-mail');
			const modalPhone = document.querySelector('#modal-phone');

			fetch('/member/profile?member_id=' + id)
				.then((response) => {
					if (response.ok) {
						return response.json();
					}
				})
				.then((data) => {

					console.log(data);

					if (data.photo_name.indexOf('kakao') !== -1) {
						modalProfile.src = data.photo_name;
						modalId.value = id;
						modalName.value = data.name;
						modalMail.value = data.email;
						modalPhone.value = '-';
					} else if (data.photo_path === null || data.photo_path === undefined) {
						modalProfile.src = "https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png";
						modalId.value = id;
						modalName.value = data.name;
						modalMail.value = data.email;
						modalPhone.value = data.phone_number;
					} else {
						modalProfile.src = 'https://intobox.s3.ap-northeast-2.amazonaws.com/' + data.photo_path + data.photo_name;
						modalId.value = id;
						modalName.value = data.name;
						modalMail.value = data.email;
						modalPhone.value = data.phone_number;
					} // if-else

				})


		})
	})
}

function getCommentList() {

	$.ajax({
		url: "/comment/list",
		type: "GET",
		data: {
			product_no: product_no
		},
		dataType: 'json',
		success: function (data) {
			let comments = "";
			if (data.length < 1) {
				comments = '<div class = "no-comment">등록된 댓글이 없습니다.</div>';
			} else {
				$(data).each(function () {
					comments += '<div class="comment">';
					comments += '<input type="hidden" class="comment-no" name="comment_no" value="';
					comments += this.comment_no;
					comments += '">';
					comments += '<input type="text" class = "member-id list" name="member_id" value="';
					comments += this.member_id;
					comments += '" disabled>';
					comments += '<div class = "comment-content list" name="member_id">';

					if (this.comment_content.indexOf('@') !== -1) {
						const list = this.comment_content.split(' ');
						console.log(list);
						for (let i = 0; i < list.length; i++) {
							if (list[i].startsWith('@')) {
								comments += '<span class="mention detailbtn" data-bs-toggle="modal" data-bs-target="#memberModal" id="' + list[i].substring(1) + '">' + list[i] + '</span>';
							} else {
								comments += '<span class="text">&nbsp;' + list[i] + '</span>';
							}
						}
					} else {
						comments += '<span class="text">' + this.comment_content + '</span>';
					}

					comments += '</div>';
					comments += '<div class="reg-date">';
					comments += this.reg_date;
					comments += '</div>';
					comments += '<div class = "comment-button">';
					// comments += '<a href = "#" id="comment-modify" class = "comment-modify"><i class="fas fa-pencil-alt"></i></a>';
					if (this.member_id === member_id) {
						comments += '<a href = "#" id="comment-delete" class = "comment-delete"><i class="fas fa-trash-alt"></i></a>';
					}
					comments += '<a href = "#" id="comment-modify" class = "comment-modify-complete"><i class="fas fa-check"></i></a>';
					comments += '<a href = "#" id="comment-delete" class = "comment-modify-cancel"><i class="fas fa-times"></i></a>';
					comments += '</div>';
					comments += '</div>';
				});
			} // if-else

			$("#comment-box").html(comments);

			clickMention();

			// 삭제
			const deleteBtn = document.querySelectorAll('.comment-delete');
			deleteBtn.forEach(function (item) {
				item.addEventListener("click", function (e) {
					e.preventDefault();

					const commentNo = item.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling;

					const data = {
						comment_no: commentNo.value
					};

					console.log(data);

					fetch('/comment/delete', {
						method: 'POST',
						body: JSON.stringify(data),
						headers: {
							'Content-Type': 'application/json'
						}
					})
						.then(function (response) {
							if (response) getCommentList();
						})

						.catch(function (error) {
							console.log(error)
						}); // fetch

				}); // click
			}); // delete forEach


		} // success

	}); // ajax

} // getCommentList


// 댓글 등록
document.querySelector('#insertBtn').addEventListener("click", insertComment);

function insertComment() {

	const data = {
		member_id: document.querySelector('#memberId').value,
		product_no: document.querySelector('#productNo').value,
		comment_content: document.querySelector('#commentContent').value
	};

	console.log(data);

	if (document.querySelector('#commentContent').value === ""){
		Swal.fire({
			icon: 'warning',
			text: '댓글을 입력해주세요.',
		});
	} // if

	fetch('/comment/insert', {
		method: 'POST',
		body: JSON.stringify(data),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(function (response) {

			if (response) {
				// 리스트 불러오기
				getCommentList();
				// 입력창 초기화
				document.querySelector('#commentContent').value = "";
				// 댓글 등록 후, mentions 배열에 있던 것들 삭제 (초기화)
				for (let i = 0; i < mentions.length + 1; i++) {
					mentions.pop()
				}
			}
		})
		.catch(function (error) {
			console.log(error);
		}); // fetch

} // insertComment

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
						$('.suggestions').empty();
					}
				} // 이미 써있는거 대체
			})
		}

	});


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
        <span class="mention-id">${member.member_id}</span>
    </li>
    `;
		})
		.join("");
	suggestions.innerHTML = html;

	clickName();

} // displayMatches


// 목록에서 선택 시 클릭한 id가 input 창에 반영
function clickName() {
	const names = document.querySelectorAll('.mention-id');
	console.log("click!");
	names.forEach(function (item) {
		item.addEventListener('click', function (e) {
			e.preventDefault();
			console.log(item);
			mentions.push(`${item.innerHTML}`);
			let text = "";
			console.log(mentions);
			for (let i = 0; i < mentions.length; i++) {

				if (mentions[i] === '') {
					mentions.splice(i, 1);
				}

				text += `@${mentions[i]} `;
			}
			console.log(text);
			comment.value = text;
			comment.focus();
			$('.suggestions').empty();
		})

	})
}







