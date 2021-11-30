<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<html>

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
									<!-- 임시 -->
									<button class="submit-btn hvr-float" id="permissionBtn"><i>권한설정</i></button>
								</c:if>
								<button class="submit-btn hvr-float" id="groupcode"><i>그룹초대</i></button>
								<a
									href="${pageContext.request.contextPath}/box/list?member_id=${sessionScope.member_id}">
									<button class="box-list-btn hvr-float"><i class="fas fa-list-ul list-icon"></i>박스
										리스트</button>
								</a>
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
														<td>
															<c:choose>
																<c:when test="${group.photo_name eq null}">
																	<img id="profile_permission"
																		src="${pageContext.request.contextPath}/resources/assets/img/photo_null.png">
																</c:when>
																<c:when test="${fn:contains(photo_name, 'kakao')}">
																	<a
																		href="${pageContext.request.contextPath}/member/myPage?member_id=${member_id}">
																		<img id="profile_img"
																			src="${group.photo_name}" /></a>
																</c:when>
																<c:otherwise>
																	<img id="profile_permission"
																		src="https://intobox.s3.ap-northeast-2.amazonaws.com/profile${group.photo_name}" />
																</c:otherwise>
															</c:choose>
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
				const boxNo = '${box_no}';
				const loginId = '${sessionScope.member_id}';
				const masterId = '${master_id}';
				const memberId = '${group.member_id}';
				const ctx = '${pageContext.request.contextPath}';

			</script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/grouplist.js?ver=1"></script>

			</html>
