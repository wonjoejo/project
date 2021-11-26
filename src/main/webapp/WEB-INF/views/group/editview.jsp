<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>GroupList</title>
    <c:set var="member_id" value="${sessionScope.member_id}"/>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/group.css?ver=5">
</head>

<body>

<div class="container">
    <jsp:include page="../common/boxleft.jsp"/>

    <div class="main-container">
        <div class="name">
            <h1>그룹 설정</h1>
        </div>

        <div class="buttons">
            <input class="submit-btn submit-permit hvr-float" type="submit" value="저장">
            <input class="submit-btn hvr-float master-btn" type="button" value="그룹 양도">
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
                            <th>추방</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="group">
                            <form>
                                <c:if test="${group.member_stat != 1}">
                                    <input type="hidden" name="box_no" value="${box_no}">
                                    <tr>
                                        <td><img id="profile_img"
                                                 src="https://github.com/Jeong-YuJeong/jeong_bit07/blob/master/images/song_1.png?raw=true">
                                        </td>
                                        <td>
                                            <c:out value="${group.name}"/>
                                        </td>
                                        <td>
                                            <c:out value="${group.member_id}"/>
                                            <input class="member_id" type="hidden" name="member_id"
                                                   value="${group.member_id}">
                                        </td>
                                        <td>
                                            <c:choose>
                                            <c:when test="${group.read_per == 0}">
                                            <div class="form-switch">
                                                <input class="form-check-input read_per checked"
                                                       name="read_per"
                                                       type="checkbox" id="permission_o"
                                                       checked value="0">
                                                <input type="hidden" name="read_per" value="1"
                                                       class="unchecked" disabled>
                                            </div>
                                        </td>

                                        </c:when>
                                        <c:otherwise>
                                            <div class="form-switch">
                                                <input class="form-check-input read_per checked"
                                                       name="read_per"
                                                       type="checkbox" id="permission_x"
                                                       value="1">
                                                <input type="hidden" name="read_per" value="1"
                                                       class="unchecked">
                                            </div>
                                            </td>

                                        </c:otherwise>
                                        </c:choose>


                                        <td>
                                            <c:choose>
                                                <c:when test="${group.write_per == 0}">
                                                    <div class="form-switch">
                                                        <input class="form-check-input write_per checked"
                                                               name="write_per"
                                                               type="checkbox" id="permission_o"
                                                               checked value="0">
                                                        <input type="hidden" name="write_per" value="1"
                                                               class="unchecked" disabled>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="form-switch">
                                                        <input class="form-check-input write_per checked"
                                                               name="write_per"
                                                               type="checkbox" id="permission_x"
                                                               value="1">
                                                        <input type="hidden" name="write_per" value="1"
                                                               class="unchecked">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${group.edit_per == 0}">
                                                    <div class="form-switch">
                                                        <input class="form-check-input edit_per checked"
                                                               name="edit_per"
                                                               type="checkbox" id="permission_o"
                                                               checked value="0">
                                                        <input type="hidden" name="edit_per" value="1"
                                                               class="unchecked" disabled>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="form-switch">
                                                        <input class="form-check-input edit_per checked"
                                                               name="edit_per"
                                                               type="checkbox" id="permission_x"
                                                               value="1">
                                                        <input type="hidden" name="edit_per" value="1"
                                                               class="unchecked">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${group.delete_per == 0}">
                                                    <div class="form-switch">
                                                        <input class="form-check-input delete_per checked"
                                                               name="delete_per"
                                                               type="checkbox" id="permission_o"
                                                               checked value="0">
                                                        <input type="hidden" name="delete_per" value="1"
                                                               class="unchecked" disabled>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="form-switch">
                                                        <input class="form-check-input delete_per checked"
                                                               name="delete_per"
                                                               type="checkbox" id="permission_x"
                                                               value="1">
                                                        <input type="hidden" name="delete_per" value="1"
                                                               class="unchecked">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <input type="hidden" name="master_per" value="${group.master_per}">
                                        <td>

                                        
										<button class="groupout" name="master_per" id="${group.member_id}"
												><i
												class="fas fa-user-times groupout"></i></button>	

                                        </td>

                                    </tr>

                                </c:if>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
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
	const memberId = '${sessionScope.member_id}';
	const memberId2 = '${member_id}';
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/group.js"></script>

</html>
