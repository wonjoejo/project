<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ page session="false" %>
			<html>

			<style>
				#per {
					width: 25%;
				}

				#pertable {

					text-align: center;
					align-items: center;
					width: 100%;
					margin: 1%;
					border-collapse: separate;
					border-spacing: 0 10px;
				}


				table td {
					width: 100px;
				}

				#profile_img {
					width: 65%;
				}

				.scroll {
					overflow-y: auto;
					overflow-x: hidden;
					width: 100%;
					height: 350px;
				}

				/* 스크롤바 설정*/
				.type2::-webkit-scrollbar {
					width: 8px;
				}

				/* 스크롤바 막대 설정*/
				.type2::-webkit-scrollbar-thumb {
					height: 17%;
					background-color: rgb(72, 75, 218);
					border-radius: 10px;
				}

				/* 스크롤바 뒷 배경 설정*/
				.type2::-webkit-scrollbar-track {
					background-color: rgba(142, 200, 248, 0.288);
				}

				.form-switch {
					display: flex;
					justify-content: center;

				}


				.groupout {

					color: white;
					background: crimson;
					border: none;
					border-radius: 50px;
					margin: 0;
					padding: 0.5rem 0.5rem;

				}

				#permission_o {
					width: 45px;
					height: 22px;
				}

				#permission_x {
					width: 45px;
					height: 22px;
				}
			</style>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
				crossorigin="anonymous">

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

				<!-- stylesheets -->
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/group.css?ver=3">
			</head>

			<body>

				<div class="container">
					<jsp:include page="../common/boxleft.jsp" />

					<div class="main-container">
						<div class="name">
							<h1>그룹 설정</h1>
						</div>
						<form id = "permissionform">
							<div class="buttons">
								<input class="submit-btn hvr-float" type="submit" onclick="submitpermission" value="저장 ">

								<input class="submit-btn hvr-float" type="button" value="그룹 초대">
								<button class="submit-btn hvr-float" type="button" onclick="alert('정말?')">그룹탈퇴</button>
							</div>

							<div class="group-wrapper2">
								<div class="group-container">
									<div class="scroll type2">
										<table id="pertable">
											<thead>
												<tr style="font-size: 1.2rem;">
													<th>프로필</th>
													<th>이름</th>
													<th>아이디</th>
													<th>읽기</th>
													<th>쓰기</th>
													<th>수정</th>
													<th>삭제</th>
													<th>마스터</th>
													<th>Exit</th>

												</tr>
											</thead>
											<c:forEach items="${list}" var="group">
												<c:if test="${group.member_stat != 1}">
													<tbody>
														<tr>
															<td><img id="profile_img"
																	src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true">
															</td>
															<td>
																<c:out value="${group.name}" />
															</td>
															<td>
																<c:out value="${group.member_id}" />
															</td>
															<td>
																<c:choose>
																	<c:when test="${group.read_per == 0}">
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_o"
																				checked="0" value="">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_x"
																				value="">
																		</div>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${group.write_per == 0}">
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_o"
																				checked="0" value="0">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_x"
																				value="1">
																		</div>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${group.edit_per == 0}">
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_o"
																				checked="0" value="0">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_x"
																				value="1">
																		</div>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${group.delete_per == 0}">
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_o"
																				checked="0" value="0">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_x"
																				value="1">
																		</div>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${group.master_per == 0}">
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_o"
																				checked="0" value="0">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-switch">
																			<input class="form-check-input" name="permissioncheak"
																				type="checkbox" id="permission_x"
																				value="1">
																		</div>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<button class="groupout" type="submit" 
																	onclick="alert('진짜?')"><i
																		class="fas fa-user-times"></i></button>
															</td>

														</tr>
													</tbody>
												</c:if>
											</c:forEach>
										</table>
									</div>

								</div>

							</div>
						</form>
					</div>
				</div>

			</body>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
			<script>
				//설정 저장하기 

			</script>

			</html>