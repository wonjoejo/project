<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<c:set var="permit" value="${sessionScope.permission}"/>	
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
				<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

				<!-- bootstrap -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
					integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
					crossorigin="anonymous">

				<!-- font awesome -->

				<script src="https://kit.fontawesome.com/a959489452.js" crossorigin="anonymous"></script>

				<!-- sweet alert -->
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>

				<!-- stylesheets -->
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/group.css?ver=5">
			</head>

			<body>

								<div class="container">
					<jsp:include page="../common/boxleft.jsp"/>

					<div class="main-container">
						<div class="name">
							<h1>그룹 리스트</h1>

							<div class="but">
								<c:if test="${permit.master_per eq 0}">
									<button class="submit-btn hvr-float" id="grouppermission"><i>권한조회</i></button>
								</c:if>
								<button class="submit-btn hvr-float" id="groupcode"><i>그룹초대</i></button>
								<c:if test="${master_id ne sessionScope.member_id}">
									<button class="submit-btn hvr-float deletegroup"
											type="button"><i>그룹탈퇴</i></button>

								</c:if>
							</div>
						</div>

						<div class="scroll type2">
							<div class="group-wrapper">
								<div class="group-container">
									<c:forEach items="${list}" var="group">
										<c:if test="${group.member_stat != 1}">
										<c:choose>
											<c:when test="${master_id eq group.member_id}">
												<div class="groupmaster hvr-grow">
													<c:choose>
														<c:when test="${group.photo_name eq null}">
															<img id="profile_img"
																src="${pageContext.request.contextPath}/resources/assets/img/photo_null.png">
														</c:when>
														<c:otherwise>
															<img id="profile_img"
																src="https://intobox.s3.ap-northeast-2.amazonaws.com/profile${group.photo_name}" />
														</c:otherwise>
													</c:choose>
													<i class="fas fa-crown">
													<c:out value="${group.name}" /><br />
													<c:out value="${group.member_id}" /><br /></i>
													<c:out value="${group.phone_number}" /><br />
												</div>
											</c:when>

											<c:otherwise>
												<div class="group hvr-grow">
													<c:choose>
														<c:when test="${group.photo_name eq null}">
															<img id="profile_img"
																src="${pageContext.request.contextPath}/resources/assets/img/photo_null.png">
														</c:when>
														<c:otherwise>
															<img id="profile_img"
																src="https://intobox.s3.ap-northeast-2.amazonaws.com/profile${group.photo_name}" />
														</c:otherwise>

													</c:choose>
													<c:out value="${group.name}" /><br />
													<c:out value="${group.member_id}" /><br />
													<c:out value="${group.phone_number}" /><br />

												</div>
											</c:otherwise>
										</c:choose>
										</c:if>
									</c:forEach>
								</div>
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
				const boxNo = '${box_no}';
				const loginId = '${sessionScope.member_id}';
				const masterId = '${master_id}';
				const memberId = '${group.member_id}'
			</script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/grouplist.js"></script>
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

			</script>

			</html>
