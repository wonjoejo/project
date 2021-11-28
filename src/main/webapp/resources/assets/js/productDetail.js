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

			fetch('/member/profile?member_id=' + id)
				.then((response) => {
					if (response.ok) {
						return response.json();
					}
				})
				.then((data) => {
					let comments = "";
					console.log(data);
					if (data.photo_path === null || data.photo_path === undefined) {
						comments += '<div class = "modal-dialog">';
						comments += '<div class = "modal-content">';
						comments += '<div class = "modal-header">';
						comments += '<h5 class = "modal-title" id = "memberModalLabel"> 회원 상세정보 </h5>';
						comments += '<button type = "button" class = "btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
						comments += '</div>';
						comments += '<div class="modal-body">';
						comments += '<div class="modal-item">';
						comments += '<img id="modal-profile" src="https://intobox.s3.ap-northeast-2.amazonaws.com/default/profile_default.png">';
						comments += '<div class = "modal-input">';
						comments += '<input id = "modal-id" value="';
						comments += id;
						comments += '" readonly/>';
						comments += '</div>';
						comments += '<div class = "modal-input">';
						comments += '<input id = "modal-name" value="';
						comments += data.name;
						comments += '" readonly/>';
						comments += '</div>';
						comments += '<div class = "modal-input">';
						comments += '<input id = "modal-mail" value="';
						comments += data.email;
						comments += '" readonly/>';
						comments += '</div>';
						comments += '<div class = "modal-input">';
						comments += '<input id = "modal-phone" value="';
						comments += data.phone_number;
						comments += '" readonly/>';
						comments += '</div>';
						comments += '</div>';
						comments += '</div>';
						comments += '<ul class="bg-bubbles">';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '<li></li>';
						comments += '</ul>';
						comments += '</div>';
						comments += '</div>';

					} else {
						Swal.fire({
							title: id,
							html: '<i class="far fa-user-circle"></i>' + data.name + '<br><i class="far fa-envelope-open"></i>' + data.email + '<br><i class="fas fa-mobile-alt"></i>' + data.phone_number,
							imageUrl: 'https://intobox.s3.ap-northeast-2.amazonaws.com/' + data.photo_path + data.photo_name,
							imageWidth: 200,
							imageHeight: 200,
							imageAlt: 'Custom image',
						})

					} // if-else

					$('#memberModal').html(comments);
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
						for (let i = 0; i < list.length; i++) {
							if (list[i].startsWith('@')) {
								comments += '<span class="mention" id="' + list[i].substring(1) + '">' + list[i] + '</span>';
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


			// 수정 버튼 클릭 시 수정 폼 변경 -> 수정 보류 (사유: 멘션 수정 불가)
			// const modifyBtn = document.querySelectorAll('.comment-modify');
			// modifyBtn.forEach(function (item) {
			// 	item.addEventListener("click", function (e) {
			// 		e.preventDefault();
			// 		console.log(item.parentElement.previousElementSibling.previousElementSibling);
			//
			// 		const checkBtn = item.nextElementSibling.nextElementSibling;
			// 		const cancelBtn = item.nextElementSibling.nextElementSibling.nextElementSibling;
			// 		const commentNo = item.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling;
			// 		const memberId = item.parentElement.previousElementSibling.previousElementSibling.previousElementSibling;
			// 		const commentContent = item.parentElement.previousElementSibling.previousElementSibling.children;
			// 		const commentDiv = item.parentElement.previousElementSibling.previousElementSibling;
			// 		const comment = document.querySelector(".comment");
			//
			//
			// 		console.log(commentContent);
			// 		let context = "";
			//
			// 		for (let i = 0; i < commentContent.length; i++) {
			// 			context += commentContent[i].innerHTML;
			// 		}
			//
			// 		console.log(context);
			//
			// 		commentDiv.remove();
			//
			// 		let input = document.createElement("input");
			// 		input.type = "text";
			// 		input.name = "comment_content";
			// 		input.value = context;
			// 		input.classList.add("commentContent");
			// 		input.id = "commentContent"
			// 		comment.appendChild(input);
			//
			//
			// 		const commentInput = document.querySelector(".commentContent");
			//
			//
			// 		// commentContent.commmentContent.disabled = false;
			// 		commentInput.style.border = "1px solid #ADADAD";
			// 		item.style.display = "none";
			// 		item.nextElementSibling.style.display = "none";
			// 		checkBtn.style.display = "inline";
			// 		cancelBtn.style.display = "inline";
			//
			// 		// 취소 버튼
			// 		cancelBtn.addEventListener("click", getCommentList);

			// 		// 수정
			// 		checkBtn.addEventListener("click", function (e) {
			// 			e.preventDefault();
			//
			// 			const data = {
			// 				comment_no: commentNo.value,
			// 				member_id: memberId.value,
			// 				product_no: product_no,
			// 				comment_content: commentInput.value
			// 			};
			//
			// 			console.log(data);
			//
			// 			fetch('/comment/edit', {
			// 				method: 'POST',
			// 				body: JSON.stringify(data),
			// 				headers: {
			// 					'Content-Type': 'application/json'
			// 				}
			// 			})
			// 				.then(function (response) {
			// 					if (response) getCommentList();
			// 				})
			//
			// 				.catch(function (error) {
			// 					console.log(error)
			// 				}); // fetch
			//
			// 		}); // click
			// 	}); // click
			// }); // modifyBtn forEach

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

	fetch('/comment/insert', {
		method: 'POST',
		body: JSON.stringify(data),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(function (response) {
			if (response) {
				getCommentList();
				document.querySelector('#commentContent').value = "";
			}
		})
		.catch(function (error) {
			console.log(error);
		}); // fetch

}
; // insertComment


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







