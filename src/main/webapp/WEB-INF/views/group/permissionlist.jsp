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
					
				<!-- stylesheets -->
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/group.css?ver=4">
			</head>

			<body>

				<div class="container">
					<jsp:include page="../common/boxleft.jsp" />

					<div class="main-container">
						<div class="name">
							<h1>권한 리스트</h1>

							<div class="but">

							<c:if test="${isMaster==true}">
								<!-- 임시  --> 
									<button class="submit-btn hvr-float" id="grouppermission"><i>권한설정</i></button>
							 </c:if> 
									<button class="submit-btn hvr-float" id="groupcode"><i>그룹초대</i></button>
							</div>
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

											</tr>
										</thead>
										<c:forEach items="${list}" var="group">
											<c:if test="${group.member_stat != 1}">
												<tbody>
													<tr>
														<td><img id="profile_img"
																src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true">
														</td>
														<td><c:out value="${group.name}"/></td>
														<td>
															<c:out value="${group.member_id}" />
														</td>
														<td>
															<c:choose>
																<c:when test="${group.read_per == 0}">
																	<img id="per"
																		src="/resources/assets/img/per_o.png" />
																</c:when>
																<c:otherwise>
																	<img id="per"
																		src="/resources/assets/img/per_x.png" />
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${group.write_per == 0}">
																	<img id="per"
																		src="/resources/assets/img/per_o.png" />
																</c:when>
																<c:otherwise>
																	<img id="per"
																		src="/resources/assets/img/per_x.png" />
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${group.edit_per == 0}">
																	<img id="per"
																		src="/resources/assets/img/per_o.png" />
																</c:when>
																<c:otherwise>
																	<img id="per"
																		src="/resources/assets/img/per_x.png" />
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${group.delete_per == 0}">
																	<img id="per"
																		src="/resources/assets/img/per_o.png" />
																</c:when>
																<c:otherwise>
																	<img id="per"
																		src="/resources/assets/img/per_x.png" />
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${group.master_per == 0}">
																	<img id="per"
																		src="/resources/assets/img/per_o.png" />
																</c:when>
																<c:otherwise>
																	<img id="per"
																		src="/resources/assets/img/per_x.png" />
																</c:otherwise>
															</c:choose>
														</td>

													</tr>
												</tbody>
											</c:if>
										</c:forEach>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>

			</body>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.10/dist/sweetalert2.all.min.js"></script>
			<script>
				//권한 설정페이지로 이동
				$(document).ready(function () {
					$("#grouppermission").click(function () {
						location.href = "${pageContext.request.contextPath}/group/editview?box_no=${box_no}";

					})
					
					$("#groupcode").click(function(){
							Swal.fire('초대 번호 "${box_no}" 입니다.')							
					})
					
				})



			</script>

			</html>