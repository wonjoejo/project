<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ page session="false" %>

				<html>
				<style>
					.but {
						display: flex;
						justify-content: flex-end;
					}
				</style>


				<head>
					<title>GroupList</title>

					<!-- favicon -->
					<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
						sizes="16x16">
					<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png"
						sizes="16x16">

					<!-- bootstrap -->
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
						rel="stylesheet"
						integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
						crossorigin="anonymous">

					<!-- font awesome -->
					<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

					<!-- sweet alert -->
					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>

					<!-- stylesheets -->
					<link rel="stylesheet"
						href="${pageContext.request.contextPath}/resources/assets/css/group.css?ver=4">
				</head>


				<body>

					<div class="container">
						<jsp:include page="../common/boxleft.jsp" />

						<div class="main-container">
							<div class="name">
								<h1>그룹 리스트</h1>


								<div class="but">
									<button class="submit-btn hvr-float" id="grouppermission"><i>권한설정</i></button>
									<button class="submit-btn hvr-float" id="groupcode"><i>그룹초대</i></button>
									<c:if test="${master_id ne sessionScope.member_id}">
										<button class="submit-btn hvr-float deletegroup"
											type="button"><i>그룹탈퇴</i></button>
									</c:if>
								</div>
							</div>

							<div class="group-wrapper">
								<div class="group-container">
									<c:forEach items="${list}" var="group">
										<div class="group hvr-grow">
											<c:if test="${master_id eq group.member_id}">
												Master
											</c:if>
											<img id="profile_img"
												src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true"
												style="width: 65%;">
											<c:out value="${group.member_id}" /><br />
											<c:out value="${group.name}" /><br />
											<c:out value="${group.phone_number}" /><br />
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>


				</body>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
					crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>
				<script>
				</script>



				<script>
					//권한 설정페이지로 이동
					$(document).ready(function () {
						$("#grouppermission").click(function () {
							location.href = "${pageContext.request.contextPath}/group/permissionlist?box_no=${box_no}";
						})

						$("#groupcode").click(function () {
							Swal.fire('초대 번호 "${box_no}" 입니다.')
						})

					})

					//회원 탈퇴
					const boxNo = '${box_no}';
					const loginId = '${sessionScope.member_id}';
					const deletebtn = document.querySelector('.deletegroup');
					deletebtn.addEventListener("click", function (e) {
						e.preventDefault();


						console.log(loginId);
						console.log(boxNo);

						let data = {
							member_id: loginId, // 로그인한 아이디
							box_no: boxNo // 현재 박스 번호 
						};

						Swal.fire({
							title: '해당 그룹에서 탈퇴하시겠습니까?',
							text: "탈퇴하시는 경우 박스 또한 리스트에서 사라집니다.",
							icon: 'warning',
							showCancelButton: true,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: 'YES'
						}).then((result) => {
							if (result.isConfirmed) {
								fetch(`/group/groupout`, {
									method: 'POST',
									headers: {
										'Content-Type': 'application/json'
									},
									body: JSON.stringify(data), // memberId와 boxNo
									redirect: 'follow'

								}).then(function (response) {
									if (response.ok) {
										return response.json();
									}
								}).then(function (data) {
									console.log(data);
									if (data === "/box/list") {

										location.href = `${data}?member_id=${loginId}`
									} else {
										Swal.fire(
											'실패!'
										)
									}
								})
							}
						})
					})


				</script>



				</html>